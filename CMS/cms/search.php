<?php
declare(strict_types=1);

require_once __DIR__ . '/includes/database-connection.php';
require_once __DIR__ . '/includes/functions.php';

$navigation = pdo($pdo, "SELECT id, name FROM category WHERE navigation = 1 ORDER BY name;")->fetchAll();
$section = '';
$title = 'Search';
$description = 'Search articles';

$q = trim((string)filter_input(INPUT_GET, 'q', FILTER_UNSAFE_RAW));
$articles = [];

if ($q !== '') {
    $like = '%' . $q . '%';
    $articles = pdo(
        $pdo,
        "SELECT a.id, a.title, a.summary, a.created, a.image_id,
                c.id AS category_id, c.name AS category_name,
                i.file AS image_file, i.alt AS image_alt
         FROM article AS a
         JOIN category AS c ON c.id = a.category_id
         LEFT JOIN image AS i ON i.id = a.image_id
         WHERE a.published = 1
           AND (a.title LIKE :q OR a.summary LIKE :q OR a.content LIKE :q)
         ORDER BY a.created DESC, a.id DESC
         LIMIT 50",
        ['q' => $like]
    )->fetchAll();
}
?>
<?php require_once __DIR__ . '/includes/header.php'; ?>
  <main class="container" id="content">
    <h1>Search</h1>
    <form method="get" action="search.php">
      <label class="hidden" for="q">Search</label>
      <input id="q" name="q" type="search" value="<?= html_escape($q) ?>" placeholder="Search articles...">
      <button type="submit">Search</button>
    </form>

    <?php if ($q === '') { ?>
      <p>Enter a search term.</p>
    <?php } elseif (!$articles) { ?>
      <p>No results for <strong><?= html_escape($q) ?></strong>.</p>
    <?php } else { ?>
      <p>Results for <strong><?= html_escape($q) ?></strong>:</p>
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
    <?php } ?>
  </main>
<?php require_once __DIR__ . '/includes/footer.php'; ?>

