#drop database directores;
create database directores;
use directores;

create table despachos (
	numero int,
    capacidad int,
    primary key (numero)
);

create table directores (
	dni varchar(8),
    nom_apels nvarchar(255),
    dni_jefe varchar(8),
    despacho int,
    primary key (dni),
    foreign key (despacho) references despachos (numero)
    on delete cascade on update cascade,
    foreign key (dni_jefe) references directores (dni)
    on delete cascade on update cascade
);

insert into despachos values
	(1, 20),
    (2, 25),
    (3, 30),
    (4, 35),
    (5, 45),
    (6, 50),
    (7, 55),
    (8, 60),
    (9, 65),
    (10, 70);

INSERT INTO directores values
	('4256378', 'Pedro Juan', '4256378', 1),
    ('3333333', 'Izan', '3333333', 2),
    ('55555555', 'Dani', '55555555', 3),
    ('77777777', 'Nico', '77777777', 4),
    ('99999999', 'Lourdes', '99999999', 5),
    ('20202020', 'Verign', '20202020', 6),
    ('40404040', 'Vegol', '40404040', 7),
    ('60606060', 'Susan', '60606060', 8),
    ('80808080', 'Johny', '80808080', 9),
    ('11223344', 'Antonio', '11223344', 10);
    
SELECT * FROM directores;
