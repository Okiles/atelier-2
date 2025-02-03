<?php

namespace geoquizz\auth\core\services\auth;

use geoquizz\auth\core\dto\AuthDTO;
use geoquizz\auth\core\dto\CredentialsDTO;

interface AuthServiceInterface
{
    public function createUser(CredentialsDTO $credentials): string;
    public function byCredentials(CredentialsDTO $credentials): AuthDTO;
}