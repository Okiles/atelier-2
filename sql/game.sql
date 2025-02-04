DROP TABLE IF EXISTS games;
DROP TABLE IF EXISTS users;

CREATE TABLE users
(
    id VARCHAR(255) PRIMARY KEY,
    username VARCHAR(255),
    profile_picture VARCHAR(255),
    name VARCHAR(255),
    lastname VARCHAR(255),
    email VARCHAR(255) UNIQUE NOT NULL
);

CREATE TABLE games
(
    id UUID PRIMARY KEY,
    score INTEGER NOT NULL,
    status VARCHAR(50) NOT NULL,
    id_user VARCHAR(255) NOT NULL,
    duree INT NOT NULL,
    distance REAL NOT NULL,
    FOREIGN KEY (id_user) REFERENCES users (id) ON DELETE CASCADE
);