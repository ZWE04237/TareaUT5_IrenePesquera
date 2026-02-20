create database videoclub;
use videoclub;

create table director(
    dni varchar(9),
    nombre varchar(30),
    nacionalidad varchar(20)
);

create table pelicula(
    titulo varchar(30),
    nacionalidad varchar(20),
    productora varchar(20),
    fecha date,
    director varchar(9)
);

create table actor(
    nombre varchar(30),
    nacionalidad varchar(20),
    sexo char(1),
    check (sexo in ('M', 'F'))
);

create table ejemplares(
    numero_ejemplar int(10),
    titulo varchar(30),
    estado int, -- Nota del 1 al 10 de conservación
    check (estado between 1 and 10)
);

create table alquiler(
    ejemplar int(10),
    titulo varchar(30),
    socio varchar(9), -- dni
    fecha_prestamo date,
    fecha_devolucion date
);

create table socio(
    dni varchar(9),
    nombre varchar(30),
    direccion varchar(50),
    telefono int(9),
    aval varchar(9) -- dni del avalista
);

create table pelicula_actor(
    titulo varchar(30),
    actor int(10), -- refiriéndome al id
    participacion char(1), -- 'P' principal, 'S' secundario
    check (participacion in ('P', 'S'))
);

-- Claves primarias
alter table pelicula add id_pelicula int(10);
alter table pelicula add constraint pk_pelicula primary key (id_pelicula);

alter table actor add id_actor int(10);
alter table actor add constraint pk_actor primary key (id_actor);

alter table director add constraint pk_director primary key (dni);

alter table ejemplares add constraint pk_ejemplares primary key (numero_ejemplar);

alter table alquiler add id_alquiler int(10);
alter table alquiler add constraint pk_alquiler primary key (id_alquiler);

alter table socio add constraint pk_socio primary key (dni);

alter table pelicula_actor add id_pelicula int(10);
alter table pelicula_actor add constraint pk_pelicula_actor primary key (id_pelicula, actor);

--Claves foráneas
alter table pelicula add constraint fk_pelicula_director foreign key (director) references director(dni);
alter table alquiler add constraint fk_alquiler_ejemplar foreign key (ejemplar) references ejemplares(numero_ejemplar);
alter table alquiler add constraint fk_alquiler_socio foreign key (socio) references socio(dni);
alter table pelicula_actor add constraint fk_pelicula_actor_pelicula foreign key (id_pelicula) references pelicula(id_pelicula);
alter table pelicula_actor add constraint fk_pelicula_actor_actor foreign key (actor) references actor(id_actor);

-- Añade un campo fechanac en la tabla socio de tipo fecha.
alter table socio add fechanac date;

-- Añadir el campo importe en la tabla alquileres o préstamos. Este campo no puede ser nulo.
alter table alquiler add importe float not null;

-- La Fecha de devolución no pude ser menor que la de préstamo.
alter table alquiler add constraint ck_edad check (fecha_devolucion >= fecha_prestamo);

-- Añade una columna a la tabla Películas, llamada DineroGenerado, no puede ser nula.
alter table pelicula add dinero_generado float not null;