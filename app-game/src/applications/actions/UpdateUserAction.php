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
        // Récupérer les données du corps de la requête
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

            // Mettre à jour les informations de l'utilisateur
            $userDTO->setEmail($data['email'] ?? $userDTO->getEmail());
            $userDTO->setName($data['name'] ?? $userDTO->getName());
            $userDTO->setLastname($data['lastname'] ?? $userDTO->getLastname());
            $userDTO->setUsername($data['username'] ?? $userDTO->getUsername());

            // Gestion de l'image
            $uploadedFiles = $rq->getUploadedFiles();
            if (!empty($uploadedFiles['image'])) {
                try {
                    $profilepic = $this->storeImage($uploadedFiles['image'], $id);
                    $userDTO->setProfilePicture($profilepic);
                } catch (\Exception $e) {
                    return $this->jsonResponse($rs, ['error' => $e->getMessage()], 400);
                }
            }

            // Sauvegarder les modifications
            $this->userService->updateUser($userDTO);

            return $this->jsonResponse($rs, ['message' => 'User updated successfully'], 200);
        } catch (\Exception $e) {
            return $this->jsonResponse($rs, ['error' => 'User update failed', 'message' => $e->getMessage()], 500);
        }
    }

    private function storeImage($image, $id): string
    {
        // Vérification du type de fichier
        $allowedTypes = ['image/jpeg', 'image/png', 'image/gif', 'image/jpg', 'image/jfif'];
        if (!in_array($image->getClientMediaType(), $allowedTypes)) {
            throw new \Exception("Unsupported image format. Allowed formats: JPEG, PNG, GIF, JPG, JFIF.");
        }

        // Définir l'extension du fichier en fonction de son type MIME
        $extension = match ($image->getClientMediaType()) {
            'image/jpeg', 'image/jpg', 'image/jfif' => 'jpg',
            'image/png' => 'png',
            'image/gif' => 'gif',
            default => throw new \Exception("Unsupported image format."),
        };

        // Définir le chemin de stockage
        $path = __DIR__ . '/../../../public/assets/images/users/' . $id . '.' . $extension;

        // Déplacer le fichier téléchargé vers le répertoire final
        $image->moveTo($path);

        return '/assets/images/users/' . $id . '.' . $extension;
    }

    private function jsonResponse(ResponseInterface $rs, array $data, int $status): ResponseInterface
    {
        $rs->getBody()->write(json_encode($data));
        return $rs->withStatus($status)->withHeader('Content-Type', 'application/json');
    }
}
