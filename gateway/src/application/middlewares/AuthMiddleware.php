<?php

namespace geoquizz\gateway\application\middlewares;

use Psr\Http\Client\ClientInterface;
use Psr\Http\Message\ServerRequestInterface as Request;
use Psr\Http\Server\RequestHandlerInterface;
use Slim\Psr7\Response;
use GuzzleHttp\Exception\RequestException;
use GuzzleHttp\Exception\GuzzleException;

class AuthMiddleware
{
    private ClientInterface $remoteAuthService;

    public function __construct(ClientInterface $client)
    {
        $this->remoteAuthService = $client;
    }

    public function __invoke(Request $rq, RequestHandlerInterface $handler): \Psr\Http\Message\ResponseInterface
    {
        try {
            $token = $rq->getHeaderLine('Authorization');
            if (empty($token) || !preg_match('/Bearer\s(\S+)/', $token, $matches)) {
                return $this->createJsonResponse(401, "Unauthorized: Missing or malformed token");
            }

            $tokenstring = $matches[1];

            $response = $this->remoteAuthService->get('/token/validate', [
                'headers' => [
                    'Authorization' => 'Bearer ' . $tokenstring,
                ]
            ]);

            if ($response->getStatusCode() == 200) {
                return $handler->handle($rq);
            } else {
                return $this->createJsonResponse(401, "Unauthorized: Invalid token");
            }
        } catch (RequestException|\Exception $e) {
            return $this->createJsonResponse(401, "Unauthorized: Authentication failed");
        } catch (GuzzleException $e) {
            return $this->createJsonResponse(502, "Bad Gateway: Auth service unavailable");
        }
    }


    private function createJsonResponse(int $status, string $message): Response
    {
        $response = new Response();
        $response->getBody()->write(json_encode(["error" => $message]));
        return $response->withHeader('Content-Type', 'application/json')->withStatus($status);
    }
}
