<?php

namespace geoquizz\auth\application\providers\auth;

use PhpParser\Token;
use geoquizz\auth\core\domain\entities\User;
use geoquizz\auth\core\dto\AuthDTO;
use geoquizz\auth\core\dto\CredentialsDTO;
use geoquizz\auth\core\services\auth\AuthServiceInterface;

class JWTAuthProvider implements AuthProviderInterface
{
    private JWTManager $jwtManager;
    private AuthServiceInterface $authService;

    public function __construct(JWTManager $jwtManager, AuthServiceInterface $authService)
    {
        $this->jwtManager = $jwtManager;
        $this->authService = $authService;
    }

    public function register(CredentialsDTO $credentials): void
    {
        $this->authService->createUser($credentials);
    }

    public function signin(CredentialsDTO $credentials): AuthDTO
    {
        $authDTO = $this->authService->byCredentials($credentials);
        $authDTO->setToken($this->jwtManager->createAccessToken([
            'id' => $authDTO->getId(),
            'email' => $authDTO->getEmail()
        ]));
        $authDTO->setRefreshToken($this->jwtManager->createRefreshToken([
            'id' => $authDTO->getId(),
            'email' => $authDTO->getEmail()
        ]));
        return $authDTO;
    }

    public function refresh(string $token): AuthDTO
    {
        // TODO: Implement refresh() method.
    }

    public function getSignedInUser(string $token): AuthDTO
    {
        $decodedToken = $this->jwtManager->decodeToken($token);

        if (empty($decodedToken['id']) || empty($decodedToken['email'])) {
            throw new \Exception('Invalid token data');
        }

        $id = $decodedToken['id'];
        $email = $decodedToken['email'];

        $user = new User($email);
        $user->setId($id);

        return new AuthDTO($user);
    }
}