create database concesionario;
use concesionario;

create table clientes(
    dnicli varchar(9),
    nombrecli varchar(10),
    ciudadcli varchar(20),
    telfcli varchar(9)
    constraint pk_clientes primary key (dnicli)
);

create table ventas(
    codventa varchar(10),
    fecha date,
    dnicli varchar(9),
    cifconcesi varchar(10),
    codcoche numeric(5),
    constraint pk_ventas primary key (codventa),
);

create table concesionarios(
    cifconcesi varchar(10),
    nombrecon varchar(20),
    ciudadcon varchar(20),
    telfcon varchar(9),
    constraint pk_concesionarios primary key (cifconcesi)
);

create table coches(
    codcoche numeric(5),
    codmarca numeric(5),
    modelo varchar(15),
    potencia numeric(4),
    numeplazas numeric(1),
    numepuertas numeric(1),
    color varchar(15),
    constraint pk_coches primary key (codcoche)
);

create table marcas(
    codmarca numeric(5),
    nombremar varchar(15),
    sedemar varchar(20),
    constraint pk_marcas primary key (codmarca)
);

alter table coches add constraint fk_coches_marca foreign key (codmarca) references marcas(codmarca) on delete cascade;
alter table ventas add constraint fk_ventas_coches foreign key (codcoche) references coches(codcoche) on delete cascade;
alter table ventas add constraint fk_ventas_clientes foreign key (dnicli) references clientes(dnicli) on delete cascade;
alter table ventas add constraint fk_ventas_concesionarios foreign key (cifconcesi) references concesionarios(cifconcesi) on delete cascade;