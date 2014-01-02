package org.zamedev.lib;

import haxe.Utf8;
import org.zamedev.lib.internal.Utf8ExtInternal;

class Utf8Ext {
	#if (neko || php || cpp)
		static var lcaseMap:Map<Int,Int> = null;
		static var ucaseMap:Map<Int,Int> = null;

		static function __init__() {
			lcaseMap = new Map<Int,Int>();
			ucaseMap = new Map<Int,Int>();

			Utf8ExtInternal.fillUpperToLowerMap(lcaseMap);

			for (k in lcaseMap.keys()) {
				ucaseMap[lcaseMap[k]] = k;
			}
		}
	#end

	public static function toLowerCase(s:String):String {
		#if (neko || php || cpp)
			var r = new Utf8();

			Utf8.iter(s, function(v) {
				r.addChar(lcaseMap.exists(v) ? lcaseMap[v] : v);
			});

			return r.toString();
		#else
			return s.toLowerCase();
		#end
	}

	public static function toUpperCase(s:String):String {
		#if (neko || php || cpp)
			var r = new Utf8();

			Utf8.iter(s, function(v) {
				r.addChar(ucaseMap.exists(v) ? ucaseMap[v] : v);
			});

			return r.toString();
		#else
			return s.toUpperCase();
		#end
	}
}

/*
 * Map generator for Utf8ExtInternal
 * Can generate from ftp://ftp.unicode.org/Public/UNIDATA/CaseFolding.txt
 * Simple case folding (C + S), only CAPITAL

class CaseMapsGenerator {
	static function main() {
		var buf = new StringBuf();

		buf.add("package org.zamedev.lib;\n");
		buf.add("\n");
		buf.add("class Utf8ExtInternal {\n");
		buf.add("\tpublic static function fillUpperToLowerMap(map:Map<Int,Int>):Void {\n");

		var fi = sys.io.File.read("CaseFolding.txt", true);

		while (true) {
			var line:String;

			try {
				line = fi.readLine();
			} catch (ex:haxe.io.Eof) {
				break;
			}

			var re = ~/^([0-9A-Z]+); [CS]; ([0-9A-Z]+); #/;

			if (re.match(line)) {
				buf.add("\t\tmap[0x" + re.matched(1) + "] = 0x" + re.matched(2) + ";\n");
			}
		}

		fi.close();

		buf.add("\t}\n");
		buf.add("}\n");

		var fo = sys.io.File.write("Utf8ExtInternal.hx", true);
		fo.writeString(buf.toString());
		fo.close();
	}
}

*/
