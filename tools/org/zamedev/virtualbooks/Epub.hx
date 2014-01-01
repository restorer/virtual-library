package org.zamedev.virtualbooks;

import haxe.Utf8;
import org.zamedev.lib.FileUtils;
import org.zamedev.lib.ZipReaderExt;
import sys.io.File;

using Lambda;
using StringTools;

class Epub {
	var allowImages:Bool;
	var allowNbspPar:Bool;
	var zip:ZipReaderExt;
	var packageRoot:String;
	var nbspChar:Utf8;
	var imageIndex:Int;
	var itemMap:Map<String,String>;
	var imageMap:Map<String,String>;
	var selectorToRule:Map<String,String>;
	var usedSelectors:Map<String,Bool>;
	var optimizedRules:Map<String,String>;
	var selectorToOptimized:Map<String,String>;

	public var author:String;
	public var title:String;
	public var chapters:List<String>;

	public function new(path:String, ?skipPages:Int=0, ?allowImages:Bool=false, ?allowNbspPar:Bool=true) {
		this.allowImages = allowImages;
		this.allowNbspPar = allowNbspPar;

		nbspChar = new Utf8();
		nbspChar.addChar(160);

		imageIndex = 0;
		itemMap = new Map<String,String>();
		imageMap = new Map<String,String>();
		selectorToRule = new Map<String,String>();
		usedSelectors = new Map<String,Bool>();
		optimizedRules = new Map<String,String>();
		selectorToOptimized = new Map<String,String>();
		chapters = new List<String>();

		zip = ZipReaderExt.fromPath(path);

		var packageFileName = entryAsXml("META-INF/container.xml")
			.elementsNamed("container").next()
			.elementsNamed("rootfiles").next()
			.elementsNamed("rootfile").next()
			.get("full-path");

		var packageNode = entryAsXml(packageFileName).elementsNamed("package").next();
		var metadataNode = packageNode.elementsNamed("metadata").next();

		packageRoot = FileUtils.dirname(packageFileName, true);
		author = metadataNode.elementsNamed("dc:creator").next().firstChild().nodeValue;
		title = metadataNode.elementsNamed("dc:title").next().firstChild().nodeValue;

		for (node in packageNode.elementsNamed("manifest").next().elementsNamed("item")) {
			itemMap[node.get("id")] = node.get("href");
		}

		var index = 0;

		for (node in packageNode.elementsNamed("spine").next().elementsNamed("itemref")) {
			if (index >= skipPages) {
				preprocessPage(itemNameToEntryName(node.get("idref")));
			}

			index++;
		}

		optimizeCssRules();
		index = 0;

		for (node in packageNode.elementsNamed("spine").next().elementsNamed("itemref")) {
			if (index >= skipPages) {
				processPage(itemNameToEntryName(node.get("idref")));
			}

			index++;
		}
	}

	public function writeTo(path:String, ?cssClass:String, ?imagePath:String, ?imagePrefix:String):Void {
		var fo = File.write(path, true);
		fo.writeString("<?php\n\n");
		fo.writeString("return array(\n");
		fo.writeString("\t'cssClass' => '" + (cssClass == null ? "" : cssClass) + "',\n");
		fo.writeString("\t'author' => '" + author + "',\n");
		fo.writeString("\t'title' => '" + title + "',\n");
		fo.writeString("\t'styles' => '\n");
		fo.writeString(generateStyles());
		fo.writeString("\t',\n");
		fo.writeString("\t'chapters' => array(\n");
		fo.writeString(generateChapters(imagePrefix).join(",\n"));
		fo.writeString("\n\t),\n");
		fo.writeString(");\n");
		fo.close();

		if (allowImages && imagePath != null) {
			for (entryName in imageMap.keys()) {
				fo = File.write(imagePath + "/" + imageMap[entryName], true);
				fo.write(zip.entryAsBinary(entryName));
				fo.close();
			}
		}
	}

	function generateStyles():String {
		var buf = new StringBuf();

		for (selector in optimizedRules.keys()) {
			buf.add(".");
			buf.add(optimizedRules[selector]);
			buf.add(" { ");
			buf.add(selector);
			buf.add(" }\n");
		}

		return buf.toString();
	}

	function generateChapters(imagePrefix:String):List<String> {
		var res = new List<String>();

		for (str in chapters) {
			if (imagePrefix != null && imagePrefix.length != 0) {
				str = str.replace("<img src=\"", "<img src=\"" + imagePrefix);
			}

			res.add("'" + str.replace("'", "\\'") + "'");
		}

		return res;
	}

	// TODO: use http://lib.haxe.org/p/HtmlParser
	function entryAsXml(entryName:String):Xml {
		var content = zip.entryAsString(entryName);

		if (~/<section>/.match(content) && !~/<\/section>/.match(content)) {
			content = content.replace("</body>", "</section></body>");
		}

		return Xml.parse(content);
	}

	function itemNameToEntryName(itemName:String):String {
		return (packageRoot + itemMap[itemName]);
	}

	function filterStyleRules(rules:String):String {
		var result = rules.split(";").map(function(v) {
			var re = ~/^\s*([a-zA-Z0-9\-]+)\s*:\s*([A-Za-z0-9\s,'"%]+)\s*$/;

			if (re.match(v)) {
				return re.matched(1).toLowerCase().trim() + ":" + re.matched(2).toLowerCase().trim();
			} else {
				return null;
			}
		}).filter(function(v) {
			return (v != null && (
				v.startsWith("font-weight:")
				|| v.startsWith("text-align:")
				|| v.startsWith("font-style:")
				|| v.startsWith("text-indent:")
				|| v.startsWith("margin:0")
			));
		});

		return (result.length == 0 ? "" : result.join(";") + ";");
	}

	function preprocessPage(entryName:String) {
		var htmlNode = entryAsXml(entryName).elementsNamed("html").next();
		var headNode = htmlNode.elementsNamed("head").next();

		if (headNode != null) {
			var styleNode = headNode.elementsNamed("style").next();

			if (styleNode != null) {
				var buf = new StringBuf();

				for (node in styleNode) {
					buf.add(node.nodeValue);
				}

				preprocessCss(buf.toString(), entryName);
			}

			for (node in headNode.elementsNamed("link")) {
				if (node.get("rel") == "stylesheet") {
					preprocessCss(zip.entryAsString(FileUtils.normalize(entryName, node.get("href"))));
				}
			}
		}

		preprocessNode(
			htmlNode.elementsNamed("body").next(),
			entryName
		);
	}

	function preprocessCss(css:String, ?basePath:String):Void {
		var css = ~/\/\*.*?\*\//sgm.replace(css, "");
		var re = ~/\s*([^{]+)\s*\{([^}]*)\}/;

		while (css != null) {
			if (!re.match(css)) {
				break;
			}

			css = re.matchedRight();
			var rules = filterStyleRules(re.matched(2));

			if (rules.length == 0) {
				continue;
			}

			re.matched(1).split(",").iter(function(v) {
				var ire = ~/^\s*((?:[a-zA-Z0-9]+)?\.[a-zA-Z0-9\-_]+)\s*$/;

				if (ire.match(v)) {
					selectorToRule[(basePath == null ? "" : basePath + ":") + ire.matched(1)] = rules;
				}
			});
		}
	}

	function preprocessNode(root:Xml, basePath:String):Void {
		for (node in root) {
			if (node.nodeType != Xml.Document && node.nodeType != Xml.Element) {
				continue;
			}

			var tagName = node.nodeName.toLowerCase();

			if (allowImages && (tagName == "img" || tagName == "image")) {
				var imgPath = (tagName == "img" ? node.get("src") : node.get("xlink:href"));

				if (imgPath != null) {
					imgPath = FileUtils.normalize(basePath, imgPath);

					if (!imageMap.exists(imgPath)) {
						imageIndex++;
						imageMap[imgPath] = Std.string(imageIndex) + FileUtils.ext(imgPath);
					}
				}
			}

			if (node.get("class") != null) {
				node.get("class").split(" ").iter(function(v) {
					v = v.trim().toLowerCase();

					if (v.length != 0) {
						if (selectorToRule.exists(basePath + ":" + tagName + "." + v)) {
							usedSelectors[basePath + ":" + tagName + "." + v] = true;
						} else if (selectorToRule.exists(basePath + ":." + v)) {
							usedSelectors[basePath + ":." + v] = true;
						} else if (selectorToRule.exists(tagName + "." + v)) {
							usedSelectors[tagName + "." + v] = true;
						} else if (selectorToRule.exists("." + v)) {
							usedSelectors["." + v] = true;
						}
					}
				});
			}

			preprocessNode(node, basePath);
		}
	}

	function optimizeCssRules():Void {
		var index = 0;

		for (selector in usedSelectors.keys()) {
			var rule = selectorToRule[selector];

			if (!optimizedRules.exists(rule)) {
				index++;
				optimizedRules[rule] = "s" + Std.string(index);
			}

			selectorToOptimized[selector] = optimizedRules[rule];
		}
	}

	function processPage(entryName:String) {
		var content = parseNode(
			entryAsXml(entryName).elementsNamed("html").next().elementsNamed("body").next(),
			entryName
		).trim();

		if (content.length != 0) {
			chapters.add(content);
		}
	}

	function parseNode(root:Xml, basePath:String, newlines=true):String {
		var parts = new List<String>();

		for (node in root) {
			if (node.nodeType == Xml.Comment) {
				continue;
			}

			if (node.nodeType != Xml.Document && node.nodeType != Xml.Element) {
				var part = node.nodeValue.replace(nbspChar.toString(), "&nbsp;").trim();
				part = ~/(.)&nbsp;$/.replace(part, "$1");
				parts.add(part);
				continue;
			}

			var tagName = node.nodeName.toLowerCase();

			if (tagName == "svg") {
				parts.add(parseNode(node, basePath, false));
				continue;
			}

			if (tagName == "img" || tagName == "image") {
				if (allowImages) {
					var imgPath = (tagName == "img" ? node.get("src") : node.get("xlink:href"));

					if (imgPath != null) {
						var buf = new StringBuf();
						buf.add("<img src=\"");
						buf.add(imageMap[FileUtils.normalize(basePath, imgPath)].htmlEscape());
						buf.add("\"");
						appendClassesAndStyles(buf, tagName, node, basePath);
						buf.add(" />");
						parts.add(buf.toString());
					}
				}

				continue;
			}

			if (node.firstChild() == null) {
				var buf = new StringBuf();
				buf.add("<");
				buf.add(tagName);
				appendClassesAndStyles(buf, tagName, node, basePath);
				buf.add(" />");
				parts.add(buf.toString());
				continue;
			}

			var inner = parseNode(node, basePath, false);

			if ((inner.length == 0)
				|| ((tagName == "p" || tagName == "div") && inner == "<br />")
				|| (!allowNbspPar && tagName == "p" && inner == "&nbsp;")
			) {
				continue;
			}

			inner = ~/(.)<br \/>$/.replace(inner, "$1");

			var buf = new StringBuf();
			buf.add("<");
			buf.add(tagName);
			appendClassesAndStyles(buf, tagName, node, basePath);

			if (tagName == "a") {
				buf.add(" href=\"javascript:;\"");
			}

			buf.add(">");
			buf.add(inner);
			buf.add("</");
			buf.add(tagName);
			buf.add(">");
			parts.add(buf.toString());
		}

		return parts.filter(function(v) {
			return (v.length != 0);
		}).join(newlines ? "\n" : "");
	}

	function appendClassesAndStyles(buf:StringBuf, tagName:String, node:Xml, basePath:String):Void {
		if (node.get("class") != null) {
			var part = node.get("class").split(" ").map(function(v) {
				v = v.trim().toLowerCase();

				if (v.length != 0) {
					if (selectorToOptimized.exists(basePath + ":" + tagName + "." + v)) {
						return selectorToOptimized[basePath + ":" + tagName + "." + v];
					} else if (selectorToOptimized.exists(basePath + ":." + v)) {
						return selectorToOptimized[basePath + ":." + v];
					} else if (selectorToOptimized.exists(tagName + "." + v)) {
						return selectorToOptimized[tagName + "." + v];
					} else if (selectorToOptimized.exists("." + v)) {
						return selectorToOptimized["." + v];
					}
				}

				return null;
			}).filter(function(v) {
				return (v != null);
			}).join(" ");

			if (part.length != 0) {
				buf.add(" class=\"");
				buf.add(part.htmlEscape());
				buf.add("\"");
			}
		}

		if (node.get("style") != null) {
			var part = filterStyleRules(node.get("style"));

			if (part.length != 0) {
				buf.add(" style=\"");
				buf.add(part.htmlEscape());
				buf.add("\"");
			}
		}
	}
}
