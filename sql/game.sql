DROP TABLE IF EXISTS games;
DROP TABLE IF EXISTS users;

CREATE TABLE users
(
    id VARCHAR(255) PRIMARY KEY,
    username VARCHAR(255),
    profile_picture VARCHAR(255),
    name     VARCHAR(255),
    lastname VARCHAR(255),
    email    VARCHAR(255) UNIQUE NOT NULL
);

CREATE TABLE games
(
    id UUID PRIMARY KEY,           -- L'ID du jeu est un UUID
    score    INTEGER     NOT NULL, -- Le score du jeu
    status   VARCHAR(50) NOT NULL, -- Le statut du jeu
    id_user UUID NOT NULL,         -- L'ID utilisateur, clé étrangère vers users
    duree INTERVAL NOT NULL,       -- La durée du jeu
    distance REAL        NOT NULL, -- La distance, ajoutée avec type real
    FOREIGN KEY (id_user) REFERENCES users (id) ON DELETE CASCADE
);
