<?php

namespace geoquizz\game\applications\core\services\User;

use geoquizz\game\applications\core\dto\GameDTO;
use geoquizz\game\applications\core\dto\UserDTO;

interface UserServiceInterface
{

    public function getUser(string $id): UserDTO;

    public function getGameByUserId(string $id): array;

}