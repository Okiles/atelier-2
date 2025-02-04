<?php

namespace geoquizz\game\applications\core\services\Game;

use geoquizz\game\applications\core\dto\InputGameDTO;
use geoquizz\game\applications\core\dto\GameDTO;
use geoquizz\game\applications\core\dto\UpdateGameDTO;
use geoquizz\game\applications\core\dto\UserDTO;
use geoquizz\game\applications\core\repositoryInterfaces\GameRepositoryInterface;

class GameService implements GameServiceInterface
{

    private GameRepositoryInterface $gameRepository;

    public function __construct(GameRepositoryInterface $gameRepository){
        $this->gameRepository = $gameRepository;
    }

    public function startGame(): bool
    {
        // TODO: Implement startGame() method.
    }

    public function updateGame(string $id, int $score): void
    {
        $this->gameRepository->updateGame(new UpdateGameDTO($id, $score));
    }

    public function getGames(): array
    {
        $games = $this->gameRepository->getGames();
        $gameDTOs = [];
        foreach ($games as $game){
            $gameDTOs[] = new GameDTO($game);
        }
        return $gameDTOs;
    }

    public function getGame(): GameDTO
    {
        // TODO: Implement getGame() method.
    }

    public function createGame(InputGameDTO $g): string
    {
        $gameId = $this->gameRepository->createGame($g);
        return $gameId;
    }

    public function getUserInGame(GameDTO $game): UserDTO
    {
        // TODO: Implement getUserInGame() method.
    }

    public function getGameById(string $id): GameDTO
    {
        $game = $this->gameRepository->getGameById($id);
        return $game;
    }
}