<?php
declare(strict_types=1);

use geoquizz\game\applications\actions\CreateUserAction;
use geoquizz\game\applications\actions\CreateGameAction;
use geoquizz\game\applications\actions\GetGamesAction;
use geoquizz\game\applications\actions\UpdateGameAction;
use geoquizz\game\applications\actions\UpdateUserAction;
use geoquizz\game\applications\actions\GetGamesByID;
use Slim\App;

return function (App $app) {

    $app->post('/game', CreateGameAction::class);
    $app->get('/games', GetGamesAction::class);
    $app->patch('/game', UpdateGameAction::class);
    $app->get('/game/{id}',GetGamesByID::class);
    $app->post('/createUser', CreateUserAction::class);
    $app->post('/updateUser', UpdateUserAction::class);

    return $app;
};


