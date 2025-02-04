<?php

namespace geoquizz\auth\core\domain\entities;

use geoquizz\auth\core\dto\AuthDTO;

class User extends Entity
{

    protected string $email;
    protected ?string $password;

    public function __construct(string $email, ?string $password = null)
    {
        $this->email = $email;
        $this->password = $password;
    }

    public function getEmail(): string
    {
        return $this->email;
    }

    public function getPassword(): string
    {
        return $this->password;
    }

    public function setEmail(string $email): void
    {
        $this->email = $email;
    }

    public function setPassword(string $password): void
    {
        $this->password = $password;
    }

    public function toDTO(): AuthDTO
    {
        return new AuthDTO($this);
    }
}