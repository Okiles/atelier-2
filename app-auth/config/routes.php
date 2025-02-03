<?php

use geoquizz\auth\application\actions\GetValidateTokenAction;
use geoquizz\auth\application\actions\PostRefreshAction;
use geoquizz\auth\application\actions\PostRegisterAction;
use geoquizz\auth\application\actions\PostSigninAction;
use Slim\App;

return function(App $app): App {

    $app->post('/signin', PostSignInAction::class)->setName('signin');
    $app->post('/register', PostRegisterAction::class)->setName('register');
    $app->get('/token/refresh', PostRefreshAction::class)->setName('refresh');
    $app->get('/token/validate', GetValidateTokenAction::class)->setName('validate');

    return $app;
};