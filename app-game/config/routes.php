<?php
declare(strict_types=1);

use geoquizz\game\applications\actions\GetUserAction;
use geoquizz\game\applications\actions\CreateUserAction;
use geoquizz\game\applications\actions\CreateGameAction;
use geoquizz\game\applications\actions\GetGamesAction;
use geoquizz\game\applications\actions\UpdateGameAction;
use geoquizz\game\applications\actions\UpdateUserAction;
use geoquizz\game\applications\actions\GetGamesByID;
use Slim\App;

return function (App $app) {

    $app->post('/game', CreateGameAction::class);
    $app->get('/games[/{id}]', GetGamesAction::class);
    $app->patch('/game', UpdateGameAction::class);
    $app->get('/game/{id}',GetGamesByID::class);
    $app->post('/register', CreateUserAction::class);
    $app->patch('/user', UpdateUserAction::class);
    $app->post('/user', GetUserAction::class);
    return $app;
};


