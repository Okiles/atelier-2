<?php

namespace geoquizz\game\applications\actions;

use geoquizz\game\applications\actions\AbstractAction;
use geoquizz\game\applications\core\dto\InputGameDTO;
use geoquizz\game\applications\core\services\Game\GameServiceInterface;
use Psr\Http\Message\ResponseInterface;
use Psr\Http\Message\ServerRequestInterface;

class GetGamesAction extends AbstractAction
{

    private GameServiceInterface $gameService;

    public function __construct(GameServiceInterface $gameService){
        $this->gameService = $gameService;
    }

    public function __invoke(ServerRequestInterface $rq, ResponseInterface $rs, array $args): ResponseInterface
    {
        try {
            $gamesDTO = $this->gameService->getGames();

            foreach ($gamesDTO as $game) {
                $resultat["Game"][] = [
                    'ID' => $game->ID,
                    'Score' => $game->Score,
                    'Status' => $game->Status,
                    'ID User' => $game->ID_User,
                    'Duree' => $game->Duree,
                    'Distance' => $game->Distance,
                ];
            }
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

