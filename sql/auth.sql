CREATE TABLE USERS
(
    id         VARCHAR(36) PRIMARY KEY,            -- Utilisation de 36 caractères pour un UUID
    email      VARCHAR(255) NOT NULL UNIQUE,       -- Assure que l'email est unique
    password   VARCHAR(255) NOT NULL,              -- Stockage du hash du mot de passe
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP -- Date de création automatique
);
