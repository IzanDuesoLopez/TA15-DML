drop database cientificos;

create database cientificos;

use cientificos;

create table cientificos (
	dni varchar(8),
    nom_apels nvarchar(255),
    primary key (dni)
);

create table proyectos (
	id char(4),
    nombre nvarchar(255),
    horas int,
    primary key (id)
);

create table asignado_a (
	cientifico varchar(8),
    proyecto char(4),
    primary key (cientifico, proyecto),
    foreign key (cientifico) references cientificos (dni)
    on delete cascade on update cascade,
    foreign key (proyecto) references proyectos (id)
    on delete cascade on update cascade
);

insert into cientificos values 
	('12345679', 'Francisco Vallejo Pons'),
    ('12345566', 'Jaime Santos Latasa'),
    ('23455657', 'Miguel Santos'),
    ('34578211', 'Jan Duda'),
    ('07867856', 'David Lariño'),
    ('23425667', 'David Antón'),
    ('98677544', 'Akiba Rubinstein'),
    ('67575858', 'José Raúl Capablanca'),
    ('44444444', 'Alexander Alekhine'),
    ('23555555', 'Alexander Grischuk');
    

insert into proyectos values
	('1234', 'Space Advantage', 10),
    ('3415', 'Same Color Bishops', 23),
    ('5688', 'Rook Endgames', 987),
    ('7868', 'Opposite Color Bishops', 90),
    ('2345', 'Planning in the Middlegame', 76),
    ('9786', 'Endgame Strategy', 99),
    ('1188', 'Knight and Bishop Endgame', 55),
    ('9281', 'Stalemate Patterns', 43),
    ('4343', 'Great Predecessors', 9),
    ('1122', 'Opening Preparation', 22);
    
insert into asignado_a values
	('12345679', '1234'),
    ('12345566', '3415'),
    ('23455657', '5688'),
    ('34578211', '7868'),
    ('07867856', '2345'),
    ('23425667', '9786'),
    ('98677544', '9786'),
    ('67575858', '1188'),
    ('44444444', '4343'),
    ('23555555', '1122');
    
update cientificos set nom_apels='Alexei Shirov' where dni='34578211';
update proyectos set nombre='Tactics' where id='1122';
delete from cientificos where dni='07867856';
delete from proyectos where id='4343'; 
