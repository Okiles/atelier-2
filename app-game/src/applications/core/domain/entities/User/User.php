<?php

namespace geoquizz\game\applications\core\domain\entities\User;

use geoquizz\game\applications\core\domain\entities\Entity;

class User extends Entity
{
    private ?string $name;
    private ?string $lastname;
    private string $email;
    private ?string $username;  // Facultatif
    private ?string $profilepic; // Facultatif

    public function __construct(?string $name = null, ?string $lastname = null, string $email, ?string $username = null, ?string $profilepic = null) {
        $this->name = $name;
        $this->lastname = $lastname;
        $this->email = $email;
        $this->username = $username;
        $this->profilepic = $profilepic;
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
}
