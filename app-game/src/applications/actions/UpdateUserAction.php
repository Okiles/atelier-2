<?php

namespace geoquizz\game\applications\actions;

use geoquizz\game\applications\core\services\User\UserServiceInterface;
use Psr\Http\Message\ResponseInterface;
use Psr\Http\Message\ServerRequestInterface;
use Slim\Psr7\Response;

class UpdateUserAction extends AbstractAction
{
    public UserServiceInterface $userService;

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
            $userDTO = $this->userService->getUser($id);
            if (!$userDTO) {
                return $this->jsonResponse($rs, ['error' => 'User not found'], 404);
            }

            // Mise à jour des champs
            $userDTO->setEmail($data['email'] ?? $userDTO->getEmail());
            $userDTO->setName($data['name'] ?? $userDTO->getName());
            $userDTO->setLastname($data['lastname'] ?? $userDTO->getLastname());
            $userDTO->setUsername($data['username'] ?? $userDTO->getUsername());

            // Gestion de l'image
            if (!empty($data['image'])) {
                try {
                    $profilepic = $this->storeImage($data['image'], $id);
                    $userDTO->setProfilePicture($profilepic);
                } catch (\Exception $e) {
                    return $this->jsonResponse($rs, ['error' => $e->getMessage()], 400);
                }
            }

            // Sauvegarde des modifications
            $this->userService->updateUser($userDTO);

            return $this->jsonResponse($rs, ['message' => 'User updated successfully'], 200);
        } catch (\Exception $e) {
            return $this->jsonResponse($rs, ['error' => 'User update failed', 'message' => $e->getMessage()], 500);
        }
    }

    private function storeImage($image, $id): string
    {
        $imageData = base64_decode(preg_replace('/^data:image\/(png|jpeg|gif|jpg|jfif);base64,/', '', $image));
        if ($imageData === false) {
            throw new \Exception("Failed to decode image.");
        }

        $imageInfo = getimagesizefromstring($imageData);
        if ($imageInfo === false) {
            throw new \Exception("Invalid image format. Supported formats: PNG, JPEG, GIF, JPG, JFIF.");
        }

        $allowedTypes = ['image/jpeg', 'image/png', 'image/gif', 'image/jpg', 'image/jfif'];
        if (!in_array($imageInfo['mime'], $allowedTypes)) {
            throw new \Exception("Unsupported image format. Allowed: JPEG, PNG, GIF, JPG, JFIF.");
        }

        $extension = match ($imageInfo['mime']) {
            'image/jpeg', 'image/jpg', 'image/jfif' => 'jpg',
            'image/png' => 'png',
            'image/gif' => 'gif',
            default => throw new \Exception("Unsupported image format."),
        };

        $path = __DIR__ . '/../../../public/assets/images/users/' . $id . '.' . $extension;
        file_put_contents($path, $imageData);

        return '/assets/images/users/' . $id . '.' . $extension;
    }

    private function jsonResponse(ResponseInterface $rs, array $data, int $status): ResponseInterface
    {
        $rs->getBody()->write(json_encode($data));
        return $rs->withStatus($status)->withHeader('Content-Type', 'application/json');
    }
}
