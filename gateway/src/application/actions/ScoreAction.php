<?php

namespace geoquizz\gateway\application\actions;

use geoquizz\gateway\application\actions\AbstractGatewayAction;
use Psr\Http\Message\ResponseInterface;
use Psr\Http\Message\ServerRequestInterface;

class ScoreAction extends AbstractGatewayAction
{

    public function __invoke(ServerRequestInterface $rq, ResponseInterface $rs, array $args): ResponseInterface
    {

    }
}