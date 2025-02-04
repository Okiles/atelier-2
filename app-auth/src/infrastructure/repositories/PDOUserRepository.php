<?php

namespace geoquizz\auth\infrastructure\repositories;

use PDO;
use PDOException;
use geoquizz\auth\core\domain\entities\User;
use geoquizz\auth\core\repositoryInterfaces\RepositoryEntityNotFoundException;
use geoquizz\auth\core\repositoryInterfaces\UserRepositoryInterface;

class PDOUserRepository implements UserRepositoryInterface
{
    private PDO $pdo;

    public function __construct()
    {
        $dbCredentials = parse_ini_file(__DIR__ . '/../../../config/geoquizzdb.env');
        try {
            $this->pdo = new PDO(
                'pgsql:host=geoquizz.db;dbname=auth',
                $dbCredentials['POSTGRES_USER'],
                $dbCredentials['POSTGRES_PASSWORD'],
                [PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION]
            );
        } catch (PDOException $e) {
            throw new \RuntimeException("Database connection failed: " . $e->getMessage());
        }
    }

    public function getUserById(string $id): User
    {
        $stmt = $this->pdo->prepare('SELECT * FROM USERS WHERE id = :id');
        $stmt->execute(['id' => $id]);
        $PDOuser = $stmt->fetch(PDO::FETCH_ASSOC);

        if (!$PDOuser) {
            throw new RepositoryEntityNotFoundException('User not found');
        }

        return $this->hydrateUser($PDOuser);
    }

    public function save(User $user): string
    {
        $stmt = $this->pdo->prepare(
            'INSERT INTO USERS (id, email, password) 
             VALUES (:id, :email, :password) 
             ON CONFLICT (id) 
             DO UPDATE SET email = EXCLUDED.email, password = EXCLUDED.password'
        );
        $stmt->execute([
            'id' => $user->getId(),
            'email' => $user->getEmail(),
            'password' => $user->getPassword()
        ]);

        return $user->getId();
    }

    public function getUserByEmail(string $email): User
    {
        $stmt = $this->pdo->prepare('SELECT * FROM USERS WHERE email = :email');
        $stmt->execute(['email' => $email]);
        $PDOuser = $stmt->fetch(PDO::FETCH_ASSOC);

        if (!$PDOuser) {
            throw new RepositoryEntityNotFoundException('User not found');
        }

        return $this->hydrateUser($PDOuser);
    }

    private function update(User $user): void
    {
        $stmt = $this->pdo->prepare(
            'UPDATE USERS SET password = :password WHERE id = :id'
        );
        $stmt->execute([
            'id' => $user->getId(),
            'password' => $user->getPassword()
        ]);
    }

    private function hydrateUser(array $data): User
    {
        $user = new User($data['email'], $data['password']);
        $user->setId($data['id']);
        return $user;
    }
}