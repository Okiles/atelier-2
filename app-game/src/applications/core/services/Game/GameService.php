<?php

namespace geoquizz\game\applications\core\services\Game;

use geoquizz\game\applications\core\dto\InputGameDTO;
use geoquizz\game\applications\core\dto\GameDTO;
use geoquizz\game\applications\core\dto\TokenGameDTO;
use geoquizz\game\applications\core\dto\UpdateGameDTO;
use geoquizz\game\applications\core\dto\UserDTO;
use geoquizz\game\applications\core\repositoryInterfaces\GameRepositoryInterface;
use geoquizz\game\applications\providers\GameProviderInterface;

class GameService implements GameServiceInterface
{

    private GameRepositoryInterface $gameRepository;

    private GameProviderInterface $gameProvider;

    public function __construct(GameRepositoryInterface $gameRepository, GameProviderInterface $gameProvider){
        $this->gameRepository = $gameRepository;
        $this->gameProvider = $gameProvider;
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

    public function getGameById(string $id): GameDTO
    {
        $game = $this->gameRepository->getGameById($id);
        return $game;
    }

    public function createToken(string $gameId, string $userId): string
    {
        $dto = new TokenGameDTO($gameId, $userId);
        $token = $this->gameProvider->createGameToken($dto);
        return $token;
    }

    public function getGameByUserId(string $id): array
    {
        $games = $this->gameRepository->getGameByUserId($id);
        $gamesDto = [];
        foreach ($games as $game){
            $gamesDto[] = new GameDTO($game);
        }
        return $gamesDto;
    }
}