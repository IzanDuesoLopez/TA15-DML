create database horario_escolar;
use horario_escolar;

create table Ciclos(
	id int auto_increment primary key,
    nombre varchar(25)
);

create table Superior(
	id int auto_increment primary key,
    codigoCentro int, 
    curso varchar(10),
    idCiclo int,
    constraint FK_id_ciclo foreign key (idCiclo) references Ciclos(id)
);

create table Medio(
	id int auto_increment primary key,
    codigoCentro int,
    curso varchar(10),
    idCiclo int,
    constraint FK_id_ciclo foreign key (idCiclo) references Ciclos(id)
);

create table Horarios(
	id int auto_increment primary key,
    hora time,
    dia date
);

create table Profesores(
	dni int primary key,
    nombre varchar(25),
    direccion varchar(25),
    telefono varchar(15),
    email varchar(25),
    nSeguridadSocial varchar(30),
    codigoInterno int,
    añosAntiguedad int,
    idHora int,
    idCiclo int,
    constraint FK_id_hora foreign key(idCiclo) references Ciclos(id),
    constraint FK_id_ciclo foreign key(idHora) references Horarios(id)
);

create table Asignaturas(
	id int auto_increment primary key,
    nombre varchar(25),
    codigoCentro int,
    codigoEuropeo int,
    dni_profesor int,
    constraint fk_dni_profesor foreign key(dni_profesor) references Profesores(dni)
);