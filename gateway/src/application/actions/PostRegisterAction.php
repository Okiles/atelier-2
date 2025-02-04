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

    public function __construct(ClientInterface $authService, ClientInterface $mailService)
    {
        $this->authService = $authService;
        $this->mailService = $mailService;
    }

    public function __invoke(ServerRequestInterface $rq, ResponseInterface $rs, array $args): ResponseInterface
    {
        try {
            $data = $rq->getParsedBody();
            $this->authService->post('/register', ['json' => $data]);
            $mailData = [
                'message' => 'Inscription réussie ! Amusez-vous bien !',
                'email' => $data['email'],
                'subject' => 'Bienvenue chez GeoQuizz'
            ];
            $this->mailService->post('/send', ['json' => $mailData]);
        } catch (ClientException $e) {
            throw new HttpNotFoundException($rq, "User not found");
        }
        return $rs;
    }

}