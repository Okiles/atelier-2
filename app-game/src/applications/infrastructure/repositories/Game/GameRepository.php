<?php

namespace geoquizz\game\applications\infrastructure\repositories\Game;

use geoquizz\game\applications\core\dto\InputGameDTO;
use geoquizz\game\applications\core\domain\entities\Game\Game;
use geoquizz\game\applications\core\dto\GameDTO;
use geoquizz\game\applications\core\repositoryInterfaces\GameRepositoryInterface;
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

}