package org.zamedev.lib;

class Transliteration {
	static var mapBe:Map<Int,String>;

	static function __init__() {
		mapBe = new Map<Int,String>();
		TransliterationInternalBe.fillMap(mapBe);
	}

	public static function be(s:String):String {
		var r = new StringBuf();

		haxe.Utf8.iter(s, function(v) {
			r.add(mapBe.exists(v) ? mapBe[v] : "-");
		});

		var t = r.toString().toLowerCase();

		t = ~/\-{2,}/g.replace(t, "-");
		t = ~/^\-\-*/.replace(t, "");
		t = ~/\-\-*$/.replace(t, "");

		return t;
	}
}
