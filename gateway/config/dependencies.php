<?php

use geoquizz\gateway\application\actions\GetGamesAction;
use geoquizz\gateway\application\actions\PostRegisterAction;
use geoquizz\gateway\application\actions\PostSignInAction;
use geoquizz\gateway\application\actions\CreateGameAction;
use geoquizz\gateway\application\actions\UpdateGameAction;
use geoquizz\game\applications\actions\GetGamesByID;
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

    GetGamesByID::class => function (ContainerInterface $c) {
    return new GetGamesByID($c->get('game.client'));
    }

];