<?php

namespace geoquizz\game\applications\providers;

use geoquizz\game\applications\core\dto\TokenGameDTO;

interface GameProviderInterface
{
    public function createGameToken(TokenGameDTO $game): string;
}