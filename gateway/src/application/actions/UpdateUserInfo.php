<?php

namespace geoquizz\gateway\application\actions;

use geoquizz\gateway\application\actions\AbstractGatewayAction;
use GuzzleHttp\ClientInterface;
use GuzzleHttp\Exception\ClientException;
use GuzzleHttp\Exception\GuzzleException;
use Psr\Http\Message\ResponseInterface;
use Psr\Http\Message\ServerRequestInterface;
use Slim\Exception\HttpUnauthorizedException;

class UpdateUserInfo extends AbstractGatewayAction
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

        // Validation et préparation de l'image (si présente)
        $image = $data['image'] ?? null;
        if ($image && !file_exists($image)) {
            throw new \Exception("Image file does not exist.");
        }

        // Màj dans le service de jeu
        try {
            $multipartData = [
                [
                    'name'     => 'id',
                    'contents' => $userId
                ],
                [
                    'name'     => 'username',
                    'contents' => $data['username'] ?? null
                ],
                [
                    'name'     => 'name',
                    'contents' => $data['name'] ?? null
                ],
                [
                    'name'     => 'lastname',
                    'contents' => $data['lastname'] ?? null
                ]
            ];

            // Si une image est fournie, ajoutez-la dans les données multipart
            if ($image) {
                $multipartData[] = [
                    'name'     => 'image',
                    'contents' => fopen($image, 'r'),
                    'filename' => basename($image)  // Utilise le nom du fichier tel quel
                ];
            }

            // Envoi des informations mises à jour au service de jeu
            $response = $this->gameClient->patch("/user", [
                'headers' => [
                    'Authorization' => $token,
                    // Guzzle s'occupera de définir automatiquement le Content-Type pour multipart/form-data
                ],
                'multipart' => $multipartData
            ]);
        } catch (ClientException $e) {
            throw new HttpUnauthorizedException($rq, "User not found or invalid data");
        } catch (GuzzleException $e) {
            // Gestion de l'exception Guzzle
            error_log($e->getMessage());
            return $this->jsonResponse($rs, ['error' => 'Service unavailable'], 500);
        }

        // Retourne une réponse avec un statut 200 si tout se passe bien
        return $rs->withStatus(200);
    }

    private function jsonResponse(ResponseInterface $rs, array $data, int $status): ResponseInterface
    {
        $rs->getBody()->write(json_encode($data));
        return $rs->withStatus($status)->withHeader('Content-Type', 'application/json');
    }
}
