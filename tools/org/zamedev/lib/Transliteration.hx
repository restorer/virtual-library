package org.zamedev.lib;

import org.zamedev.lib.internal.TransliterationInternalBe;

class Transliteration {
	static var mapNot:Map<Int,Bool>;
	static var mapBe:Map<Int,String>;

	static function __init__() {
		mapNot = new Map<Int,Bool>();

		haxe.Utf8.iter("0123456789ABCDEFJHIJKLMNOPQRSTUVWXYZabcdefjhijklmnopqrstuvwxyz", function(v) {
			mapNot[v] = true;
		});

		mapBe = new Map<Int,String>();
		TransliterationInternalBe.fillMap(mapBe);
	}

	public static function be(s:String):String {
		var r = new StringBuf();

		haxe.Utf8.iter(s, function(v) {
			r.add(mapBe.exists(v) ? mapBe[v] : (mapNot.exists(v) ? v : "-"));
		});

		var t = r.toString().toLowerCase();

		t = ~/\-{2,}/g.replace(t, "-");
		t = ~/^\-\-*/.replace(t, "");
		t = ~/\-\-*$/.replace(t, "");

		return t;
	}
}
