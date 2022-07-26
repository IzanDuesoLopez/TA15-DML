drop database geografia;
create database geografia;
use geografia;

create table comunidades (
	nombre varchar(30) primary key, 
    poblacion int, 
    superficie float
    );
   
create table provincias (
	idcodigopostal int primary key, 
    superficie float, 
    nombre varchar(30),
    foreign key (nombre) references comunidades (nombre) ON DELETE CASCADE ON UPDATE CASCADE
    ); 
create table localidades (
	idlocalidad int primary key, 
    población int, 
    nombre1 varchar(20), 
    idcodigopostal int, 
    nombre varchar(30),
    foreign key (idcodigopostal) references provincias (idcodigopostal) ON DELETE CASCADE ON UPDATE CASCADE,  
    foreign key (nombre) references comunidades (nombre) ON DELETE CASCADE ON UPDATE CASCADE
    );

show columns from comunidades;
show columns from provincias;
show columns from localidades; 


INSERT INTO comunidades VALUES 
	('Aragón', 45564567, 2325.96),
    ('Madrid', 45564567, 2265.48),
    ('Navarra', 45564567, 4585.36),
    ('Galicia', 45564567, 1545.32),
    ('Cataluña', 45564567, 2345.76);
    
INSERT INTO provincias VALUES
	(1, 23469, 'Aragón'),
    (2, 58453, 'Madrid'),
    (3, 28953, 'Navarra'),
    (4, 23253, 'Galicia'),
    (5, 89524, 'Cataluña');

INSERT INTO localidades VALUES
	(1, 32437523, 'Robres', 1, 'Aragón'),
    (2, 32432523, 'Robles', 2, 'Madrid'),
    (3, 38632523, 'Val de Robres', 3, 'Navarra'),
    (4, 78432523, 'Alcubierre', 4, 'Galicia'),
    (5, 32432456, 'Senén', 5, 'Cataluña');

UPDATE localidades SET población = '324523' WHERE población = 32437523;
UPDATE provincias SET idlocalidad=1 WHERE idlocalidad=2;
UPDATE comunidades SET nombre='Pais Vasco' WHERE nombre='Cataluña';

DELETE FROM comunidades WHERE nombre = 'Madrid';
DELETE FROM provincias;
DELETE FROM localidades WHERE nombre = 'Robles' ORDER BY nombre DESC LIMIT 2;