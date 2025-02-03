<?php

namespace geoquizz\game\applications\infrastructure\repositories;

use geoquizz\game\applications\core\domain\entities\User\User;
use geoquizz\game\applications\core\repositoryInterfaces\RepositoryEntityNotFoundException;
use PDO;

class Userrepository
{
    private PDO $pdo;
    public function __construct(PDO $pdo){
        $this->pdo = $pdo;
    }

    public function getUser(string $id){
        $query = $this->pdo->prepare("SELECT * FROM `users` WHERE `id` = :id");
        $query->execute(['id' => $id]);

        $row = $query->fetch(PDO::FETCH_ASSOC);
        if (!$row) {
            throw new RepositoryEntityNotFoundException("User with $id not found");
        }

        $user = new User($row['name'], $row['lastname'],$row['email'], $row['password']);
        $user->setId($id);
        return $user;


    }


}