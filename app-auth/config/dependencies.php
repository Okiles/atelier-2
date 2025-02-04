<?php

use geoquizz\auth\application\actions\PostUpdateCredentials;
use geoquizz\auth\application\providers\auth\AuthProviderInterface;
use geoquizz\auth\application\providers\auth\JWTAuthProvider;
use geoquizz\auth\application\providers\auth\JWTManager;
use geoquizz\auth\core\repositoryInterfaces\UserRepositoryInterface;
use geoquizz\auth\core\services\auth\AuthService;
use geoquizz\auth\core\services\auth\AuthServiceInterface;
use geoquizz\auth\infrastructure\repositories\PDOUserRepository;
use Psr\Container\ContainerInterface;


return [
    JWTManager::class => function(ContainerInterface $container) {
        return new JWTManager();
    },

    UserRepositoryInterface::class => function(ContainerInterface $container) {
        return $container->get(PDOUserRepository::class);
    },

    AuthServiceInterface::class => function(ContainerInterface $container) {
        return new AuthService(
            $container->get(UserRepositoryInterface::class)
        );
    },

    AuthProviderInterface::class => function(ContainerInterface $container) {
        return new JWTAuthProvider(
            $container->get(JWTManager::class),
            $container->get(AuthServiceInterface::class)
        );
    },

    PostUpdateCredentials::class => function(ContainerInterface $container) {
        return new PostUpdateCredentials(
            $container->get(AuthProviderInterface::class)
        );
    },
];