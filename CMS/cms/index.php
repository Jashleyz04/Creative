<?php
declare(strict_types=1);

require_once __DIR__ . '/includes/database-connection.php';
require_once __DIR__ . '/includes/functions.php';

$navigation = pdo($pdo, "SELECT id, name FROM category WHERE navigation = 1 ORDER BY name;")->fetchAll();
$section = '';
$title = 'Home';
$description = 'Latest articles';

$articles = pdo(
    $pdo,
    "SELECT a.id, a.title, a.summary, a.created, a.image_id,
            c.id AS category_id, c.name AS category_name,
            i.file AS image_file, i.alt AS image_alt
     FROM article AS a
     JOIN category AS c ON c.id = a.category_id
     LEFT JOIN image AS i ON i.id = a.image_id
     WHERE a.published = 1
     ORDER BY a.created DESC, a.id DESC
     LIMIT 12"
)->fetchAll();
?>
<?php require_once __DIR__ . '/includes/header.php'; ?>
  <main class="container" id="content">
    <h1>Latest articles</h1>

    <?php if (!$articles) { ?>
      <p>No articles found. Import `cf.sql` into MySQL, then refresh.</p>
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
        <p>
          <a href="category.php?id=<?= (int)$article['category_id'] ?>">
            <?= html_escape($article['category_name']) ?>
          </a>
          <span class="hidden"> — </span>
          <time datetime="<?= html_escape($article['created']) ?>"><?= html_escape(format_date($article['created'])) ?></time>
        </p>
        <p><?= html_escape($article['summary']) ?></p>
      </article>
    <?php } ?>
  </main>
<?php require_once __DIR__ . '/includes/footer.php'; ?>

