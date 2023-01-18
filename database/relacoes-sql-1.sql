-- Active: 1674044400064@@127.0.0.1@3306


-- Práticas

-- Cria codigo SQL estruturando as tabelas da pratica 1

-- Popule a tabela users com 2 itens
-- Popule a tabela phones com 3 itens
-- Crie a query de consulta com juncao das tabelas

CREATE TABLE users(
    id TEXT PRIMARY KEY UNIQUE NOT NULL,
    name TEXT NOT NULL,
    email TEXT UNIQUE NOT NULL,
    passwaord TEXT NOT NULL
    );

SELECT * FROM users;

CREATE TABLE phones(
    id TEXT PRIMARY KEY UNIQUE NOT NULL,
    phone_number TEXT UNIQUE NOT NULL,
    user_id TEXT NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users (id)
);

SELECT * FROM phones;

INSERT INTO users (id, name, email, passwaord)
VALUES ("u001","joao","joao@labenu.com","123456"),
        ("u002","maria","maria@labenu.com","123456");

INSERT INTO phones (id, phone_number, user_id)
VALUES ("p002","5511999998","u001"),
        ("p003","5511999997","u001"),
        ("p004","5511999996","u002");

SELECT users.id AS usuario,
users.name,
users.email,
users.passwaord,
phones.id AS idDoTelefone,
phones.phone_number,
phones.user_id AS idDoUsuario
FROM users
INNER JOIN phones
ON phones.user_id = users.id;

-- Pratica 3

CREATE TABLE licenses(
    id TEXT PRIMARY KEY NOT NULL UNIQUE,
    register_number TEXT UNIQUE NOT NULL,
    category TEXT NOT NULL
);

CREATE TABLE drivers(
    id TEXT PRIMARY KEY NOT NULL UNIQUE,
    name TEXT NOT NULL,
    email TEXT NOT NULL,
    password TEXT NOT NULL,
    license_id TEXT NOT NULL UNIQUE,
    FOREIGN KEY (license_id) REFERENCES licenses (id)
);

INSERT INTO licenses (id, register_number, category)
VALUES ("l001","123456","A"),
        ("l002","147258","AB");

INSERT INTO drivers (id, name, email, password, license_id)
VALUES ("d001","joao","joao@labenu.com","senha1","l001"),
("d002","maria","maria@labenu.com","senha2","l002");

SELECT * FROM licenses
INNER JOIN drivers
ON drivers.license_id = licenses.id;

CREATE TABLE treinadores(
    id TEXT PRIMARY KEY NOT NULL,
    name TEXT NOT NULL,
    email TEXT NOT NULL,
    licensa_treinador TEXT UNIQUE NOT NULL,
    FOREIGN KEY (licensa_treinador) REFERENCES pokemon (id)
);

CREATE TABLE pokemons(
    id TEXT UNIQUE PRIMARY KEY NOT NULL,
    name TEXT NOT NULL,
    tipo TEXT NOT NULL,
    licesa_treinador TEXT NOT NULL
);

INSERT INTO treinadores (id, name, email, licensa_treinador)
VALUES ("T001","JOAO","JOAO@TREINADOR.COM","0001"),("T002","MARIA","MARIA@TREINADOR.COM","0002");

INSERT INTO pokemons (id,name, tipo, licesa_treinador)
VALUES ("1","BULBASAUR","GRASS","0001"),("2","CHARMANDER","FIRE","0001"),("3","SQUIRTLE","WATER","0002"),("4","PIKACHU","ELECTRY","0002");

SELECT * FROM treinadores;

DROP Table pokemons;