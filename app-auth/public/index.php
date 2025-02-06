<?php
declare(strict_types=1);

require_once __DIR__ . '/../vendor/autoload.php';

$dotenv = Dotenv\Dotenv::createImmutable('/var');
$dotenv->load();

/* application boostrap */
$appli = require_once __DIR__ . '/../config/bootstrap.php';

$appli->run();
