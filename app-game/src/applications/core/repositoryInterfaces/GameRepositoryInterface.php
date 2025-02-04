<?php

namespace geoquizz\game\applications\core\repositoryInterfaces;

use geoquizz\game\applications\core\dto\InputGameDTO;
use geoquizz\game\applications\core\dto\UpdateGameDTO;

interface GameRepositoryInterface
{

    public function createGame(InputGameDTO $g): string;

    public function updateGame(UpdateGameDTO $game): void;

}