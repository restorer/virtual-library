package org.zamedev.virtualbooks;

import org.zamedev.lib.Transliteration;
import sys.FileSystem;

class EpubToHtmlConverter {
	static function convert(nameBe:String, ?skipPages:Int, ?allowImages:Bool, ?allowNbspPar:Bool, ?cssClass:String) {
		var name = Transliteration.be(nameBe);

		Sys.println("\"" + nameBe + "\" -> \"" + name + "\"");
		var epub = new Epub("../epub/" + name + ".epub", skipPages, allowImages, allowNbspPar);

		if (allowImages) {
			if (!FileSystem.exists("../books/" + name)) {
				FileSystem.createDirectory("../books/" + name);
			}

			epub.writeTo("../books/" + name + ".php", cssClass, "../books/" + name, "books/" + name + "/");
		} else {
			epub.writeTo("../books/" + name + ".php", cssClass);
		}
	}

	static function main() {
		convert("Эліза Ажэшка - Хам", null, null, false);
		convert("Сяргей Астравец - Райскія Яблычкі");
		convert("Максім Багдановіч - Вершы");
		convert("Васіль Быкаў - Мёртвым Не Баліць");
		convert("Данута Бічэль-Загнетава - Нёман Ідзе", null, null, null, "condensed");
		convert("Уладзімір Караткевіч - Хрыстос Прызямліўся Ў Гародні", 2);
		convert("Аляксей Карпюк - Карані");
		convert("Піліп Пестрак - Лясная Песня");
		convert("Ала Петрушкевіч - Пярсцёнак", null, null, null, "condensed");
		convert("Сцяпан Стурэйка - Разрушыцель", null, true);
	}
}
