<?php
declare(strict_types=1);

use Dotenv\Dotenv;

require_once __DIR__ . '/../vendor/autoload.php';

$dotenv = Dotenv::createImmutable(__DIR__ . '/../config');
$dotenv->load();

/* application boostrap */
$appli = require_once __DIR__ . '/../config/bootstrap.php';

$appli->run();
