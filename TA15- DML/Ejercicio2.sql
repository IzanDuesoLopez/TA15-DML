drop database piezas_y_proveedores;
create database piezas_y_proveedores;
use piezas_y_proveedores;

create table Piezas(
    codigo int auto_increment primary key,
    nombre nvarchar(100)
);

create table Proveedores(
    id char(4) primary key,
    nombre nvarchar(100)
);

create table Suministra(
    codigoPieza int,
    idProveedor char(4),
    foreign key(codigoPieza) references Piezas(codigo),
    foreign key(idProveedor) references Proveedores(id)
);

Insert into Proveedores values
        (1, 'Volk'),
        (2, 'Mer2'),
        (3, 'RB'),
        (4, 'Seat'),
        (5, 'Audi'),
        (6, 'Jag'),
        (7, 'John Deer'),
        (8, 'Ferrari'),
        (9, 'Porsche'),
        (10, 'Mc Claren');

Insert into Piezas(nombre) values
        ('Tornillo'),
        ('Tuerca'),
        ('Destornillador'),
        ('Llave Allen'),
        ('Motor'),
        ('Ventanilla'),
        ('Puerta'),
        ('Baterías'),
        ('Frenos'),
        ('Calefacción');

show columns from Suministra;

update Piezas set nombre = 'Llave Allen' where codigo = 1;

DELETE FROM Piezas ORDER BY nombre DESC LIMIT 1;
DELETE FROM Proveedores ORDER BY id DESC LIMIT 3;
