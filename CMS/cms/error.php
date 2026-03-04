<?php
declare(strict_types=1);

http_response_code(500);
require_once __DIR__ . '/includes/functions.php';

$navigation = [];
$section = '';
$title = 'Server error';
$description = '';
?>
<?php require_once __DIR__ . '/includes/header.php'; ?>
  <main class="container" id="content">
    <h1>Sorry, a problem occurred</h1>
    <p>Please try again later.</p>
  </main>
<?php require_once __DIR__ . '/includes/footer.php'; ?>

