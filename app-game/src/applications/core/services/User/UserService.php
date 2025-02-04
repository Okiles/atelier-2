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
        return new UserDTO($this->userRepository->getUser($id));
    }

    public function getGameByUserId(string $id): array
    {
        // TODO: Implement getGameByUserId() method.
        return [];
    }

    public function createUser(string $id, string $email): bool
    {
        $user = new User(email: $email);
        $user->setId($id);
        return $this->userRepository->createUser($user);
    }

    public function updateUser(UserDTO $userDTO): void
    {
        $user = new User(
            $userDTO->getEmail(),
            $userDTO->getName(),
            $userDTO->getLastname(),
            $userDTO->getUsername(),
            $userDTO->getProfilepic()
        );
        $user->setId($userDTO->getId());
        $this->userRepository->save($user);
    }


}