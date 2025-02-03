<?php

use geoquizz\gateway\application\actions\PostRegisterAction;
use geoquizz\gateway\application\actions\PostSignInAction;
use GuzzleHttp\Client;
use Psr\Container\ContainerInterface;

return [
    /* Example of a dependency
    'toubeelib.client' => function () {
        return new Client([
            'base_uri' => 'http://api.toubeelib',
            'timeout' => 2.0,
        ]);
    },
    */

    'auth.client' => function () {
        return new Client([
            'base_uri' => 'http://geoquizz.auth',
            'timeout' => 2.0,
        ]);
    },

    // Actions

    PostRegisterAction::class => function (ContainerInterface $c) {
        return new PostRegisterAction(
            $c->get('auth.client')
        );
    },

    PostSignInAction::class => function (ContainerInterface $c) {
        return new PostSignInAction(
            $c->get('auth.client')
        );
    },
];