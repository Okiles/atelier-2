<?php

namespace geoquizz\gateway\application\actions;

use geoquizz\gateway\application\actions\AbstractGatewayAction;
use GuzzleHttp\ClientInterface;
use GuzzleHttp\Exception\ClientException;
use Psr\Http\Message\ResponseInterface;
use Psr\Http\Message\ServerRequestInterface;
use Slim\Exception\HttpNotFoundException;

class GetGameById extends AbstractGatewayAction
{

    private ClientInterface $gameService;

    public function __construct(ClientInterface $gameService)
    {
        $this->gameService = $gameService;
    }

    public function __invoke(ServerRequestInterface $rq, ResponseInterface $rs, array $args): ResponseInterface
    {
        $id = $args['id'];
        try {
            $response = $this->gameService->get("/game/$id");
            return $response;
        } catch (ClientException $e) {
            throw new HttpNotFoundException($rq, "Games not found");
        }
    }
}