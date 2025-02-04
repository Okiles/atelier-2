<?php
declare(strict_types=1);

use geoquizz\game\applications\actions\CreateGameAction;
use geoquizz\game\applications\actions\GetGamesAction;
use Slim\App;

return function (App $app) {

    $app->post('/game', CreateGameAction::class);
    $app->get('/games', GetGamesAction::class);
    return $app;
};


