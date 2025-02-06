<?php

namespace geoquizz\gateway\application\actions;

use geoquizz\auth\application\actions\AbstractAction;
use GuzzleHttp\ClientInterface;
use GuzzleHttp\Exception\ClientException;
use Psr\Http\Message\ResponseInterface;
use Psr\Http\Message\ServerRequestInterface;
use Slim\Exception\HttpUnauthorizedException;

class UpdateUserInfo extends AbstractAction
{
    private ClientInterface $authClient;
    private ClientInterface $gameClient;
    private ClientInterface $mailClient;

    public function __construct(ClientInterface $authClient, ClientInterface $gameClient, ClientInterface $mailClient)
    {
        $this->authClient = $authClient;
        $this->gameClient = $gameClient;
        $this->mailClient = $mailClient;
    }

    public function __invoke(ServerRequestInterface $rq, ResponseInterface $rs, array $args): ResponseInterface
    {
        // Récupération du token
        $token = $rq->getHeader('Authorization')[0] ?? null;
        if (!$token) {
            throw new HttpUnauthorizedException($rq, "Authorization token is missing");
        }

        try {
            $authResponse = $this->authClient->get("/token/validate", [
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
        $data = $rq->getParsedBody();

        // Màj du mot de passe si nécessaire
        if (isset($data['password']) && isset($data['newPassword'])) {
            $password = $data['password'];
            $newPassword = $data['newPassword'];

            try {
                $response = $this->authClient->post("/update", [
                    'headers' => [
                        'Authorization' => $token,
                        'Content-Type' => 'application/json'
                    ],
                    'json' => [
                        'email' => $authData['email'],
                        'password' => $password,
                        'newPassword' => $newPassword
                    ]
                ]);

                // Si mise à jour du mot de passe réussie, envoyer un email
                if ($response->getStatusCode() == 200) {
                    $this->mailClient->post("/send", [
                        'headers' => [
                            'Authorization' => $token,
                            'Content-Type' => 'application/json'
                        ],
                        'json' => [
                            'email' => $authData['email'],
                            'subject' => 'Modification de votre mot de passe',
                            'content' => 'Votre mot de passe a été modifié avec succès. S\'il ne s\'agit pas de vous, veuillez contacter notre service client.'
                        ]
                    ]);
                }
            } catch (ClientException $e) {
                throw new HttpUnauthorizedException($rq, "Invalid password");
            }
        }

        // Màj dans le service de jeu
        try {
            $response = $this->gameClient->patch("/user", [
                'headers' => [
                    'Authorization' => $token,
                    'Content-Type' => 'application/json'
                ],
                'json' => [
                    'id' => $userId,
                    'username' => $data['username'] ?? null,  // Correction de la faute de frappe ici
                    'name' => $data['name'] ?? null,
                    'lastname' => $data['lastname'] ?? null,
                    'image' => $data['image'] ?? null
                ]
            ]);
        } catch (ClientException $e) {
            throw new HttpUnauthorizedException($rq, "User not found or invalid data");
        }

        // Retourne une réponse avec un statut 200 si tout se passe bien
        return $rs->withStatus(200);
    }
}
