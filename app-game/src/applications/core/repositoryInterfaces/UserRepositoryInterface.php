<?php

namespace geoquizz\game\applications\core\repositoryInterfaces;

use geoquizz\game\applications\core\domain\entities\User\User;

interface UserRepositoryInterface
{
    public function getUser(string $id) : User;
    public function save(User $user) : void;
    public function createUser(User $user) : void;
    public function deleteUser(string $id) : bool;
}