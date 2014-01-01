<?php

$book = null;

if (isset($_GET['book'])) {
	$bookName = preg_replace('/[^a-z0-9\-]/', '', $_GET['book']);

	if (is_readable(__DIR__ . "/books/{$bookName}.php")) {
		$book = require(__DIR__ . "/books/{$bookName}.php");
	}
}

?>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>
		<?php if ($book) : ?>
			<?php echo htmlspecialchars($book['author'] . ' - ' . $book['title']) ?>
		<?php else : ?>
			Кнігі
		<?php endif ?>
	</title>
	<link rel="stylesheet" type="text/css" href="book.css" />
	<?php if ($book && $book['styles'] != '') : ?>
		<style type="text/css">
			<?php echo $book['styles']; ?>
		</style>
	<?php endif ?>
</head>
<body
	<?php if ($book && $book['cssClass'] != '') : ?>class="<?php echo $book['cssClass'] ?>"<?php endif ?>
>
	<div class="wrapper">
		<?php if ($book) : ?>
			<div class="chapter">
				<?php echo join('</div><div class="chapter">', $book['chapters']) ?>
			</div>
		<?php else : ?>
			<h1>Кнігі</h1>
			<p style="text-align:left;">
				<a href="?book=eliza-azheshka-kham">Эліза Ажэшка &mdash; Хам</a><br />
				<a href="?book=siarhiej-astraviets-rajskiia-jablychki">Сяргей Астравец &mdash; Райскія яблычкі</a><br />
				<a href="?book=maksim-bahdanovich-viershy">Максім Багдановіч &mdash; Вершы</a><br />
				<a href="?book=vasil-bykaw-miortvym-nie-balits">Васіль Быкаў &mdash; Мёртвым не баліць</a><br />
				<a href="?book=danuta-bichel-zahnietava-nioman-idzie">Данута Бічэль&ndash;Загнетава &mdash; Нёман ідзе (вершы)</a><br />
				<a href="?book=uladzimir-karatkievich-khrystos-pryziamliwsia-w-harodni">Уладзімір Караткевіч &mdash; Хрыстос прызямліўся ў Гародні</a><br />
				<a href="?book=aliaksiej-karpiuk-karani">Аляксей Карпюк &mdash; Карані</a><br />
				<a href="?book=pilip-piestrak-liasnaia-piesnia">Піліп Пестрак &mdash; Лясная песня</a><br />
				<a href="?book=ala-pietrushkievich-piarstsionak">Ала Петрушкевіч &mdash; Пярсцёнак (вершы)</a><br />
				<a href="?book=stsiapan-sturejka-razrushytsiel">Сцяпан Стурэйка &mdash; Разрушыцель</a><br />
			</p>
		<?php endif ?>
	</div>
</body>
</html>
