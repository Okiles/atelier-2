<?php

namespace geoquizz\game\applications\core\dto;

use geoquizz\game\applications\core\dto\DTO;

class UpdateGameDTO extends DTO
{
    protected string $gameId;
    protected int $score;

    public function __construct(string $id, int $score){
        $this->score = $score;
        $this->gameId = $id;
    }

    public function getScore(): int{
        return $this->score;
    }

    public function getGameId(): string{
        return $this->gameId;
    }


}