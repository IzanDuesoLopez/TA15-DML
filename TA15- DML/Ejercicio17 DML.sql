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
    constraint FK_id_ciclo_superior foreign key (idCiclo) references Ciclos(id)
);

create table Medio(
	id int auto_increment primary key,
    codigoCentro int,
    curso varchar(10),
    idCiclo int,
    constraint FK_id_ciclo_medio foreign key (idCiclo) references Ciclos(id)
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

create table Aulas(
	id int auto_increment primary key,
    nombre varchar(25),
    numero int,
    metros int,
    estaVacia boolean,
    idAsignatura int,
    constraint fk_id_asignatura foreign key(idAsignatura) references Asignaturas(id)
);

create table RequiereAsignaturas(
	id int auto_increment primary key,
    idAsignatura int,
    constraint fk_id_asignatura_requerida foreign key(idAsignatura) references Asignaturas(id)
);

create table Matriculas(
	id int auto_increment primary key,
    precio float,
    curso varchar(25)
);

create table Iniciaciones(
	id int auto_increment primary key,
    codigoCentro int,
    curso varchar(25),
    idCiclo int,
    constraint fk_id_ciclo_iniciaciones foreign key(idCiclo) references Ciclos(id)
);

create table Imparten(
	idAsignatura int,
    dni_profesor varchar(25),
    idHora int,
    idCiclo int,
    foreign key(idAsignatura) references Asignaturas(id),
    foreign key(dni_profesor) references Profesores(dni),
    foreign key(idHora) references Horarios(id),
    foreign key(idCiclo) references Ciclos(id)
);

create table Tutores(
	id int auto_increment primary key,
    fechainicio date,
    fechafinal date,
    dni_profesor varchar(25),
    constraint fk_tutores foreign key(dni_profesor) references Profesores(dni)
);
