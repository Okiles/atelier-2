<?php

namespace geoquizz\game\applications\core\domain\entities\User;

use geoquizz\game\applications\core\domain\entities\Entity;

class User extends Entity
{
    private string $name;

    private string $lastname;

    private string $email;

    private string $password;

    public function __construct(string $name, string $lastname, string $email, string $password){
        $this->name = $name;
        $this->lastname = $lastname;
        $this->email = $email;
        $this->password = $password;
    }

    public function getName(): string{
        return $this->name;
    }

    public function getLastname(): string{
        return $this->lastname;
    }


    public function getEmail(): string{
        return $this->email;
    }

    public function getPassword(): string{
        return $this->password;
    }



}