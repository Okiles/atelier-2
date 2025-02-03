<?php
declare(strict_types=1);

use geoquizz\game\applications\actions\CreateGameAction;
use Slim\App;

return function (App $app) {

    $app->post('/game', CreateGameAction::class);
    return $app;
};


