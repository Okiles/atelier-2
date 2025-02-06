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
            $user_id = $args['id'] ?? null;
            if($user_id){
                $response = $this->gameService->get('/games/' . $user_id);
            }else{
                $response = $this->gameService->get('/games');
            }
            return $response;
        } catch (ClientException $e) {
            throw new HttpNotFoundException($rq, "Games not found");
        }
    }
}
