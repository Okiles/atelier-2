<?php

use Slim\App;
use toubeelib\gateway\application\actions\ConsulterPraticienByIdAction;
use toubeelib\gateway\application\actions\ConsulterPraticiensAction;
use toubeelib\gateway\application\actions\GenericGetPraticienAction;
use toubeelib\gateway\application\actions\GenericGetRdvsAction;
use toubeelib\gateway\application\actions\HomeAction;
use toubeelib\gateway\application\actions\RefreshTokenAction;
use toubeelib\gateway\application\actions\RegisterAction;
use toubeelib\gateway\application\actions\SignInAction;
use toubeelib\gateway\application\middlewares\AuthMiddleware;

return function(App $app): App {

    $app->post('/signin', SignInAction::class);
    $app->post('/register', RegisterAction::class);
    $app->get('/token/refresh', RefreshTokenAction::class);
    $app->get('/token/validate', ConsulterPraticiensAction::class);

    return $app;
};