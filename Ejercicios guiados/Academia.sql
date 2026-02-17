create database academia;
use academia;

create table departamentos(
    dnume numeric(3) not null,
    dnombre varchar(15),
    dedificio numeric(3),
    ddire varchar(20),
    constraint pk_departamentos primary key (dnume)
);

create table estudiantes(
    esnume numeric(2) not null,
    esnombre varchar(15),
    esapelli varchar(25),
    esdomi varchar(10),
    esedad numeric(2),
    constraint pk_estudiantes primary key (esnume)
);

create table profesores(
    pnume numeric(2) not null,
    prnombre varchar(25),
    pdomi varchar(10),
    pdepar numeric(3),
    constraint pk_profesores primary key (pnume),
    constraint fk_profesores_departamentos foreign key (pdepar) references departementos (dnume)
);

create table cursos(
    cnume varchar(3) not null,
    cnombre varchar(25),
    cdescrip varchar(10),
    ccredito numeric(2),
    ctarifa numeric(3),
    cprofe numeric(2),
    cdia numeric(9),
    chora varchar(5),
    constraint pk_cursos primary key (cnume),
    constraint pk_cursos_profesores foreign key (cprofe) references profesores (pnume)
);

create table clases(
    clnume varchar(3) not null,
    clcurso varchar(3) not null,
    cledificio numeric(1),
    constraint pk_clases primary key (clnume, clcurso),
    constraint fk_clases_cursos foreign key (clcurso) references cursos (cnume)
);

create table matriculas(
    manues numeric(2) not null,
    manucu varchar(3) not null,
    constraint pk_matriculas primary key (manues, manucu),
    constraint fk_matriculas_estudiantes foreign key (manues) references estudiantes (esnume),
    constraint fk_matriculas_cursos foreign key (manucu) references cursos (cnume)
);
