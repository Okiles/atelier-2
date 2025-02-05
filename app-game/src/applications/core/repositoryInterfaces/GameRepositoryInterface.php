<?php

namespace geoquizz\game\applications\core\repositoryInterfaces;

use geoquizz\game\applications\core\dto\GameDTO;
use geoquizz\game\applications\core\dto\InputGameDTO;
use geoquizz\game\applications\core\dto\UpdateGameDTO;

interface GameRepositoryInterface
{

    public function createGame(InputGameDTO $g): string;

    public function updateGame(UpdateGameDTO $game): void;

    public function getGames(): array;

    public function getGameById(string $id): GameDTO;

    public function getGameByUserId(string $userId): array;

}