-- Crear base y tablas

create database comercio;
use comercio;

create table comercial(
    id int primary key,
    nombre varchar(100),
    apellido1 varchar(100),
    apellido2 varchar(100),
    ciudad varchar(100),
    comision float
);

create table cliente(
    id int primary key,
    nombre varchar(25),
    primer_apellido varchar(15),
    ciudad varchar(100),
    categoria int
);

-- Una vez ejecutado el script y creada la base de datos en MySQL Server, ¿qué sentencia SQL deberías ejecutar para modificar el encoding de la base de datos y utilizar utf8mb4 en lugar de latin1?
alter database comercio character set = utf8mb4 collate = utf8mb4_unicode_520_ci;

-- Modifica la columna nombre de la tabla cliente para que pueda almacenar cadenas de hasta 100 caracteres y para que no pueda ser NULL.
alter table cliente modify nombre varchar(100) not null;

-- ¿Qué comando podemos ejecutar para comprobar que el cambio que se ha realizado en el paso anterior se ha ejecutado correctamente?
describe cliente;

-- Modificar el nombre de la columna primer_apellido y asígnale apellido1. También se deben permitir que pueda almacenar hasta 100 caracteres y que no pueda ser un valor NULL.
alter table cliente change primer_apellido apellido1 varchar(100) not null;

-- Añade una nueva columna a la tabla cliente para poder almacenar el segundo apellido. La columna se debe llamar apellido2 debe estar entre la columna apellido1 y ciudad, puede almacenar hasta 100 caracteres y puede ser NULL.
alter table cliente add apellido2 varchar(100) null after apellido1;

-- Elimina la columna categoria de la tabla cliente.
alter table cliente drop column categoria;

-- Modifica la columna comision de la tabla comercial para que almacene por defecto el valor 10.
alter table comercial modify comision float default 10;