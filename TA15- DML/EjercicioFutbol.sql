drop database futbol;
create database futbol;
USE futbol;

CREATE TABLE Ligas (
	idliga int,
    pais varchar(25),
    temporada int,
    primary key (idliga)
);

CREATE TABLE Equipos (
	idequipo int,
    idliga int,
    nombre varchar(25),
    estadio varchar(25),
    presidente varchar(30),
    himno varchar(50),
    primary key (idequipo),
    foreign key (idliga) references Ligas (idliga) ON DELETE CASCADE ON UPDATE CASCADE
);

create table Jugadores(
	idjugador int,
    nombre varchar(25),
    peso float,
    altura float,
    dorsal int,
    goles int,
    asistencias int,
    faltas int,
    edad int,
    idequipo int UNIQUE NOT NULL,
    primary key (idjugador),
    foreign key (idequipo) references Equipos (idequipo) ON DELETE CASCADE ON UPDATE CASCADE
);

create table Entrenador(
	identrenador int,
    nombre varchar(25),
    edad int,
    añosexperiencia int,
    idequipo int NOT NULL,
    primary key (identrenador),
    foreign key (idequipo) references Equipos (idequipo) ON DELETE CASCADE ON UPDATE CASCADE
);

create table Partidos(
	idpartido int,
    equipolocal varchar(25),
    equipovisitante varchar(25),
    resultado varchar(10),
    idequipo int,
    primary key (idpartido),
    foreign key (idequipo) references Equipos (idequipo) ON DELETE CASCADE ON UPDATE CASCADE
);

create table Jueganpartidos(
	idequipo int,
    idpartido int,
    foreign key (idequipo) references Equipos(idequipo) ON DELETE CASCADE ON UPDATE CASCADE, 
    foreign key (idpartido) references Partidos(idpartido) ON DELETE CASCADE ON UPDATE CASCADE
);

create table Arbitros(
	idarbitro int,
    nombre varchar(25),
    edad int,
    idpartido int NOT NULL,
    primary key (idarbitro),
    foreign key (idpartido) references Partidos(idpartido) ON DELETE CASCADE ON UPDATE CASCADE
); 

insert into Ligas values (1, 'España', 1);
insert into Ligas values(2, DEFAULT, 2);
insert into Ligas (idLiga, pais, temporada) values(3, 'Francia',3), (4, 'Alemania',4);
insert into Ligas SET idLiga=5, pais='Italia', temporada=5;
insert into Ligas (idLiga, pais, temporada) values(6, 'Andorra', 6), (3, 'Francia', 7) on duplicate key update temporada=values(temporada);

insert into Equipos values
    (1, 1, 'Alcorcón', 'Santiago Bernabeu', 'Florentino Pérez', 'Hala Alcorcón'),
    (2, 2, 'Betis', 'Pizjuán', 'Bertín Osborne', 'Verde que te quiero verde'),
    (3, 3, 'Villarreal', 'La Cerámica', 'Fernando Roig', 'Manzana'),
    (4, 4, 'Getafe', 'La calle', 'Al-Khelaifi', 'A quién le importa'),
    (5, 5, 'Huesca', 'La Bombonera', 'Manuel Torres', 'Viva Huesca');
    
INSERT INTO Jugadores VALUES (1, 'Modrić', 78.7, 176.4, 10, 20, 25, 3, 36, 1);
INSERT INTO Jugadores VALUES (2, 'Parejo', 75.6, 182.3, 5, 10, 55, 12, 33, 2);
INSERT INTO Jugadores VALUES (3, 'Jordi Alba', 78.7, 170.7, 23, 5, 24, 6, 33, 3);

insert into Entrenador values(1, 'Carlo Ancelotti', 54, 30, 1);
insert into Entrenador values(2, 'Pedro', 53, 5, 2);
insert into Entrenador values(3, 'Carlos', 41, 10, 3);
insert into Entrenador values(4, 'Pep', 45, 17, 4);
insert into Entrenador values(5, 'John', 51, 21, 5);

INSERT INTO Partidos VALUES (1, 'Madrid', 'Barça', '7-0', 1);
INSERT INTO Partidos VALUES (2, 'Villarreal', 'Huesca', '1-2', 2);
INSERT INTO Partidos VALUES (3, 'Sevilla', 'Betis', '3-2', 3);
INSERT INTO Partidos VALUES (4, 'Real Sociedad', 'Celta', '4-3', 4);
INSERT INTO Partidos VALUES (5, 'Atlético de Madrid', 'Athletic', '3-5', 5);

insert into Jueganpartidos values
    (1, 1),
    (2, 2),
    (3, 3),
    (4, 4),
    (5, 5);

INSERT INTO Arbitros VALUES (1, 'Mateu Lahoz', 45, 1);
INSERT INTO Arbitros VALUES (2, 'Gil Manzano', 38, 2);
INSERT INTO Arbitros VALUES (3, 'Bengoetxea', 36, 3);
INSERT INTO Arbitros VALUES (4, 'Del Cerro', 46, 4);
INSERT INTO Arbitros VALUES (5, 'Hernández Hernández', 39, 5);

UPDATE Partidos SET resultado = '5-5' WHERE idpartido = 1;
UPDATE Jueganpartidos SET idpartido=1 WHERE idpartido=2;
UPDATE Arbitros SET nombre='Mateu' WHERE idarbitro=3;

DELETE FROM Equipos WHERE idequipo = 1;
DELETE FROM Equipos WHERE idequipo = 4;
DELETE FROM Jugadores WHERE nombre = 'Parejo' ORDER BY nombre DESC LIMIT 2;

SELECT * FROM Partidos;