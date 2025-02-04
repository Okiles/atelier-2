<?php
declare(strict_types=1);

use geoquizz\game\applications\actions\CreateGameAction;
use geoquizz\game\applications\actions\GetGamesAction;
use geoquizz\game\applications\actions\UpdateGameAction;
use Slim\App;

return function (App $app) {

    $app->post('/game', CreateGameAction::class);
    $app->get('/games', GetGamesAction::class);
    $app->patch('/game', UpdateGameAction::class);
    return $app;
};


