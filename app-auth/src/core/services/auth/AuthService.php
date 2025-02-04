<?php

namespace geoquizz\auth\core\services\auth;

use Ramsey\Uuid\Uuid;
use geoquizz\auth\core\domain\entities\User;
use geoquizz\auth\core\dto\AuthDTO;
use geoquizz\auth\core\dto\CredentialsDTO;
use geoquizz\auth\core\repositoryInterfaces\UserRepositoryInterface;
use geoquizz\auth\core\services\auth\AuthServiceInterface;

class AuthService implements AuthServiceInterface
{
    private UserRepositoryInterface $userRepository;

    public function __construct(UserRepositoryInterface $userRepository)
    {
        $this->userRepository = $userRepository;
    }

    public function createUser(CredentialsDTO $credentials): string
    {
        $user = new User($credentials->getEmail(),password_hash($credentials->getPassword(), PASSWORD_DEFAULT));
        $user->setId(Uuid::uuid4()->toString());
        return $this->userRepository->save($user);
    }

    public function byCredentials(CredentialsDTO $credentials): AuthDTO
    {
        $user = $this->userRepository->getUserByEmail($credentials->getEmail());
        if ($user && password_verify($credentials->getPassword(), $user->getPassword())) {
            return new AuthDTO($user);
        } else {
            throw new AuthServiceBadDataException('Erreur 400 : Email ou mot de passe incorrect', 400);
        }
    }

    public function updatePassword(string $email, string $password, string $newPassword): void
    {
        $user = $this->userRepository->getUserByEmail($email);
        if ($user && password_verify($password, $user->getPassword())) {
            $user->setPassword(password_hash($newPassword, PASSWORD_DEFAULT));
            $this->userRepository->update($user);
        } else {
            throw new AuthServiceBadDataException('Erreur 400 : Email ou mot de passe incorrect', 400);
        }
    }
}