<?php

use geoquizz\gateway\application\actions\GetGamesAction;
use geoquizz\gateway\application\actions\GetUserAction;
use geoquizz\gateway\application\actions\PostRegisterAction;
use geoquizz\gateway\application\actions\PostSignInAction;
use geoquizz\gateway\application\actions\CreateGameAction;
use geoquizz\gateway\application\actions\UpdateGameAction;
use geoquizz\gateway\application\actions\UpdateUserInfo;
use geoquizz\gateway\application\middlewares\AuthMiddleware;
use Slim\App;

return function(App $app): App {

    $app->post('/signin', PostSignInAction::class);
    $app->post('/register', PostRegisterAction::class);
    $app->post('/game', CreateGameAction::class);
    $app->get('/games', GetGamesAction::class);
    $app->patch('/game', UpdateGameAction::class);
    $app->get('/user', GetUserAction::class)->add(AuthMiddleware::class);
    $app->post("/updateUser", UpdateUserInfo::class)->add(AuthMiddleware::class);
    // $app->get('/token/refresh', RefreshTokenAction::class);

    return $app;
};