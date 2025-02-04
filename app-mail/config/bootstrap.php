<?php

use DI\ContainerBuilder;
use geoquizz\gateway\application\middlewares\CorsMiddleware;
use slim\Psr7\Request;
use Slim\Factory\AppFactory;
use Slim\Psr7\Response;

$builder = new ContainerBuilder();
$builder->addDefinitions(__DIR__ . '/settings.php' );
$builder->addDefinitions(__DIR__ . '/dependencies.php');

$c = $builder->build();
$app = AppFactory::createFromContainer($c);

$app->addBodyParsingMiddleware();
$app->addRoutingMiddleware();
$app->addErrorMiddleware($c->get('displayErrorDetails'), false, false);

$app = (require_once __DIR__ . '/routes.php')($app);
$routeParser = $app->getRouteCollector()->getRouteParser();

return $app;