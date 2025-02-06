<?php

namespace geoquizz\auth\application\actions;

use geoquizz\auth\application\providers\auth\AuthProviderInterface;
use geoquizz\auth\application\actions\AbstractAction;
use Psr\Http\Message\ResponseInterface;
use Psr\Http\Message\ServerRequestInterface;

class PostUpdateCredentials extends AbstractAction
{
    private AuthProviderInterface $authProvider;

    public function __construct(AuthProviderInterface $authProvider)
    {
        $this->authProvider = $authProvider;
    }

    public function __invoke(ServerRequestInterface $rq, ResponseInterface $rs, array $args): ResponseInterface
    {
        // Récupération des données envoyées dans le corps de la requête
        $data = $rq->getParsedBody();
        $email = $data['email'] ?? null;
        $password = $data['password'] ?? null;
        $newPassword = $data['newPassword'] ?? null;

        // Vérification des champs obligatoires
        if (!$email || !$password || !$newPassword) {
            return $rs->withStatus(400)  // Mauvaise requête
            ->withHeader('Content-Type', 'application/json')
                ->withBody($this->createJsonStream(['error' => 'Missing required fields: email, password, newPassword']));
        }

        try {
            // Mise à jour du mot de passe via le provider
            $this->authProvider->updatePassword($email, $password, $newPassword);

            // Réponse de succès
            $responseData = ['message' => 'Password updated successfully'];
            $rs->getBody()->write(json_encode($responseData));
            return $rs->withHeader('Content-Type', 'application/json')->withStatus(200);

        } catch (\Exception $e) {
            // Gestion des erreurs (par exemple si les informations sont invalides)
            return $rs->withStatus(400)  // Code d'erreur plus approprié pour une requête invalide
            ->withHeader('Content-Type', 'application/json')
                ->withBody($this->createJsonStream(['error' => 'Unable to update password: ' . $e->getMessage()]));
        }
    }

    // Méthode pour créer un flux JSON à partir d'un tableau de données
    private function createJsonStream(array $data)
    {
        $stream = fopen('php://temp', 'r+');
        fwrite($stream, json_encode($data));
        rewind($stream);
        return new \GuzzleHttp\Psr7\Stream($stream);
    }
}
