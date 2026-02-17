create database centro_educativo;
use centro_educativo;

create table profesores (
    nombrePro varchar(10) unique,
    apellido1Pro varchar(15),
    apellido2Pro varchar(15),
    nifPro varchar(9),
    direPro varchar(25),
    tituloPro varchar(25),
    salario decimal(6,2) not null,
    constraint pk_profesores primary key (nifPro)
);

create table alumnos(
    nombreAlu varchar(10),
    apellido1Alu varchar(15),
    apellido2Alu varchar(15),
    nifAlu varchar(9),
    direccionAlu varchar(25),
    sexoAlu char,
    fechaNacAlu date,
    cursoAlu numeric(5),
    constraint pk_alumnos primary key (nifAlu),
    constraint fk_cursoAlu_cursos foreign key (cursoAlu) references cursos(codigoCur),
    constraint check_sexoAlu check (sexoAlu in ('H', 'M'))
);

create table cursos (
    nombreCur varchar(15) unique,
    codigoCur numeric(5),
    nifProfe varchar(9),
    maxAlu numeric(3),
    fechaIni date,
    fechaFin date,
    numHoTo numeric(3) not null,
    constraint pk_cursos primary key (codigoCur)
    constraint fk_cursos_profesores foreign key (nifProfe) references profesores(nifPro) on delete cascade,
    constraint check_curso_fecha check (fechaFin > fechaIni)
);