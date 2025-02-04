<?php

namespace geoquizz\gateway\application\actions;

use GuzzleHttp\ClientInterface;
use GuzzleHttp\Exception\ClientException;
use Psr\Http\Message\ResponseInterface;
use Psr\Http\Message\ServerRequestInterface;
use Slim\Exception\HttpNotFoundException;

class PostRegisterAction extends AbstractGatewayAction
{
    private ClientInterface $authService;
    private ClientInterface $mailService;
    private ClientInterface $gameService;

    public function __construct(ClientInterface $authService, ClientInterface $mailService, ClientInterface $gameService)
    {
        $this->authService = $authService;
        $this->mailService = $mailService;
        $this->gameService = $gameService;
    }

    public function __invoke(ServerRequestInterface $rq, ResponseInterface $rs, array $args): ResponseInterface
    {
        try {
            $data = $rq->getParsedBody();
            $response = $this->authService->post('/register', ['json' => $data]);
            $authResponse = json_decode($response->getBody()->getContents(), true);

            if (!isset($authResponse['id'])) {
                throw new \RuntimeException("L'ID utilisateur est absent de la réponse AuthService.");
            }

            $this->gameService->post('/createUser', ['json' => ['id' => $authResponse['id'], 'email' => $data['email']]]);
            $this->mailService->post('/send', ['json' => [
                'message' => 'Inscription réussie ! Amusez-vous bien !',
                'email' => $data['email'],
                'subject' => 'Bienvenue chez GeoQuizz'
            ]]);

            $responseBody = json_encode([
                'success' => true,
                'message' => 'Utilisateur inscrit avec succès.',
                'user' => $authResponse
            ]);

            $rs->getBody()->write($responseBody);
            return $rs->withHeader('Content-Type', 'application/json')->withStatus(201);
        } catch (ClientException $e) {
            throw new HttpNotFoundException($rq, "User not found");
        } catch (\Exception $e) {
            $rs->getBody()->write(json_encode(['error' => $e->getMessage()]));
            return $rs->withHeader('Content-Type', 'application/json')->withStatus(500);
        }
    }
}
