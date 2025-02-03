<?php

namespace geoquizz\auth\application\providers\auth;

use PhpParser\Token;
use geoquizz\auth\core\dto\AuthDTO;
use geoquizz\auth\core\dto\CredentialsDTO;

interface AuthProviderInterface
{
    public function register(CredentialsDTO $credentials, int $role): void;
    public function signin(CredentialsDTO $credentials): AuthDTO;
    public function refresh(string $token): AuthDTO;
    public function getSignedInUser(string $token): AuthDTO;
}