use Concesionario;

create table distribucion(
    cifconcesi varchar(10),
    codcoche numeric(5),
    cantidad numeric(5),
    primary key(cifconcesi, codcoche),
    constraint fk_distribucion_concesionarios foreign key (cifconcesi) references concesionarios(cifconcesi) on delete cascade,
    constraint fk_distribucion_coches foreign key (codcoche) references coches(codcoche) on delete cascade
);