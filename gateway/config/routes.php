<?php

use geoquizz\gateway\application\actions\GetGamesAction;
use geoquizz\gateway\application\actions\PostRegisterAction;
use geoquizz\gateway\application\actions\PostSignInAction;
use geoquizz\gateway\application\actions\CreateGameAction;
use Slim\App;

return function(App $app): App {

    $app->post('/signin', PostSignInAction::class);
    $app->post('/register', PostRegisterAction::class);
    $app->post('/game', CreateGameAction::class);
    $app->get('/games', GetGamesAction::class);
    // $app->get('/token/refresh', RefreshTokenAction::class);



    return $app;
};