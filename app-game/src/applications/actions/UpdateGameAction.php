<?php

namespace geoquizz\game\applications\actions;

use geoquizz\game\applications\actions\AbstractAction;
use geoquizz\game\applications\core\dto\UpdateGameDTO;
use geoquizz\game\applications\core\services\Game\GameServiceInterface;
use Psr\Http\Message\ResponseInterface;
use Psr\Http\Message\ServerRequestInterface;

class UpdateGameAction extends AbstractAction
{

    private GameServiceInterface $gameService;

    public function __construct(GameServiceInterface $gameService){
        $this->gameService = $gameService;
    }

    public function __invoke(ServerRequestInterface $rq, ResponseInterface $rs, array $args): ResponseInterface
    {
        $body = $rq->getParsedBody();

        $id = $body['id'];
        $score = $body['score'];

        $this->gameService->updateGame($id, $score);

        $rs->getBody()->write(json_encode([
            'Game terminée'
        ]));

        return $rs->withHeader('Content-Type', 'application/json')->withStatus(200);


    }
}