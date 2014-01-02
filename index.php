<?php

$list = array(
	array(
		'name' => 'eliza-azheshka-kham',
		'author' => 'Эліза Ажэшка',
		'title' => 'Хам',
	),
	array(
		'name' => 'siarhiej-astraviets-rajskiia-jablychki',
		'author' => 'Сяргей Астравец',
		'title' => 'Райскія яблычкі',
	),
	array(
		'name' => 'maksim-bahdanovich-viershy',
		'author' => 'Максім Багдановіч',
		'title' => 'Вершы',
	),
	array(
		'name' => 'vasil-bykaw-miortvym-nie-balits',
		'author' => 'Васіль Быкаў',
		'title' => 'Мёртвым не баліць',
	),
	array(
		'name' => 'danuta-bichel-zahnietava-nioman-idzie',
		'author' => 'Данута Бічэль&ndash;Загнетава',
		'title' => 'Нёман ідзе (вершы)',
	),
	array(
		'name' => 'uladzimir-karatkievich-khrystos-pryziamliwsia-w-harodni',
		'author' => 'Уладзімір Караткевіч',
		'title' => 'Хрыстос прызямліўся ў&nbsp;Гародні',
	),
	array(
		'name' => 'aliaksiej-karpiuk-karani',
		'author' => 'Аляксей Карпюк',
		'title' => 'Карані',
	),
	array(
		'name' => 'pilip-piestrak-liasnaia-piesnia',
		'author' => 'Піліп Пестрак',
		'title' => 'Лясная песня',
	),
	array(
		'name' => 'ala-pietrushkievich-piarstsionak',
		'author' => 'Ала Петрушкевіч',
		'title' => 'Пярсцёнак (вершы)',
	),
	array(
		'name' => 'stsiapan-sturejka-razrushytsiel',
		'author' => 'Сцяпан Стурэйка',
		'title' => 'Разрушыцель',
	),
);

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
	<!-- maximum-scale, minimum-scale and user-scalable=no fixes bug with position:fixed on android browser -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
	<title>
		<?php if ($book) : ?>
			<?php echo htmlspecialchars($book['author'] . ' - ' . $book['title']) ?>
		<?php else : ?>
			Кнігі
		<?php endif ?>
	</title>
	<link href="http://fonts.googleapis.com/css?family=Noto+Serif:400,700,400italic,700italic&amp;subset=latin,cyrillic" rel="stylesheet" />
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
			<div class="outer">
				<div class="inner">
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
		</div>
	</body>
<?php else : ?>
	<body class="list">
		<div class="wrapper">
			<div class="chapter">
				<h1>Кнігі</h1>
				<?php $index = 0 ?>
				<?php foreach ($list as $item) : ?>
					<?php $index++ ?>
					<div class="book">
						<h2><?php echo $index ?>.</h2>
						<h3><a href="?cover=<?php echo $item['name'] ?>"><?php echo $item['title'] ?></a></h3>
						<p><a href="?cover=<?php echo $item['name'] ?>"><?php echo $item['author'] ?></a></p>
					</div>
				<?php endforeach ?>
			</div>
		</div>
	</body>
<?php endif ?>
</html>
