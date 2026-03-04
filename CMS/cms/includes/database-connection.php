<?php
declare(strict_types=1);

$host = '127.0.0.1';
$db   = 'phpbook-1';
$user = 'root';
$pass = '';
$charset = 'utf8mb4';

$dsn = "mysql:host={$host};dbname={$db};charset={$charset}";
$serverDsn = "mysql:host={$host};charset={$charset}";
$options = [
    PDO::ATTR_ERRMODE            => PDO::ERRMODE_EXCEPTION,
    PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
    PDO::ATTR_EMULATE_PREPARES   => false,
];

try {
    $pdo = new PDO($dsn, $user, $pass, $options);
} catch (Throwable $e) {
    // If the DB doesn't exist yet (common in local setups), try creating it.
    if ($e instanceof PDOException && ($e->errorInfo[1] ?? null) === 1049) {
        try {
            $tmp = new PDO($serverDsn, $user, $pass, $options);
            $tmp->exec(
                "CREATE DATABASE IF NOT EXISTS `{$db}` CHARACTER SET {$charset} COLLATE utf8mb4_unicode_ci"
            );
            $pdo = new PDO($dsn, $user, $pass, $options);
            unset($tmp);
            return;
        } catch (Throwable) {
            // Fall through to troubleshooting page below.
        }
    }
    // Fall back to the troubleshooting page (keeps UX friendly in dev).
    require_once __DIR__ . '/database-troubleshooting.php';
    exit;
}

