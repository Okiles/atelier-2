<?php

namespace applications\actions;

use geoquizz\game\applications\actions\AbstractAction;
use geoquizz\game\applications\core\services\User\UserServiceInterface;
use Psr\Http\Message\ResponseInterface;
use Psr\Http\Message\ServerRequestInterface;
use Throwable;

class CreateUserAcion extends AbstractAction
{
    private UserServiceInterface $userService;

    public function __construct(UserServiceInterface $userService)
    {
        $this->userService = $userService;
    }

    public function __invoke(ServerRequestInterface $rq, ResponseInterface $rs, array $args): ResponseInterface
    {
        try {
            $data = $rq->getParsedBody();

            if (!isset($data['id'], $data['email'])) {
                throw new \InvalidArgumentException("Les champs 'id' et 'email' sont requis.");
            }

            $id = $data['id'];
            $email = $data['email'];

            $this->userService->createUser($id, $email);

            $responseData = [
                'success' => true,
                'message' => 'Utilisateur créé avec succès.',
                'user_id' => $id,
            ];

            return $this->createJsonResponse($rs, $responseData, 201);
        } catch (\InvalidArgumentException $e) {
            return $this->createJsonResponse($rs, ['error' => $e->getMessage()], 400);
        } catch (Throwable $e) {
            return $this->createJsonResponse($rs, ['error' => 'Une erreur interne est survenue.'], 500);
        }
    }

    private function createJsonResponse(ResponseInterface $rs, array $data, int $status): ResponseInterface
    {
        $rs->getBody()->write(json_encode($data, JSON_UNESCAPED_UNICODE));
        return $rs->withHeader('Content-Type', 'application/json')->withStatus($status);
    }
}
