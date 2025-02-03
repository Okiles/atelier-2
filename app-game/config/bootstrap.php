<?php


use DI\ContainerBuilder;
use Dotenv\Dotenv;
use Slim\Factory\AppFactory;

$builder = new ContainerBuilder();
$builder->addDefinitions(__DIR__ . '/settings.php' );
$builder->addDefinitions(__DIR__ . '/dependencies.php');

$c = $builder->build();
$app = AppFactory::createFromContainer($c);

try {
    $envFiles = ['/var/dbgame.env', '/var/geoquizzdb.env'];

    foreach ($envFiles as $file) {
        $dotenv = Dotenv::createImmutable(dirname($file), basename($file));
        $dotenv->load();
    }
} catch (Exception $e) {
    echo "Erreur lors du chargement du fichier .env : " . $e->getMessage();
}

$app->addBodyParsingMiddleware();
$app->addRoutingMiddleware();

$app = (require_once __DIR__ . '/routes.php')($app);
$routeParser = $app->getRouteCollector()->getRouteParser();

return $app;