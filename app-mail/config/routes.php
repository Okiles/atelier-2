<?php

use geoquizz\auth\application\actions\GetValidateTokenAction;
use geoquizz\auth\application\actions\PostRefreshAction;
use geoquizz\auth\application\actions\PostRegisterAction;
use geoquizz\auth\application\actions\PostSigninAction;
use geoquizz\mail\application\actions\SendMessageAction;
use Slim\App;

return function(App $app): App {

    $app->post('/send', SendMessageAction::class)->setName('send');

    return $app;
};