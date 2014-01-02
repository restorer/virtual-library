<?php

$mode = '';
$book = null;
$bookName = '';

if (isset($_GET['cover']) || isset($_GET['read'])) {
	$bookName = preg_replace('/[^a-z0-9\-]/', '', isset($_GET['cover']) ? $_GET['cover'] : $_GET['read']);

	if (is_readable(__DIR__ . "/books/{$bookName}.php")) {
		$book = require(__DIR__ . "/books/{$bookName}.php");
		$mode = isset($_GET['cover']) ? 'cover' : 'read';
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
	<?php if ($mode == 'read' && $book['style'] != '') : ?>
		<style type="text/css">
			<?php echo $book['style']; ?>
		</style>
	<?php endif ?>
</head>
<?php if ($mode == 'read') : ?>
	<?php if ($book['cssClass'] != '') : ?><body class="<?php echo $book['cssClass'] ?>"><?php else : ?><body><?php endif ?>
		<div class="wrapper">
			<div class="links">
				&larr; <a href="?cover=<?php echo $bookName ?>">Да вокладцы</a>
			</div>
		</div>
		<div class="wrapper">
			<div class="chapter">
				<?php echo join('</div><div class="chapter">', $book['chapters']) ?>
			</div>
		</div>
		<div class="wrapper">
			<div class="links">
				&larr; <a href="?cover=<?php echo $bookName ?>">Да вокладцы</a>
			</div>
		</div>
	</body>
<?php elseif ($mode == 'cover') : ?>
	<body class="cover">
		<div class="wrapper">
			<div class="tbl">
				<div class="row">
					<p>
						<a href="?">Да спісу кніг</a>
					</p>
				</div>
				<div class="row">
					<div class="chapter">
						<h1><?php echo htmlspecialchars($book['title']) ?></h1>
						<h3><?php echo str_replace(' ', '<br />', htmlspecialchars($book['author'])) ?></h3>
					</div>
				</div>
				<div class="row">
					<p>
						<a href="?read=<?php echo $bookName ?>" style="font-size:1.5em;">Чытаць анлайн</a><br />
						ці<br />
						<a href="epub/<?php echo $bookName ?>.epub">Спампаваць epub</a>
					</p>
				</div>
			</div>
		</div>
	</body>
<?php else : ?>
	<body class="books">
		<div class="wrapper">
			<div class="chapter">
				<h1>Кнігі</h1>
				<p class="list">
					<a href="?cover=eliza-azheshka-kham">Эліза Ажэшка &ndash; <b>Хам</b></a><br />
					<a href="?cover=siarhiej-astraviets-rajskiia-jablychki">Сяргей Астравец &ndash; <b>Райскія яблычкі</b></a><br />
					<a href="?cover=maksim-bahdanovich-viershy">Максім Багдановіч &ndash; <b>Вершы</b></a><br />
					<a href="?cover=vasil-bykaw-miortvym-nie-balits">Васіль Быкаў &ndash; <b>Мёртвым не баліць</b></a><br />
					<a href="?cover=danuta-bichel-zahnietava-nioman-idzie">Данута Бічэль&ndash;Загнетава &ndash; <b>Нёман ідзе (вершы)</b></a><br />
					<a href="?cover=uladzimir-karatkievich-khrystos-pryziamliwsia-w-harodni"
					>Уладзімір Караткевіч &ndash; <b>Хрыстос прызямліўся ў Гародні</b></a><br />
					<a href="?cover=aliaksiej-karpiuk-karani">Аляксей Карпюк &ndash; <b>Карані</b></a><br />
					<a href="?cover=pilip-piestrak-liasnaia-piesnia">Піліп Пестрак &ndash; <b>Лясная песня</b></a><br />
					<a href="?cover=ala-pietrushkievich-piarstsionak">Ала Петрушкевіч &ndash; <b>Пярсцёнак (вершы)</b></a><br />
					<a href="?cover=stsiapan-sturejka-razrushytsiel">Сцяпан Стурэйка &ndash; <b>Разрушыцель</b></a><br />
				</p>
			</div>
		</div>
	</body>
<?php endif ?>
</html>
