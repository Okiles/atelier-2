<?php

namespace geoquizz\game\applications\core\repositoryInterfaces;

use geoquizz\game\applications\core\domain\entities\User\User;

interface UserRepositoryInterface
{
    public function getUser(string $id) : User;
    public function createUser(User $user) : User;
    public function updateUser(User $user) : User;
    public function deleteUser(string $id) : bool;
}