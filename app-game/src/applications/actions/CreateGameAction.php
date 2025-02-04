<?php

namespace geoquizz\game\applications\actions;

use geoquizz\game\applications\actions\AbstractAction;
use geoquizz\game\applications\core\dto\InputGameDTO;
use geoquizz\game\applications\core\services\Game\GameServiceInterface;
use Psr\Http\Message\ResponseInterface;
use Psr\Http\Message\ServerRequestInterface;

class CreateGameAction extends AbstractAction
{

    private GameServiceInterface $gameService;

    public function __construct(GameServiceInterface $gameService){
        $this->gameService = $gameService;
    }

    public function __invoke(ServerRequestInterface $rq, ResponseInterface $rs, array $args): ResponseInterface
    {


        $data = $rq->getParsedBody();

        $score = $data['score'] ?? null;
        $status = $data['status'];
        $duree = $data['duree'];
        $distance = $data['distance'];
        $id_user = $data['id_user'];


        $game_id = $this->gameService->createGame(new InputGameDTO(null,$status, $id_user,$score, $duree, $distance));

        $rs->getBody()->write(json_encode([
            'ID de la Game' => $game_id,
        ]));

        return $rs->withHeader('Content-Type', 'application/json')->withStatus(200);

    }
}