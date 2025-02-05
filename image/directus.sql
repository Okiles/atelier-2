CREATE TABLE lieux (
    id SERIAL PRIMARY KEY,
    categorie TEXT NOT NULL,
    nom TEXT NOT NULL,
    ville TEXT NOT NULL,
    latitude DOUBLE PRECISION NOT NULL,
    longitude DOUBLE PRECISION NOT NULL,
    photo UUID
);


