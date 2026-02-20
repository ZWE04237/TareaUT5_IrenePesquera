create database instituto;
use instituto;

create table alumno(
    numeMatri int(10),
    nombreAlumno varchar(40), -- Contando apellidos
    constraint pk_alumno primary key (numeMatri)
);

create table matricula(
    numeMatri int(10),
    codigoMod varchar(10),
    nota float,
    constraint pk_matricula primary key (numeMatri, codigoMod),
    constraint fk_matricula_alumno foreign key (numeMatri) references alumno(numeMatri)
    constraint fk_matricula_modulo foreign key (codigoMod) references modulo(codigoMod)
);

create table profesor(
    codigoPro varchar(10),
    nombrePro varchar(30),
    constraint pk_profesor primary key (codigoPro)
);

create table modulo(
    codigoMod varchar(10),
    nombreMod varchar(30),
    codigoPro varchar(10),
    constraint pk_modulo primary key (codigoMod),
    constraint fk_modulo_profesor foreign key (codigoPro) references profesor(codigoPro)
);