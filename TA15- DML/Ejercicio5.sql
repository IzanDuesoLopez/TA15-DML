drop database investigadores;

create database investigadores;

use investigadores;

create table facultades (
    codigo int,
    nombre nvarchar(100),
    primary key (codigo)
);

create table investigadores (
    dni varchar(8),
    nom_apels nvarchar(255),
    facultad int,
    primary key (dni),
    foreign key (facultad) references facultades (codigo)
    on delete cascade on update cascade
);

create table equipos (
    num_serie char(4),
    nombre nvarchar(100),
    facultad int,
    primary key (num_serie),
    foreign key (facultad) references facultades (codigo)
    on delete cascade on update cascade
);

create table reservas (
    dni varchar(8),
    num_serie char(4),
    comienzo datetime,
    fin datetime,
    primary key (dni, num_serie),
    foreign key (dni) references investigadores (dni)
    on delete cascade on update cascade,
    foreign key (num_serie) references equipos (num_serie)
    on delete cascade on update cascade
);

insert into facultades values
    (1, 'Química'),
    (2, 'Física'),
    (3, 'Biologia'),
    (4, 'Matemáticas'),
    (5, 'Enologia'),
    (6, 'Medicina'),
    (7, 'Economia'),
    (8, 'Artes escénicas'),
    (9, 'Ingenieria'),
    (10, 'Psicología');
    
INSERT INTO reservas VALUES 
	('13467982','ESP','21-01-2023 12:00:00','1-02-2023 00:00:00'),
    ('87654321','ALE','18-01-2023 11:00:00','21-02-2023 23:00:00'),
    ('12345678','ING','27-03-2023 10:00:00','30-03-2023 22:00:00'),
    ('88662211','RUS','21-01-2023 12:00:00','1-02-2023 00:00:00'),
    ('33447755','JAP','21-01-2023 12:00:00','1-02-2023 00:00:00'),
    ('35369842','CHI','21-01-2023 12:00:00','1-02-2023 00:00:00'),
    ('45782125','UCR','21-01-2023 12:00:00','1-02-2023 00:00:00'),
    ('39954721','GRE','21-01-2023 12:00:00','1-02-2023 00:00:00'),
    ('98765432','ALB','21-01-2023 12:00:00','1-02-2023 00:00:00'),
    ('12485365','ARG','21-01-2023 12:00:00','1-02-2023 00:00:00'),
    ('23456789','BRA','21-01-2023 12:00:00','1-02-2023 00:00:00');
    
INSERT INTO equipos VALUES
	('BOL', 'EQA', 1),
    ('ESP', 'EQB', 1),
    ('CHI', 'EQC', 1),
    ('BAL', 'EQD', 1),
    ('POR', 'EQE', 1),
    ('POL', 'EQF', 1),
    ('NOR', 'EQG', 1),
    ('SUE', 'EQH', 1),
    ('SUI', 'EQI', 1),
    ('REI', 'EQJ', 1);