<?php

namespace geoquizz\game\applications\core\domain\entities\Game;

use geoquizz\game\applications\core\domain\entities\Entity;

class Game extends Entity
{
    private int $score;

    private string $status;

    private string $id_user;

    private int $duree;

    private float $distance;

    private ?string $categorie;

    public function __construct(int $score, string $status, string $id_user, int $duree, string $distance, ?string $categorie = null)
    {
        $this->score = $score;
        $this->status = $status;
        $this->id_user = $id_user;
        $this->duree = $duree;
        $this->distance = $distance;
        $this->categorie = $categorie;
    }
    public function getScore(): int{
        return $this->score;
    }

    public function getStatus(): string{
        return $this->status;
    }

    public function getUserId(): string{
        return $this->id_user;
    }

    public function getDuree(): int{
        return $this->duree;
    }

    public function getDistance(): float{
        return $this->distance;
    }

    public function getCategorie(): ?string{
        return $this->categorie;
    }
}