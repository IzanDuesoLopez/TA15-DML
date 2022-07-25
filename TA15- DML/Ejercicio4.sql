drop database grandesAlmacenes;
create database grandesAlmacenes;
use grandesAlmacenes;

create table Productos (
	codigo int auto_increment primary key,
    nombre nvarchar(100),
    precio int
	);
    
create table Cajeros (
	codigo char(5) primary key,
    nomApels nvarchar(100)
	);
    
    create table Maquinas_Registradoras (
	codigo int auto_increment primary key,
    piso int
	);    
    
    create table Venta (
    cajero char(5),
    maquina int,
    codigo int,
	foreign key (cajero) references Cajeros (codigo),
    foreign key (maquina) references Maquinas_Registradoras (codigo),
    foreign key (codigo) references Productos (codigo)
	);

insert into Productos (nombre, precio) values
	('Leche', 50),
    ('Aguacate', 3),
    ('Hamburguesa', 7),
    ('Lechuga', 55),
    ('Cacahuete', 3),
    ('Chocolate', 50),
    ('Agua', 3),
    ('Nestea', 7),
    ('Cocacola', 55),
    ('Chuleta', 3);

insert into Cajeros values
	(1,'Juan'),
    (2,'Pepito'),
    (3,'Alberto'),
    (4,'Nicolas'),
    (5,'Daniel'),
    (6,'Izan'),
    (7,'Oscar'),
    (8,'Eder'),
    (9,'Dani'),
    (10,'David');
    
insert into Maquinas_Registradoras(piso) values
	(5),
    (3),
    (7),
    (22),
    (33),
    (55),
    (44),
    (21),
    (34),
    (87);
    
    
update Maquinas_Registradoras SET piso = 77 where codigo = 1;
update Productos SET precio = 55 where codigo = 2;
update Cajeros SET 	nomApels = 'Load' where codigo = '3';

delete from Maquinas_Registradoras where codigo = 3;
delete from Productos where codigo = 1;
delete from Cajeros where codigo = '3' ORDER BY nomApels DESC;
    

SELECT * from Productos;
    