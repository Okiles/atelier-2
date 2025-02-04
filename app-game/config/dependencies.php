<?php

use applications\actions\CreateUserAcion;
use geoquizz\game\applications\actions\CreateGameAction;
use geoquizz\game\applications\core\repositoryInterfaces\UserRepositoryInterface;
use geoquizz\game\applications\core\services\Game\GameService;
use geoquizz\game\applications\core\services\User\UserService;
use geoquizz\game\applications\core\services\User\UserServiceInterface;
use geoquizz\game\applications\infrastructure\repositories\Game\GameRepository;
use geoquizz\game\applications\infrastructure\repositories\UserRepository;
use Psr\Container\ContainerInterface;
use geoquizz\game\applications\core\repositoryInterfaces\GameRepositoryInterface;
use geoquizz\game\applications\core\services\Game\GameServiceInterface;

return[
    PDO::class => function () {
        $dsn = sprintf('pgsql:host=%s;port=%s;dbname=%s', $_ENV['DB_HOST'], $_ENV['DB_PORT'],$_ENV['DB_NAME']);
        return new PDO($dsn, $_ENV['POSTGRES_USER'], $_ENV['POSTGRES_PASSWORD'], [
            PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
            PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_OBJ
        ]);
    },

    GameRepositoryInterface::class => function (ContainerInterface $c) {
        return new GameRepository($c->get(PDO::class));
    },

    GameServiceInterface::class => function (ContainerInterface $c) {
        return new GameService($c->get(GameRepositoryInterface::class));
    },

    CreateGameAction::class => function (ContainerInterface $c) {
        return new CreateGameAction($c->get(GameServiceInterface::class));
    },

    UserRepositoryInterface::class => function (ContainerInterface $c) {
        return new UserRepository($c->get(PDO::class));
    },

    UserServiceInterface::class => function (ContainerInterface $c) {
        return new UserService($c->get(UserRepositoryInterface::class));
    },

    CreateUserAcion::class => function (ContainerInterface $c) {
        return new CreateUserAcion($c->get(UserServiceInterface::class));
    },

];
