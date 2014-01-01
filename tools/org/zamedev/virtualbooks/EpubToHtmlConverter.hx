package org.zamedev.virtualbooks;

import sys.FileSystem;

class EpubToHtmlConverter {
	static function convert(name:String, ?skipPages:Int, ?allowImages:Bool, ?allowNbspPar:Bool, ?cssClass:String) {
		trace("Converting " + name + "...");
		var epub = new Epub("../epub/" + name + ".epub", skipPages, allowImages, allowNbspPar);

		if (allowImages) {
			if (!FileSystem.exists("../books/" + name)) {
				FileSystem.createDirectory("../books/" + name);
			}

			epub.writeTo("../books/" + name + ".php", cssClass, "../books/" + name, "books/" + name + "/");
		} else {
			epub.writeTo("../books" + name + ".php", cssClass);
		}
	}

	static function main() {
		convert("eliza-azheshka-kham", null, null, false);
		convert("siarhiej-astraviets-rajskiia-jablychki");
		convert("maksim-bahdanovich-viershy");
		convert("vasil-bykaw-miortvym-nie-balits");
		convert("danuta-bichel-zahnietava-nioman-idzie", null, null, null, "condensed");
		convert("uladzimir-karatkievich-khrystos-pryziamliwsia-w-harodni", 2);
		convert("aliaksiej-karpiuk-karani");
		convert("pilip-piestrak-liasnaia-piesnia");
		convert("ala-pietrushkievich-piarstsionak", null, null, null, "condensed");
		convert("stsiapan-sturejka-razrushytsiel", null, true);
	}
}
