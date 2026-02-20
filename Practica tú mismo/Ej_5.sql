create database pub;
use pub;

create table localidad(
    cod_localidad int primary key not null,
    nombre varchar(30) not null
);

create table pub(
    cod_pub varchar(10) primary key not null,
    nombre varchar(30) not null,
    licencia_fiscal varchar(20) not null,
    domicilio varchar(30),
    fecha_apertura date not null,
    horario varchar(4) not null,
    check (horario in ('HOR1','HOR2','HOR3')),
    cod_localidad int not null,
    constraint fk_pub_localidad foreign key (cod_localidad) references localidad(cod_localidad)
);

create table titular(
    dni_titular varchar(9) primary key not null,
    nombre varchar(30) not null,
    domicilio varchar(30),
    cod_pub varchar(10) not null,
    constraint fk_titular_pub foreign key (cod_pub) references pub(cod_pub)
);

create table empleado(
    dni_empleado varchar(9) primary key not null,
    nombre varchar(30) not null,
    domicilio varchar(30)
);

create table existencias(
    cod_articulo varchar(10) primary key not null,
    nombre varchar(30) not null,
    cantidad int not null,
    precio int not null,
    check (precio > 0), -- No se puede ni a precio cero ni negativo
    cod_pub varchar(10) not null,
    constraint fk_existencias_pub foreign key (cod_pub) references pub(cod_pub)
);

create table pub_empleado(
    cod_pub varchar(10) not null,
    dni_empleado varchar(9) not null,
    funcion varchar(9) not null,
    check (funcion in ('CAMARERO','SEGURIDAD','LIMPIEZA')),
    primary key (cod_pub, dni_empleado),
    constraint fk_pub_empleado_pub foreign key (cod_pub) references pub(cod_pub),
    constraint fk_pub_empleado_empleado foreign key (dni_empleado) references empleado(dni_empleado)
);
