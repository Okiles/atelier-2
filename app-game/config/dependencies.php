<?php

use geoquizz\game\applications\actions\GetUserAction;
use geoquizz\game\applications\actions\CreateUserAction;
use geoquizz\game\applications\actions\CreateGameAction;
use geoquizz\game\applications\actions\GetGamesAction;
use geoquizz\game\applications\providers\GameProvider;
use geoquizz\game\applications\providers\JWTManager;
use geoquizz\game\applications\providers\GameProviderInterface;
use geoquizz\game\applications\core\repositoryInterfaces\UserRepositoryInterface;
use geoquizz\game\applications\core\services\Game\GameService;
use geoquizz\game\applications\core\services\User\UserService;
use geoquizz\game\applications\core\services\User\UserServiceInterface;
use geoquizz\game\applications\infrastructure\repositories\Game\GameRepository;
use geoquizz\game\applications\infrastructure\repositories\user\UserRepository;
use Psr\Container\ContainerInterface;
use geoquizz\game\applications\core\repositoryInterfaces\GameRepositoryInterface;
use geoquizz\game\applications\core\services\Game\GameServiceInterface;
use geoquizz\game\applications\actions\UpdateGameAction;
use geoquizz\game\applications\actions\GetGamesByID;

return[
    PDO::class => function () {
        $dsn = sprintf('pgsql:host=%s;port=%s;dbname=%s', $_ENV['DB_HOST'], $_ENV['DB_PORT'],$_ENV['DB_NAME']);
        return new PDO($dsn, $_ENV['POSTGRES_USER'], $_ENV['POSTGRES_PASSWORD'], [
            PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
            PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_OBJ
        ]);
    },

    JWTManager::class  => function () {
    return new JWTManager();
    },

    GameProviderInterface::class => function (ContainerInterface $c) {
    return new GameProvider($c->get(JWTManager::class));
    },

    GameRepositoryInterface::class => function (ContainerInterface $c) {
        return new GameRepository($c->get(PDO::class));
    },

    GameServiceInterface::class => function (ContainerInterface $c) {
        return new GameService($c->get(GameRepositoryInterface::class), $c->get(GameProviderInterface::class));
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

    CreateUserAction::class => function (ContainerInterface $c) {
        return new CreateUserAction($c->get(UserServiceInterface::class));
    },

    UpdateGameAction::class => function (ContainerInterface $c) {
        return new UpdateGameAction($c->get(GameServiceInterface::class));
    },

    GetGamesAction::class => function (ContainerInterface $c) {
        return new GetGamesAction($c->get(GameServiceInterface::class));
    },

    GetUserAction::class => function (ContainerInterface $c) {
        return new GetUserAction($c->get(UserServiceInterface::class));
    },

    GetGamesByID::class => function (ContainerInterface $c) {
        return new GetGamesByID($c->get(GameServiceInterface::class));
    }


];
