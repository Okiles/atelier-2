<?php

namespace geoquizz\game\applications\core\dto;

use geoquizz\game\applications\core\domain\entities\Game\Game;
use geoquizz\game\applications\core\dto\DTO;

class GameDTO extends DTO
{

    protected string $ID;

    protected string $status;

    protected string $id_user;

    protected int $score;

    protected int $duree;

    protected float $distance;

    protected ?string $categorie;

    public function __construct(Game $game)
    {
        $this->ID= $game->getID();
        $this->status = $game->getStatus();
        $this->id_user = $game->getUserId();
        $this->score = $game->getScore();
        $this->duree = $game->getDuree();
        $this->distance = $game->getDistance();
        $this->categorie = $game->getCategorie();
    }


}