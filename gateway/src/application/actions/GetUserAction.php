<?php

namespace geoquizz\gateway\application\actions;

use GuzzleHttp\ClientInterface;
use GuzzleHttp\Exception\ClientException;
use Psr\Http\Message\ResponseInterface;
use Psr\Http\Message\ServerRequestInterface;
use Slim\Exception\HttpNotFoundException;
use Slim\Exception\HttpUnauthorizedException;

class GetUserAction extends AbstractGatewayAction
{
    private ClientInterface $gameservice;
    private ClientInterface $authservice;

    public function __construct(ClientInterface $gameservice, ClientInterface $authservice)
    {
        $this->gameservice = $gameservice;
        $this->authservice = $authservice;
    }

    public function __invoke(ServerRequestInterface $rq, ResponseInterface $rs, array $args): ResponseInterface
    {
        // Récupération du token
        $token = $rq->getHeader('Authorization')[0] ?? null;
        if (!$token) {
            throw new HttpUnauthorizedException($rq, "Authorization token is missing");
        }

        try {
            $authResponse = $this->authservice->get("/token/validate", [
                'headers' => ['Authorization' => $token]
            ]);

            $authData = json_decode($authResponse->getBody()->getContents(), true);
            if (!isset($authData['id'])) {
                throw new \Exception("Invalid token response");
            }
        } catch (ClientException $e) {
            throw new HttpUnauthorizedException($rq, "Invalid token");
        } catch (\Exception $e) {
            throw new HttpUnauthorizedException($rq, "Authorization failed: " . $e->getMessage());
        }

        // Récupération de l'ID utilisateur
        $userId = $authData['id'];

        // Appel au service de jeu pour récupérer l'utilisateur en passant l'ID dans le body
        try {
            $response = $this->gameservice->post("/user", [
                'headers' => [
                    'Authorization' => $token,
                    'Content-Type' => 'application/json'
                ],
                'json' => ['id' => $userId]
            ]);
        } catch (ClientException $e) {
            throw new HttpNotFoundException($rq, "User not found");
        }

        return $response;
    }
}
