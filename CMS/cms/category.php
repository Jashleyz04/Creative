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

$category = pdo(
    $pdo,
    "SELECT id, name, description FROM category WHERE id = :id LIMIT 1",
    ['id' => $id]
)->fetch();

if (!$category) {
    http_response_code(404);
    require_once __DIR__ . '/page-not-found.php';
}

$section = (string)$category['id'];
$title = (string)$category['name'];
$description = (string)$category['description'];

$articles = pdo(
    $pdo,
    "SELECT a.id, a.title, a.summary, a.created, a.image_id,
            i.file AS image_file, i.alt AS image_alt
     FROM article AS a
     LEFT JOIN image AS i ON i.id = a.image_id
     WHERE a.category_id = :id AND a.published = 1
     ORDER BY a.created DESC, a.id DESC",
    ['id' => $id]
)->fetchAll();
?>
<?php require_once __DIR__ . '/includes/header.php'; ?>
  <main class="container" id="content">
    <h1><?= html_escape($category['name']) ?></h1>
    <p><?= html_escape($category['description']) ?></p>

    <?php if (!$articles) { ?>
      <p>No articles in this category yet.</p>
    <?php } ?>

    <?php foreach ($articles as $article) { ?>
      <article>
        <?php if (!empty($article['image_file'])) { ?>
          <p>
            <a href="article.php?id=<?= (int)$article['id'] ?>">
              <img
                src="uploads/<?= html_escape($article['image_file']) ?>"
                alt="<?= html_escape($article['image_alt'] ?? '') ?>"
                loading="lazy"
                class="article-thumb"
              >
            </a>
          </p>
        <?php } ?>
        <h2>
          <a href="article.php?id=<?= (int)$article['id'] ?>">
            <?= html_escape($article['title']) ?>
          </a>
        </h2>
        <p><time datetime="<?= html_escape($article['created']) ?>"><?= html_escape(format_date($article['created'])) ?></time></p>
        <p><?= html_escape($article['summary']) ?></p>
      </article>
    <?php } ?>
  </main>
<?php require_once __DIR__ . '/includes/footer.php'; ?>

