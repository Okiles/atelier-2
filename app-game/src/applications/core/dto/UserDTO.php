<?php

namespace geoquizz\game\applications\core\dto;

use geoquizz\game\applications\core\domain\entities\User\User;
use geoquizz\game\applications\core\dto\DTO;

class UserDTO extends DTO
{
    private string $id;
    private ?string $name;
    private ?string $lastname;
    private string $email;
    private ?string $username;
    private ?string $profilepic;

    public function __construct(User $user) {
        $this->id = $user->getId();
        $this->name = $user->getName();
        $this->lastname = $user->getLastname();
        $this->email = $user->getEmail();
        $this->username = $user->getUsername();
        $this->profilepic = $user->getProfilepic();
    }

    // Getters
    public function getName(): string {
        return $this->name;
    }

    public function getLastname(): string {
        return $this->lastname;
    }

    public function getEmail(): string {
        return $this->email;
    }

    public function getUsername(): ?string {
        return $this->username;
    }

    public function getProfilepic(): ?string {
        return $this->profilepic;
    }

    // Setters
    public function setName(string $name): void {
        $this->name = $name;
    }

    public function setLastname(string $lastname): void {
        $this->lastname = $lastname;
    }

    public function setEmail(string $email): void {
        $this->email = $email;
    }

    public function setUsername(?string $username): void {
        $this->username = $username;
    }

    public function setProfilepic(?string $profilepic): void {
        $this->profilepic = $profilepic;
    }

    public function getId(): string {
        return $this->id;
    }

    public function setId(string $id): void {
        $this->id = $id;
    }
}