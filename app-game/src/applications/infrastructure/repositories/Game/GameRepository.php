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
        $query = $this->pdo->prepare('INSERT INTO GAMES(id,score,status,id_user,duree,distance) VALUES (:id,:score,:status,:id_user,:duree,:distance)');
        $query->execute([
            'id'=>$game->getID(),
            'score'=>$game->getScore(),
            'status'=>$game->getStatus(),
            'id_user'=>$game->getUserID(),
            'duree'=>$game->getDuree(),
            'distance'=>$game->getDistance()
        ]);

        return $game->getID();

    }

    public function getGames() : array {
        $query = $this->pdo->prepare('SELECT * FROM GAMES');
        $query->execute();
        $rows = $query->fetchAll(PDO::FETCH_ASSOC);
        $games = [];
        foreach($rows as $game){
            $game = new Game($game['score'],$game['status'],$game['id_user'],$game['duree'],$game['distance']);
            $game->setId($game['id']);
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
}