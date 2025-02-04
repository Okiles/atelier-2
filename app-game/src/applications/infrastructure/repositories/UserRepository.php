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


    public function createUser(User $user): User
    {
        $this->pdo->prepare("INSERT INTO `users` (`id`, `email`) VALUES (:id, :email)")
            ->execute([
                'id' => $user->getId(),
                'email' => $user->getEmail(),
            ]);
    }

    public function updateUser(User $user): User
    {
        $email = "email : $user->getEmail()," ?? '';
        $username = "username : $user->getUsername()," ?? '';
        $name = "name : $user->getName()," ?? '';
        $lastname = "lastname : $user->getLastname()," ?? '';
        $profile_picture = "profile_picture : $user->getProfilePicture()," ?? '';
        $this->pdo->prepare("UPDATE `users` SET $email $username $name $lastname $profile_picture WHERE `id` = :id")
            ->execute([
                'id' => $user->getId(),
            ]);
    }

    public function deleteUser(string $id): bool
    {
        $query = $this->pdo->prepare("DELETE FROM `users` WHERE `id` = :id");
        $query->execute(['id' => $id]);
        return $query->rowCount() > 0;
    }
}