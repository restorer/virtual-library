package org.zamedev.virtualbooks;

import org.zamedev.lib.Transliteration;

class Transliterator {
	static function main() {
		trace(Transliteration.be("Эліза Ажэшка - Хам"));
		trace(Transliteration.be("Сяргей Астравец - Райскія Яблычкі"));
		trace(Transliteration.be("Максім Багдановіч - Вершы"));
		trace(Transliteration.be("Васіль Быкаў - Мёртвым Не Баліць"));
		trace(Transliteration.be("Данута Бічэль-Загнетава - Нёман Ідзе"));
		trace(Transliteration.be("Уладзімір Караткевіч - Хрыстос Прызямліўся Ў Гародні"));
		trace(Transliteration.be("Аляксей Карпюк - Карані"));
		trace(Transliteration.be("Піліп Пестрак - Лясная Песня"));
		trace(Transliteration.be("Ала Петрушкевіч - Пярсцёнак"));
		trace(Transliteration.be("Сцяпан Стурэйка - Разрушыцель"));
	}
}
