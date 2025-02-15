<?php

use geoquizz\gateway\application\actions\GetGameById;
use geoquizz\gateway\application\actions\GetGamesAction;
use geoquizz\gateway\application\actions\GetUserAction;
use geoquizz\gateway\application\actions\PostRegisterAction;
use geoquizz\gateway\application\actions\PostSignInAction;
use geoquizz\gateway\application\actions\CreateGameAction;
use geoquizz\gateway\application\actions\UpdateGameAction;
use geoquizz\gateway\application\actions\UpdateUserInfo;
use geoquizz\gateway\application\middlewares\AuthMiddleware;
use GuzzleHttp\Client;
use Psr\Container\ContainerInterface;

return [

    'auth.client' => function () {
        return new Client([
            'base_uri' => 'http://geoquizz.auth',
            'timeout' => 10.0,
        ]);
    },

    'game.client' => function () {
        return new Client([
            'base_uri' => 'http://geoquizz.game',
            'timeout' => 10.0,
        ]);
    },

    "mail.client" => function () {
        return new Client([
            'base_uri' => 'http://geoquizz.mail',
            'timeout' => 10.0,
        ]);
    },

    'directus.client' => function () {
    return new Client([
        'base_uri' => 'http://directus',
        'timeout' => 10.0,
    ]);
    },

    // Actions

    AuthMiddleware::class => function (ContainerInterface $c) {
        return new AuthMiddleware(
            $c->get('auth.client')
        );
    },

    PostRegisterAction::class => function (ContainerInterface $c) {
        return new PostRegisterAction(
            $c->get('auth.client'),
            $c->get('mail.client'),
            $c->get('game.client')
        );
    },

    PostSignInAction::class => function (ContainerInterface $c) {
        return new PostSignInAction(
            $c->get('auth.client'),
            $c->get('mail.client')
        );
    },

    CreateGameAction::class => function (ContainerInterface $c) {
        return new CreateGameAction(
            $c->get('game.client')
        );
    },

    GetGamesAction::class => function (ContainerInterface $c) {
        return new GetGamesAction(
            $c->get('game.client')
        );
    },

    UpdateGameAction::class => function (ContainerInterface $c) {
        return new UpdateGameAction($c->get('game.client'));
    },

    GetGameById::class => function (ContainerInterface $c) {
    return new GetGameById($c->get('game.client'));
    },

    GetUserAction::class => function (ContainerInterface $c) {
        return new GetUserAction($c->get('game.client'), $c->get('auth.client'));
    },

    UpdateUserInfo::class => function (ContainerInterface $c) {
        return new UpdateUserInfo($c->get('auth.client'), $c->get('game.client'), $c->get('mail.client'));
    }
];