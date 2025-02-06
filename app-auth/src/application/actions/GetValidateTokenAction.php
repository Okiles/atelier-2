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
        error_log("Authorization Header: " . print_r($authorizationHeader, true));

        if (empty($authorizationHeader) || !preg_match('/Bearer\s(\S+)/', $authorizationHeader[0], $matches)) {
            return $this->jsonResponse($rs, ['error' => 'Authorization header missing or malformed'], 401);
        }

        $token = $matches[1];
        error_log("Token extrait: " . $token);

        try {
            $authDTO = $this->authProvider->getSignedInUser($token);

            return $this->jsonResponse($rs, [
                'id'    => $authDTO->getId(),
                'email' => $authDTO->getEmail(),
            ], 200);

        } catch (\Exception $e) {
            error_log("Erreur d'authentification: " . $e->getMessage());

            return $this->jsonResponse($rs, ['error' => 'Unauthorized: ' . $e->getMessage()], 401);
        }
    }

    private function jsonResponse(ResponseInterface $rs, array $data, int $statusCode): ResponseInterface
    {
        $payload = json_encode($data, JSON_UNESCAPED_UNICODE);
        $rs->getBody()->write($payload);

        return $rs->withHeader('Content-Type', 'application/json')->withStatus($statusCode);
    }

}
