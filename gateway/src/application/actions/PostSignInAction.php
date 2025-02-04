<?php

namespace geoquizz\gateway\application\actions;

use GuzzleHttp\ClientInterface;
use GuzzleHttp\Exception\ClientException;
use Psr\Http\Message\ResponseInterface;
use Psr\Http\Message\ServerRequestInterface;
use Slim\Exception\HttpNotFoundException;

class PostSignInAction extends AbstractGatewayAction
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
            $response = $this->authService->post('/signin', ['json' => $data]);
            $mailData = [
                'message' => 'Une nouvelle connexion a été détectée sur votre compte, si ce n\'est pas vous, veuillez contacter notre service client',
                'email' => $data['email'],
                'subject' => 'Une nouvelle connexion a été détectée'
            ];
            $this->mailService->post('/send', ['json' => $mailData]);
            return $response;
        } catch (ClientException $e) {
            throw new HttpNotFoundException($rq, "User not found");
        }
    }
}