<?php

namespace geoquizz\game\applications\core\dto;

use geoquizz\game\applications\core\dto\DTO;

class InputGameDTO extends DTO
{
    protected ?string $id;
    protected string $status;
    protected string $id_user;
    protected int $score;
    protected int $duree;
    protected float $distance;
    protected ?string $categorie;

    public function __construct(?string $id, string $status, string $id_user, int $score, int $duree, float $distance, ?string $categorie = null)
    {
        $this->id = $id;
        $this->status = $status;
        $this->id_user = $id_user;
        $this->score = $score;
        $this->duree = $duree;
        $this->distance = $distance;
        $this->categorie = $categorie;
    }

    public function getId(): ?string
    {
        return $this->id;
    }

    public function setId(string $id): void
    {
        $this->id = $id;
    }

    public function getStatus(): string
    {
        return $this->status;
    }

    public function getUserId(): string
    {
        return $this->id_user;
    }

    public function getScore(): float
    {
        return $this->score;
    }

    public function getDuree(): int
    {
        return $this->duree;
    }

    public function getDistance(): float
    {
        return $this->distance;
    }

    public function getCategorie(): ?string
    {
        return $this->categorie;
    }
}
