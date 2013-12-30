import sys.io.File;

using Lambda;
using StringTools;

// http://lib.haxe.org/p/HtmlParser

class EpubToHtmlConverter {
	static var entryMap:Map<String, haxe.zip.Entry>;
	static var packageRoot:String;
	static var bookAuthor:String;
	static var bookTitle:String;
	static var bookCover:String;
	static var itemMap:Map<String, String>;
	static var imageIndex:Int;
	static var imageMap:Map<String, String>;
	static var selectorToRuleMap:Map<String, String>;
	static var usedSelectorsMap:Map<String, Bool>;
	static var optimizedRulesMap:Map<String, String>;
	static var selectorToOptimizedMap:Map<String, String>;
	static var pageList:List<String>;
	static var cfgBodyClass:String;
	static var cfgSpineSkip:Int;
	static var cfgAllowNbspPar:Bool;
	static var cfgAllowImages:Bool;

	static function dirname(path:String, appendSeparator:Bool=false):String {
		return (~/\//.match(path) ? (~/\/[^\/]+$/.replace(path, "") + (appendSeparator ? "/" : "")) : "");
	}

	static function entryAsXml(entryName:String):Xml {
		var unzipped = CustomZipReader.unzip(entryMap[entryName]);
		var content = Std.string(unzipped);

		if (~/<section>/.match(content) && !~/<\/section>/.match(content)) {
			content = content.replace("</body>", "</section></body>");
		}

		return Xml.parse(content);
	}

	static function entryAsString(entryName:String):String {
		var unzipped = CustomZipReader.unzip(entryMap[entryName]);
		return Std.string(unzipped);
	}

	static function entryAsBinary(entryName:String) {
		return CustomZipReader.unzip(entryMap[entryName]);
	}

	static function itemNameToEntryName(itemName:String):String {
		return (packageRoot + itemMap[itemName]);
	}

	static function normalizePath(basePath:String, path:String):String {
		basePath = dirname(basePath);

		while (path.startsWith("../")) {
			basePath = dirname(basePath);
			path = ~/^\.\.\//.replace(path, "");
		}

		return (basePath.length == 0 ? path : basePath + "/" + path);
	}

	static function filterStyleRules(rules:String):String {
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

	static function preprocessCss(css:String, ?basePath:String) {
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
					if (basePath != null) {
						selectorToRuleMap[basePath + ":" + ire.matched(1)] = rules;
					} else {
						selectorToRuleMap[ire.matched(1)] = rules;
					}
				}
			});
		}
	}

	static function preprocessNode(root:Xml, basePath:String) {
		for (node in root) {
			if (node.nodeType != Xml.Document && node.nodeType != Xml.Element) {
				continue;
			}

			var tagName = node.nodeName.toLowerCase();

			if (cfgAllowImages && (tagName == "img" || tagName == "image")) {
				var imgPath = (tagName == "img" ? node.get("src") : node.get("xlink:href"));

				if (imgPath != null) {
					imgPath = normalizePath(basePath, imgPath);

					if (!imageMap.exists(imgPath)) {
						imageIndex++;
						imageMap[imgPath] = Std.string(imageIndex) + ~/^.+\./.replace(imgPath, ".");
					}
				}
			}

			if (node.get("class") != null) {
				node.get("class").split(" ").iter(function(v) {
					v = v.trim().toLowerCase();

					if (v.length != 0) {
						if (selectorToRuleMap.exists(basePath + ":" + tagName + "." + v)) {
							usedSelectorsMap[basePath + ":" + tagName + "." + v] = true;
						} else if (selectorToRuleMap.exists(basePath + ":." + v)) {
							usedSelectorsMap[basePath + ":." + v] = true;
						} else if (selectorToRuleMap.exists(tagName + "." + v)) {
							usedSelectorsMap[tagName + "." + v] = true;
						} else if (selectorToRuleMap.exists("." + v)) {
							usedSelectorsMap["." + v] = true;
						}
					}
				});
			}

			preprocessNode(node, basePath);
		}
	}

	static function preprocessPage(entryName:String) {
		var headNode = entryAsXml(entryName).elementsNamed("html").next().elementsNamed("head").next();

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
					preprocessCss(entryAsString(normalizePath(entryName, node.get("href"))));
				}
			}
		}

		preprocessNode(
			entryAsXml(entryName).elementsNamed("html").next().elementsNamed("body").next(),
			entryName
		);
	}

	static function optimizeCssRules() {
		var index = 0;

		for (selector in usedSelectorsMap.keys()) {
			var rule = selectorToRuleMap[selector];

			if (!optimizedRulesMap.exists(rule)) {
				index++;
				optimizedRulesMap[rule] = "s" + Std.string(index);
			}

			selectorToOptimizedMap[selector] = optimizedRulesMap[rule];
		}
	}

	static function appendClassesAndStyles(buf:StringBuf, tagName:String, node:Xml, basePath:String) {
		if (node.get("class") != null) {
			var part = node.get("class").split(" ").map(function(v) {
				v = v.trim().toLowerCase();

				if (v.length != 0) {
					if (selectorToOptimizedMap.exists(basePath + ":" + tagName + "." + v)) {
						return selectorToOptimizedMap[basePath + ":" + tagName + "." + v];
					} else if (selectorToOptimizedMap.exists(basePath + ":." + v)) {
						return selectorToOptimizedMap[basePath + ":." + v];
					} else if (selectorToOptimizedMap.exists(tagName + "." + v)) {
						return selectorToOptimizedMap[tagName + "." + v];
					} else if (selectorToOptimizedMap.exists("." + v)) {
						return selectorToOptimizedMap["." + v];
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

	static function parseNode(root:Xml, basePath:String, newlines=true):String {
		var nbspChar = new haxe.Utf8();
		nbspChar.addChar(160);

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
				if (cfgAllowImages) {
					var imgPath = (tagName == "img" ? node.get("src") : node.get("xlink:href"));

					if (imgPath != null) {
						var buf = new StringBuf();
						buf.add("<img src=\"");
						buf.add(imageMap[normalizePath(basePath, imgPath)].htmlEscape());
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
				|| (!cfgAllowNbspPar && tagName == "p" && inner == "&nbsp;")
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

	static function processPage(entryName:String) {
		var page = parseNode(
			entryAsXml(entryName).elementsNamed("html").next().elementsNamed("body").next(),
			entryName
		).trim();

		if (page.length != 0) {
			pageList.add(page);
		}
	}

	static function readEpub(fileName:String) {
		entryMap = new Map<String, haxe.zip.Entry>();

		CustomZipReader.readZip(File.read(fileName)).iter(function(v) {
			entryMap[v.fileName] = v;
		});

		var packageFileName = entryAsXml("META-INF/container.xml")
			.elementsNamed("container").next()
			.elementsNamed("rootfiles").next()
			.elementsNamed("rootfile").next()
			.get("full-path");

		var packageNode = entryAsXml(packageFileName).elementsNamed("package").next();
		var metadataNode = packageNode.elementsNamed("metadata").next();

		packageRoot = dirname(packageFileName, true);
		bookAuthor = metadataNode.elementsNamed("dc:creator").next().firstChild().nodeValue;
		bookTitle = metadataNode.elementsNamed("dc:title").next().firstChild().nodeValue;
		bookCover = null;

		for (node in metadataNode.elementsNamed("meta")) {
			if (node.get("name") == "cover") {
				bookCover = node.get("content");
				break;
			}
		}

		itemMap = new Map<String, String>();

		for (node in packageNode.elementsNamed("manifest").next().elementsNamed("item")) {
			itemMap[node.get("id")] = node.get("href");
		}

		var index:Int = 0;
		imageIndex = 0;
		imageMap = new Map<String, String>();
		selectorToRuleMap = new Map<String, String>();
		usedSelectorsMap = new Map<String, Bool>();

		for (node in packageNode.elementsNamed("spine").next().elementsNamed("itemref")) {
			if (index >= cfgSpineSkip) {
				preprocessPage(itemNameToEntryName(node.get("idref")));
			}

			index++;
		}

		optimizedRulesMap = new Map<String, String>();
		selectorToOptimizedMap = new Map<String, String>();

		optimizeCssRules();

		index = 0;
		pageList = new List<String>();

		for (node in packageNode.elementsNamed("spine").next().elementsNamed("itemref")) {
			if (index >= cfgSpineSkip) {
				processPage(itemNameToEntryName(node.get("idref")));
			}

			index++;
		}
	}

	static function generateHtml():String {
		var buf = new StringBuf();

		buf.add("<!DOCTYPE html>\n");
		buf.add("<html xmlns=\"http://www.w3.org/1999/xhtml\">\n");
		buf.add("<head>\n");
		buf.add("<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\" />\n");
		buf.add("<title>");
		buf.add((bookTitle + " - " + bookAuthor).htmlEscape());
		buf.add("</title>\n");
		buf.add("<link rel=\"stylesheet\" type=\"text/css\" href=\"../book.css\" />\n");

		if (!optimizedRulesMap.empty()) {
			buf.add("<style type=\"text/css\">\n");

			for (selector in optimizedRulesMap.keys()) {
				buf.add(".");
				buf.add(optimizedRulesMap[selector]);
				buf.add(" { ");
				buf.add(selector);
				buf.add(" }\n");
			}

			buf.add("</style>\n");
		}

		buf.add("</head>\n");
		buf.add("<body");

		if (cfgBodyClass != null) {
			buf.add(" class=\"" + cfgBodyClass.htmlEscape() + "\"");
		}

		buf.add(">\n");
		buf.add("<div class=\"wrapper\">\n");
		buf.add("<div class=\"chapter\">\n");
		buf.add(pageList.join("\n</div>\n<div class=\"chapter\">\n"));
		buf.add("</div>\n");
		buf.add("</div>\n");
		buf.add("</body>\n");
		buf.add("</html>\n");

		return buf.toString();
	}

	static function writeBook(namePart:String) {
		var fo = File.write("../books/" + namePart + "/book.new.html", true);
		fo.writeString(generateHtml());
		fo.close();

		if (cfgAllowImages) {
			for (imageName in imageMap.keys()) {
				fo = File.write("../books/" + namePart + "/" + imageMap[imageName], true);
				fo.write(entryAsBinary(imageName));
				fo.close();
			}
		}
	}

	static function convert(
		namePart:String,
		bodyClass:String=null,
		spineSkip:Int=0,
		allowNbspPar:Bool=true,
		allowImages:Bool=false
	) {
		trace("Converting " + namePart + "...");

		cfgBodyClass = bodyClass;
		cfgSpineSkip = spineSkip;
		cfgAllowNbspPar = allowNbspPar;
		cfgAllowImages = allowImages;

		readEpub("../books/" + namePart + "/book-" + namePart + ".epub");
		writeBook(namePart);
	}

	static function main() {
		convert("01", null, 0, false); // Ажэшка Эліза - Хам
		convert("02"); // Астравец Сяргей - Райскія яблычкі
		convert("03"); // Багдановіч Максім - Вершы
		convert("04"); // Быкаў Васіль - Мёртвым не баліць
		convert("05", "condensed"); // Бічэль Данута - Нёман ідзе (вершы)
		convert("06", null, 2); // Караткевіч Уладзімір - Хрыстос прызямліўся ў Гародні
		convert("07"); // Карпюк Аляксей - Карані
		convert("08"); // Пестрак Піліп - Лясная песня
		convert("09", "condensed"); // Петрушкевіч Ала - Пярсцёнак (вершы)
		convert("10", null, 0, true, true); // Стурэйка Сцяпан - Разрушыцель
	}
}
