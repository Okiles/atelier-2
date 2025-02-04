<?php

namespace geoquizz\game\applications\infrastructure\repositories;

use geoquizz\game\applications\core\domain\entities\User\User;
use geoquizz\game\applications\core\repositoryInterfaces\RepositoryEntityNotFoundException;
use geoquizz\game\applications\core\repositoryInterfaces\UserRepositoryInterface;
use PDO;

class UserRepository implements UserRepositoryInterface
{
    private PDO $pdo;

    public function __construct(PDO $pdo)
    {
        $this->pdo = $pdo;
    }

    public function getUser(string $id): User
    {
        $query = $this->pdo->prepare("SELECT * FROM users WHERE id = :id");
        $query->execute(['id' => $id]);

        $row = $query->fetch(PDO::FETCH_ASSOC);
        if (!$row) {
            throw new RepositoryEntityNotFoundException("User with ID $id not found");
        }
        $user = new User(
            $row['email'],
            $row['name'] ?? '',
            $row['lastname'] ?? '',
            $row['username'] ?? '',
            $row['profile_picture'] ?? ''
        );
        $user->setId($id);
        return $user;
    }

    public function createUser(User $user): bool
    {

        $query = $this->pdo->prepare(
            "INSERT INTO \"users\" (\"id\", \"name\", \"lastname\", \"email\", \"username\", \"profile_picture\") 
        VALUES (:id, :name, :lastname, :email, :username, :profilepic)"
        );

        $query->execute([
            'id' => $user->getId(),
            'name' => $user->getName() ?: null,
            'lastname' => $user->getLastname() ?: null,
            'email' => $user->getEmail(),
            'username' => $user->getUsername() ?: null,
            'profilepic' => $user->getProfilepic() ?: "/images/users/default.jfif"
        ]);

        return $query->rowCount() > 0;
    }

    public function save(User $user): void
    {
        $fields = [];
        $params = ['id' => $user->getId()];

        if ($user->getName() !== null) {
            $fields[] = 'name = :name';
            $params['name'] = $user->getName();
        }

        if ($user->getLastname() !== null) {
            $fields[] = 'lastname = :lastname';
            $params['lastname'] = $user->getLastname();
        }

        if ($user->getEmail() !== null) {
            $fields[] = 'email = :email';
            $params['email'] = $user->getEmail();
        }

        if ($user->getUsername() !== null) {
            $fields[] = 'username = :username';
            $params['username'] = $user->getUsername();
        }

        if ($user->getProfilepic() !== null) {
            $fields[] = 'profile_picture = :profile_picture';
            $params['profile_picture'] = $user->getProfilepic();
        }

        if (empty($fields)) {
            return;
        }

        $query = $this->pdo->prepare(
            "UPDATE users SET " . implode(', ', $fields) . " WHERE id = :id"
        );

        $query->execute($params);
    }

    public function deleteUser(string $id): bool
    {
        $query = $this->pdo->prepare("DELETE FROM `users` WHERE `id` = :id");
        $query->execute(['id' => $id]);

        return $query->rowCount() > 0;
    }
}
