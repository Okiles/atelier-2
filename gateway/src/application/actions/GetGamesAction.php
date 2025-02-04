<?php

namespace geoquizz\gateway\application\actions;

use GuzzleHttp\ClientInterface;
use GuzzleHttp\Exception\ClientException;
use Psr\Http\Message\ResponseInterface;
use Psr\Http\Message\ServerRequestInterface;
use Slim\Exception\HttpNotFoundException;

class GetGamesAction extends AbstractGatewayAction
{

    private ClientInterface $authService;

    public function __construct(ClientInterface $container)
    {
        $this->authService = $container;
    }

    public function __invoke(ServerRequestInterface $rq, ResponseInterface $rs, array $args): ResponseInterface
    {
        try {
            $response = $this->authService->get('/games');
            return $response;
        } catch (ClientException $e) {
            throw new HttpNotFoundException($rq, "Games not found");
        }
    }
}

