<?php

namespace geoquizz\game\applications\core\services\Game;

use geoquizz\game\applications\core\dto\InputGameDTO;
use geoquizz\game\applications\core\dto\GameDTO;
use geoquizz\game\applications\core\dto\UpdateGameDTO;
use geoquizz\game\applications\core\dto\UserDTO;

interface GameServiceInterface
{

    public function startGame(): bool;

    public function updateGame(string $id, int $score): void;

    public function getGame(): GameDTO;

    public function createGame(InputGameDTO $g): string;

    public function getUserInGame(GameDTO $game): UserDTO;

    public function getGameById(string $id): GameDTO;



}