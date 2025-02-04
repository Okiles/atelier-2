<?php

namespace geoquizz\game\applications\core\dto;

use geoquizz\game\applications\core\domain\entities\Game\Game;
use geoquizz\game\applications\core\dto\DTO;

class GameDTO extends DTO
{

    protected string $id;

    protected string $status;

    protected string $id_user;

    protected int $score;

    protected float $duree;

    protected float $distance;

    public function __construct(Game $game)
    {
        $this->id = $game->getID();
        $this->status = $game->getStatus();
        $this->id_user = $game->getUserId();
        $this->score = $game->getScore();
        $this->duree = $game->getDuree();
        $this->distance = $game->getDistance();
    }

}