<?php

namespace geoquizz\game\applications\core\repositoryInterfaces;

use geoquizz\game\applications\core\dto\InputGameDTO;

interface GameRepositoryInterface
{

    public function createGame(InputGameDTO $g): string;

}