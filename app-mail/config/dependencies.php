<?php

use geoquizz\auth\application\providers\auth\AuthProviderInterface;
use geoquizz\auth\application\providers\auth\JWTAuthProvider;
use geoquizz\auth\application\providers\auth\JWTManager;
use geoquizz\auth\core\repositoryInterfaces\UserRepositoryInterface;
use geoquizz\auth\core\services\auth\AuthService;
use geoquizz\auth\core\services\auth\AuthServiceInterface;
use geoquizz\auth\infrastructure\repositories\PDOUserRepository;
use Psr\Container\ContainerInterface;


return [
];