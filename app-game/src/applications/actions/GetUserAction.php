<?php

namespace geoquizz\game\applications\actions;

use geoquizz\game\applications\actions\AbstractAction;
use geoquizz\game\applications\core\services\User\UserServiceInterface;
use Psr\Http\Message\ResponseInterface;
use Psr\Http\Message\ServerRequestInterface;

class GetUserAction extends AbstractAction
{
    private UserServiceInterface $userService;

    public function __construct(UserServiceInterface $userService)
    {
        $this->userService = $userService;
    }

    public function __invoke(ServerRequestInterface $rq, ResponseInterface $rs, array $args): ResponseInterface
    {
        $data = $rq->getParsedBody();
        $id = $data['id'] ?? null;

        if (empty($id)) {
            return $this->jsonResponse($rs, ['error' => 'Missing required fields'], 400);
        }

        try {
            $user = $this->userService->getUser($id);
        } catch (\Exception $e) {
            return $this->jsonResponse($rs, ['error' => 'User not found'], 404);
        }

        $json = [
            'id' => $user->getId(),
            'name' => $user->getName(),
            'lastname' => $user->getLastname(),
            'email' => $user->getEmail(),
            'username' => $user->getUsername(),
            'profile_picture' => $user->getProfilepic()
        ];

        return $this->jsonResponse($rs, $json, 200);
    }

    private function jsonResponse(ResponseInterface $response, array $data, int $statusCode): ResponseInterface
    {
        $response->getBody()->write(json_encode($data, JSON_UNESCAPED_UNICODE | JSON_PRETTY_PRINT));
        return $response->withHeader('Content-Type', 'application/json')->withStatus($statusCode);
    }
}
