<?php

namespace geoquizz\game\applications\actions;

use geoquizz\game\applications\actions\AbstractAction;
use geoquizz\game\applications\core\services\Game\GameService;
use geoquizz\game\applications\core\services\Game\GameServiceInterface;
use Psr\Http\Message\ResponseInterface;
use Psr\Http\Message\ServerRequestInterface;

class GetGamesByID extends AbstractAction
{

    private GameServiceInterface $gameService;

    public function __construct(GameServiceInterface $gameService){
        $this->gameService = $gameService;
    }

    public function __invoke(ServerRequestInterface $rq, ResponseInterface $rs, array $args): ResponseInterface
    {
        try{
            $id = $args['id'];
            $game = $this->gameService->getGameById($id);
            $resultat= [
                'ID' => $game->ID,
                'Score' => $game->score,
                'Status' => $game->status,
                'ID User' => $game->id_user,
                'Duree' => $game->duree,
                'Distance' => $game->distance,
                'Categorie' => $game->categorie,
            ];
            $rs->getBody()->write(json_encode($resultat));
            return $rs->withHeader('Content-Type', 'application/json')->withStatus(200);

        }catch (\Exception $e) {
            $rs->getBody()->write(json_encode([
                'error' => $e->getMessage()
            ]));
            return $rs->withHeader('Content-Type', 'application/json')->withStatus(404);
        }


    }
}