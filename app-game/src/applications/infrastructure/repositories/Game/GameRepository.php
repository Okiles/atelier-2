<?php

namespace geoquizz\game\applications\infrastructure\repositories\Game;

use geoquizz\game\applications\core\dto\InputGameDTO;
use geoquizz\game\applications\core\domain\entities\Game\Game;
use geoquizz\game\applications\core\dto\GameDTO;
use geoquizz\game\applications\core\dto\UpdateGameDTO;
use geoquizz\game\applications\core\repositoryInterfaces\GameRepositoryInterface;
use geoquizz\game\applications\core\repositoryInterfaces\RepositoryEntityNotFoundException;
use PDO;
use Ramsey\Uuid\Uuid;

class GameRepository implements GameRepositoryInterface
{

    private PDO $pdo;

    public function __construct(PDO $pdo){
        $this->pdo = $pdo;
    }

    public function createGame(InputGameDTO $game): string{
        $game->setId(Uuid::uuid4()->toString());
        $query = $this->pdo->prepare('INSERT INTO GAMES(id,score,status,id_user,duree,distance,categorie) VALUES (:id,:score,:status,:id_user,:duree,:distance,:categorie)');
        $query->execute([
            'id'=>$game->getID(),
            'score'=>$game->getScore(),
            'status'=>$game->getStatus(),
            'id_user'=>$game->getUserID(),
            'duree'=>$game->getDuree(),
            'distance'=>$game->getDistance(),
            'categorie'=>$game->getCategorie()
        ]);

        return $game->getID();

    }

    public function getGames() : array {
        $query = $this->pdo->prepare('SELECT * FROM GAMES');
        $query->execute();
        $rows = $query->fetchAll(PDO::FETCH_ASSOC);

        if (!$rows) {
            throw new \Exception("No games found");
        }

        $games = [];
        foreach($rows as $row){
            $game = new Game($row['score'], $row['status'], $row['id_user'], $row['duree'], $row['distance'], $row['categorie'] ?? null);
            $game->setID($row['id']);
            $games[] = $game;
        }
        return $games;
    }





    public function updateGame(UpdateGameDTO $game): void
    {
        $query = $this->pdo->prepare('UPDATE GAMES SET status=:status, score=:score WHERE id=:id');
        $query->execute([
            'status'=>'finished',
            'score'=>$game->getScore(),
            'id'=>$game->getGameId()
        ]);
    }

    public function getGameById(string $id): GameDTO
    {
     $query = $this->pdo->prepare('SELECT * FROM GAMES WHERE id=:id');
     $query->execute([
         'id'=>$id
     ]);
     $row = $query->fetch(PDO::FETCH_ASSOC);
     $game = new Game($row['score'], $row['status'], $row['id_user'], $row['duree'], $row['distance'], $row['categorie'] ?? null);
     $game->setID($row['id']);
     return new GameDTO($game);
    }

    public function getGameByUserId(string $userId): array
    {
        $query = $this->pdo->prepare('SELECT * FROM GAMES WHERE id_user=:id_user AND status=:status');
        $query->execute([
            'id_user'=>$userId,
            'status'=>'finished'
        ]);
        $rows = $query->fetchAll(PDO::FETCH_ASSOC);
        $games = [];
        foreach($rows as $row){
            $game = new Game($row['score'], $row['status'], $row['id_user'], $row['duree'], $row['distance'], $row['categorie'] ?? null);
            $game->setID($row['id']);
            $games[] = $game;
        }
        return $games;
    }
}