<?php

namespace geoquizz\game\applications\core\dto;

use geoquizz\game\applications\core\dto\DTO;

class TokenGameDTO extends DTO
{
    protected string $game_id;

    protected string $user_id;

    public function __construct(string $game_id, string $user_id){
        $this->game_id = $game_id;
        $this->user_id = $user_id;
}

    public function getGameId(): string{
        return $this->game_id;
    }

    public function getUserId(): string{
        return $this->user_id;
    }

    public function toArray()
    {
        return[
            'game_id' => $this->getGameId(),
            'user_id' => $this->getUserId()
        ];
    }
}