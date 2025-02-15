<?php

namespace geoquizz\gateway\application\actions;

use geoquizz\gateway\application\actions\AbstractGatewayAction;
use GuzzleHttp\ClientInterface;
use GuzzleHttp\Exception\ClientException;
use Psr\Http\Message\ResponseInterface;
use Psr\Http\Message\ServerRequestInterface;
use Slim\Exception\HttpNotFoundException;

class UpdateGameAction extends AbstractGatewayAction
{

    private ClientInterface $authService;

    public function __construct(ClientInterface $container)
    {
        $this->authService = $container;
    }

    public function __invoke(ServerRequestInterface $rq, ResponseInterface $rs, array $args): ResponseInterface
    {
        try {
            $data = $rq->getParsedBody();
            $response = $this->authService->patch('/game', ['json' => $data]);
            return $response;
        } catch (ClientException $e) {
            throw new HttpNotFoundException($rq, "Game not found");
        }
    }
}