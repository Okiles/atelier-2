<?php

namespace geoquizz\game\applications\infrastructure\repositories;

use geoquizz\game\applications\core\domain\entities\User\User;
use geoquizz\game\applications\core\repositoryInterfaces\RepositoryEntityNotFoundException;
use geoquizz\game\applications\core\repositoryInterfaces\UserRepositoryInterface;
use PDO;

class UserRepository implements UserRepositoryInterface
{
    private PDO $pdo;
    public function __construct(PDO $pdo){
        $this->pdo = $pdo;
    }

    public function getUser(string $id) : User {
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


    public function createUser(User $user): void
    {
        $this->pdo->prepare("INSERT INTO `users` (`id`, `name`, `lastname`, `email`, `username`, 'profilepic') VALUES (:id, :name, :lastname, :email, :username, :profilepic)")
            ->execute([
                'id' => $user->getId(),
                'name' => $user->getName(),
                'lastname' => $user->getLastname(),
                'email' => $user->getEmail(),
                'username' => $user->getUsername(),
                'profilepic' => $user->getProfilePic()
            ]);
    }

    public function save(User $user): void
    {
        $this->pdo->prepare("UPDATE `users` SET `name` = :name, `lastname` = :lastname, `email` = :email, `username` = :username, `profilepic` = :profilepic WHERE `id` = :id")
            ->execute([
                'id' => $user->getId(),
                'name' => $user->getName(),
                'lastname' => $user->getLastname(),
                'email' => $user->getEmail(),
                'username' => $user->getUsername(),
                'profilepic' => $user->getProfilePic()
            ]);
    }

    public function deleteUser(string $id): bool
    {
        $query = $this->pdo->prepare("DELETE FROM `users` WHERE `id` = :id");
        $query->execute(['id' => $id]);
        return $query->rowCount() > 0;
    }
}