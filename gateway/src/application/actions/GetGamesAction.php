<?php

namespace geoquizz\gateway\application\actions;

use GuzzleHttp\ClientInterface;
use GuzzleHttp\Exception\ClientException;
use Psr\Http\Message\ResponseInterface;
use Psr\Http\Message\ServerRequestInterface;
use Slim\Exception\HttpNotFoundException;

class GetGamesAction extends AbstractGatewayAction
{
    private ClientInterface $gameService;

    public function __construct(ClientInterface $gameService)
    {
        $this->gameService = $gameService;
    }

    public function __invoke(ServerRequestInterface $rq, ResponseInterface $rs, array $args): ResponseInterface
    {
        try {
            $response = $this->gameService->get('/games');
            return $response;
        } catch (ClientException $e) {
            var_dump($e->getMessage()); // Affiche le message d'erreur de l'exception
            var_dump($e->getResponse()->getBody()->getContents());
            throw new HttpNotFoundException($rq, "Games not found");
        }
    }
}
