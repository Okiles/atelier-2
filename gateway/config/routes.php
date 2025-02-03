<?php

use geoquizz\gateway\application\actions\PostRegisterAction;
use geoquizz\gateway\application\actions\PostSignInAction;
use Slim\App;

return function(App $app): App {

    $app->post('/signin', PostSignInAction::class);
    $app->post('/register', PostRegisterAction::class);
    // $app->get('/token/refresh', RefreshTokenAction::class);



    return $app;
};