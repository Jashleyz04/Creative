<?php
declare(strict_types=1);

require_once __DIR__ . '/includes/database-connection.php';
require_once __DIR__ . '/includes/functions.php';

$id = filter_input(INPUT_GET, 'id', FILTER_VALIDATE_INT);
if (!$id) {
    http_response_code(404);
    require_once __DIR__ . '/page-not-found.php';
}

$navigation = pdo($pdo, "SELECT id, name FROM category WHERE navigation = 1 ORDER BY name;")->fetchAll();

$article = pdo(
    $pdo,
    "SELECT a.id, a.title, a.summary, a.content, a.created, a.image_id,
            c.id AS category_id, c.name AS category_name,
            i.file AS image_file, i.alt AS image_alt
     FROM article AS a
     JOIN category AS c ON c.id = a.category_id
     LEFT JOIN image AS i ON i.id = a.image_id
     WHERE a.id = :id AND a.published = 1
     LIMIT 1",
    ['id' => $id]
)->fetch();

if (!$article) {
    http_response_code(404);
    require_once __DIR__ . '/page-not-found.php';
}

$section = (string)$article['category_id'];
$title = (string)$article['title'];
$description = (string)$article['summary'];
?>
<?php require_once __DIR__ . '/includes/header.php'; ?>
  <main class="container" id="content">
    <p>
      <a href="category.php?id=<?= (int)$article['category_id'] ?>">
        <?= html_escape($article['category_name']) ?>
      </a>
      <span class="hidden"> — </span>
      <time datetime="<?= html_escape($article['created']) ?>"><?= html_escape(format_date($article['created'])) ?></time>
    </p>

    <h1><?= html_escape($article['title']) ?></h1>
    <p><?= html_escape($article['summary']) ?></p>

    <?php if (!empty($article['image_file'])) { ?>
      <figure>
        <img
          src="uploads/<?= html_escape($article['image_file']) ?>"
          alt="<?= html_escape($article['image_alt'] ?? '') ?>"
          loading="lazy"
          class="article-image"
        >
      </figure>
    <?php } ?>

    <div>
      <?= nl2br(html_escape($article['content'])) ?>
    </div>
  </main>
<?php require_once __DIR__ . '/includes/footer.php'; ?>

