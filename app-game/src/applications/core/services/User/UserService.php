<?php

namespace geoquizz\game\applications\core\services\User;

use geoquizz\game\applications\core\domain\entities\User\User;
use geoquizz\game\applications\core\dto\UserDTO;
use geoquizz\game\applications\core\repositoryInterfaces\UserRepositoryInterface;

class UserService implements UserServiceInterface
{

    private UserRepositoryInterface $userRepository;


    public function __construct(UserRepositoryInterface $userRepository)
    {
        $this->userRepository = $userRepository;
    }

    public function getUser(string $id): UserDTO
    {
        // TODO: Implement getUser() method.
    }

    public function getGameByUserId(string $id): array
    {
        // TODO: Implement getGameByUserId() method.
    }

    public function createUser(string $id, string $email): bool
    {
        $user = new User(email: $email);
        $user->setId($id);
        $this->userRepository->createUser($user);
    }
}