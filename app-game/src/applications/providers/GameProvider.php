<?php

namespace geoquizz\game\applications\providers;

use geoquizz\game\applications\core\dto\TokenGameDTO;
use geoquizz\game\applications\providers\GameProviderInterface;
use geoquizz\game\applications\providers\JWTManager;

class GameProvider implements GameProviderInterface
{
    private JWTManager $jwtManager;

    public function __construct(JWTManager $jwtManager)
    {
        $this->jwtManager = $jwtManager;
    }

    public function createGameToken(TokenGameDTO $t): string
    {
        return $this->jwtManager->createAccessToken($t->toArray());
    }
}