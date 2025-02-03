<?php

use GuzzleHttp\Client;
use Psr\Container\ContainerInterface;
use toubeelib\gateway\application\actions\ConsulterPraticienByIdAction;
use toubeelib\gateway\application\actions\ConsulterPraticienRdvs;
use toubeelib\gateway\application\actions\ConsulterPraticiensAction;
use toubeelib\gateway\application\actions\GenericGetPraticienAction;
use toubeelib\gateway\application\actions\GenericGetRdvsAction;
use toubeelib\gateway\application\actions\HomeAction;
use toubeelib\gateway\application\actions\RefreshTokenAction;
use toubeelib\gateway\application\actions\RegisterAction;
use toubeelib\gateway\application\actions\SignInAction;

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
];