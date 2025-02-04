<?php

namespace geoquizz\game\applications\infrastructure\repositories;

use geoquizz\game\applications\core\domain\entities\User\User;
use geoquizz\game\applications\core\repositoryInterfaces\RepositoryEntityNotFoundException;
use PDO;

class Userrepository
{
    private PDO $pdo;

    public function __construct(PDO $pdo)
    {
        $this->pdo = $pdo;
    }

<<<<<<< Updated upstream
    public function getUser(string $id){
=======
    public function getUser(string $id): User
    {
>>>>>>> Stashed changes
        $query = $this->pdo->prepare("SELECT * FROM `users` WHERE `id` = :id");
        $query->execute(['id' => $id]);

        $row = $query->fetch(PDO::FETCH_ASSOC);
        if (!$row) {
            throw new RepositoryEntityNotFoundException("User with $id not found");
        }

// Création de l'objet User avec des valeurs par défaut vides si null
        $user = new User(
            $row['email'],
            $row['name'] ?? '',       // Valeur vide si NULL
            $row['lastname'] ?? '',
            $row['username'] ?? '',
            $row['profilepic'] ?? ''
        );
        $user->setId($id);
        return $user;
    }

<<<<<<< Updated upstream

}
=======
    public function createUser(User $user): bool
    {
        // Correction de la syntaxe de la requête pour PostgreSQL
        $query = $this->pdo->prepare(
            "INSERT INTO \"users\" (\"id\", \"name\", \"lastname\", \"email\", \"username\", \"profile_picture\") 
        VALUES (:id, :name, :lastname, :email, :username, :profilepic)"
        );

        // Envoi des valeurs en vérifiant les champs vides ou nulls
        $query->execute([
            'id' => $user->getId(),
            'name' => $user->getName() ?: null,  // Si name est vide, on envoie null
            'lastname' => $user->getLastname() ?: null,  // Si lastname est vide, on envoie null
            'email' => $user->getEmail(),
            'username' => $user->getUsername() ?: null,  // Si username est vide, on envoie null
            'profilepic' => $user->getProfilepic() ?: null  // Si profilepic est vide, on envoie null
        ]);

        return $query->rowCount() > 0;
    }

    public function save(User $user): void
    {
        $query = $this->pdo->prepare(
            "UPDATE `users` SET
        `name` = :name,
        `lastname` = :lastname,
        `email` = :email,
        `username` = :username,
        `profile_picture` = :profilepic
        WHERE `id` = :id"
        );

        $query->execute([
            'id' => $user->getId(),
            'name' => $user->getName() ?: null,  // Si name est vide, on envoie null
            'lastname' => $user->getLastname() ?: null,  // Si lastname est vide, on envoie null
            'email' => $user->getEmail(),
            'username' => $user->getUsername() ?: null,  // Si username est vide, on envoie null
            'profilepic' => $user->getProfilepic() ?: null  // Si profilepic est vide, on envoie null
        ]);
    }

    public function deleteUser(string $id): bool
    {
        $query = $this->pdo->prepare("DELETE FROM `users` WHERE `id` = :id");
        $query->execute(['id' => $id]);

        return $query->rowCount() > 0;
    }
}
>>>>>>> Stashed changes
