<?php

$list = array(
	array(
		'name' => 'eliza-azheshka-kham',
		'author' => 'Эліза Ажэшка',
		'title' => 'Хам',
		'cover' => '#906189',
	),
	array(
		'name' => 'siarhiej-astraviets-rajskiia-jablychki',
		'author' => 'Сяргей Астравец',
		'title' => 'Райскія яблычкі',
		'cover' => '#2e313b',
	),
	array(
		'name' => 'maksim-bahdanovich-viershy',
		'author' => 'Максім Багдановіч',
		'title' => 'Вершы',
		'cover' => '#2e7c80',
	),
	array(
		'name' => 'vasil-bykaw-miortvym-nie-balits',
		'author' => 'Васіль Быкаў',
		'title' => 'Мёртвым не баліць',
		'cover' => '#678c1a',
	),
	array(
		'name' => 'danuta-bichel-zahnietava-nioman-idzie',
		'author' => 'Данута Бічэль&ndash;Загнетава',
		'title' => 'Нёман ідзе (вершы)',
		'cover' => '#794627',
	),
	array(
		'name' => 'uladzimir-karatkievich-khrystos-pryziamliwsia-w-harodni',
		'author' => 'Уладзімір Караткевіч',
		'title' => 'Хрыстос прызямліўся ў&nbsp;Гародні',
		'cover' => '#ba3d1f',
	),
	array(
		'name' => 'aliaksiej-karpiuk-karani',
		'author' => 'Аляксей Карпюк',
		'title' => 'Карані',
		'cover' => '#243154',
	),
	array(
		'name' => 'pilip-piestrak-liasnaia-piesnia',
		'author' => 'Піліп Пестрак',
		'title' => 'Лясная песня',
		'cover' => '#2e7c80',
	),
	array(
		'name' => 'ala-pietrushkievich-piarstsionak',
		'author' => 'Ала Петрушкевіч',
		'title' => 'Пярсцёнак (вершы)',
		'cover' => '#2f323d',
	),
	array(
		'name' => 'stsiapan-sturejka-razrushytsiel',
		'author' => 'Сцяпан Стурэйка',
		'title' => 'Разрушыцель',
		'cover' => '#688d1a',
	),
);

$mode = '';
$book = null;
$bookName = '';
$coverColor = '#2f323d';

if (isset($_GET['cover']) || isset($_GET['read'])) {
	$bookName = preg_replace('/[^a-z0-9\-]/', '', isset($_GET['cover']) ? $_GET['cover'] : $_GET['read']);

	if (is_readable(__DIR__ . "/books/{$bookName}.php")) {
		$book = require(__DIR__ . "/books/{$bookName}.php");
		$mode = isset($_GET['cover']) ? 'cover' : 'read';

		foreach ($list as $item) {
			if ($item['name'] == $bookName) {
				$coverColor = $item['cover'];
				break;
			}
		}
	}
}

?>
<!DOCTYPE html>
<?php /* Use "ru" instead of "be" to support CSS3 hyphens in Fx and IE */ ?>
<html lang="ru">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<?php /* maximum-scale, minimum-scale and user-scalable=no fixes bug with position:fixed on android browser */ ?>
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
	<body class="book <?php echo $book['cssClass'] ?>">
		<div class="wrapper">
			<div class="links" style="background-color:<?php echo $coverColor ?>;">
				&larr; <a href="?cover=<?php echo $bookName ?>">Да вокладкі</a>
			</div>
		</div>
		<div class="wrapper">
			<div class="chapter hyphenate">
				<?php echo join('</div><div class="chapter hyphenate">', $book['chapters']) ?>
			</div>
		</div>
		<div class="wrapper">
			<div class="links" style="background-color:<?php echo $coverColor ?>;">
				&larr; <a href="?cover=<?php echo $bookName ?>">Да вокладкі</a>
			</div>
		</div>
	</body>
<?php elseif ($mode == 'cover') : ?>
	<body class="cover">
		<table class="outer" style="background-color:<?php echo $coverColor ?>;"><tr><td class="outer-cell">
			<table class="inner">
				<tr><td><p>
					<a href="?">Да спісу кніг</a>
				</p></td></tr>
				<tr><td class="title">
					<h1><?php echo htmlspecialchars($book['title']) ?></h1>
					<h3><?php echo str_replace(' ', '<br />', htmlspecialchars($book['author'])) ?></h3>
				</td></tr>
				<tr><td><p>
					<a href="?read=<?php echo $bookName ?>" style="font-size:1.5em;">Чытаць анлайн</a><br />
					ці<br />
					<a href="epub/<?php echo $bookName ?>.epub">Спампаваць epub</a>
				</p></td></tr>
			</table>
		</td></tr></table>
	</body>
<?php else : ?>
	<body class="startup">
		<div class="outer">
			<div class="inner">
				<h1>Кнігі</h1>
				<?php $index = 0 ?>
				<?php foreach ($list as $item) : ?>
					<?php $index++ ?>
					<div class="item" style="background-color:<?php echo $item['cover'] ?>;">
						<div class="item-inner">
							<h3><a href="?cover=<?php echo $item['name'] ?>"><?php echo $item['title'] ?></a></h3>
							<p><a href="?cover=<?php echo $item['name'] ?>"><?php echo $item['author'] ?></a></p>
						</div>
					</div>
				<?php endforeach ?>
			</div>
		</div>
	</body>
<?php endif ?>
</html>
