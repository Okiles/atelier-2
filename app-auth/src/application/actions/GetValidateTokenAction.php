<?php

namespace geoquizz\auth\application\actions;

use Psr\Http\Message\ResponseInterface;
use Psr\Http\Message\ServerRequestInterface;
use geoquizz\auth\application\actions\AbstractAction;
use geoquizz\auth\application\providers\auth\AuthProviderInterface;

class GetValidateTokenAction extends AbstractAction
{
    private AuthProviderInterface $authProvider;

    public function __construct(AuthProviderInterface $authProvider)
    {
        $this->authProvider = $authProvider;
    }

    public function __invoke(ServerRequestInterface $rq, ResponseInterface $rs, array $args): ResponseInterface
    {
        $authorizationHeader = $rq->getHeader('Authorization');
        error_log("Authorization Header: " . print_r($authorizationHeader, true));  // Ajout du log

        if (empty($authorizationHeader) || !preg_match('/Bearer\s(\S+)/', $authorizationHeader[0], $matches)) {
            return $rs->withStatus(401)
                ->withHeader('Content-Type', 'application/json')
                ->withBody($this->createJsonStream(['error' => 'Authorization header missing or malformed']));
        }

        $token = $matches[1];
        error_log("Token extrait: " . $token);  // Ajout du log

        try {
            $authDTO = $this->authProvider->getSignedInUser($token);

            if ($authDTO->getId() === null) {
                throw new \Exception('Invalid token');
            }

            $data = [
                'id'       => $authDTO->getId(),
                'email'    => $authDTO->getEmail(),
            ];

            $rs->getBody()->write(json_encode($data));
            return $rs->withHeader('Content-Type', 'application/json')->withStatus(200);

        } catch (\Exception $e) {
            error_log("Erreur d'authentification: " . $e->getMessage());  // Log de l'erreur

            return $rs->withStatus(401)
                ->withHeader('Content-Type', 'application/json')
                ->withBody($this->createJsonStream(['error' => 'Unauthorized: ' . $e->getMessage()]));
        }
    }

    private function createJsonStream(array $data)
    {
        $stream = fopen('php://temp', 'r+');
        fwrite($stream, json_encode($data));
        rewind($stream);
        return new \GuzzleHttp\Psr7\Stream($stream);
    }
}
