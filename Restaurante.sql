create database restaurante;
use restaurante;

create table clientes(
    id_cliente varchar(10),
    nom_cli varchar(30),
    direccion varchar(30),
    localidad varchar(30),
    telefono numeric(9) not null,
    constraint PK_Clientes_Id_Cliente primary key (id_cliente),
    constraint UQ_Clientes_Telefono unique (telefono)
);

create table pedidos(
    id_pedido varchar(10),
    id_cliente varchar(10),
    fecha date,
    importe decimal(10,2) not null,
    constraint PK_Pedidos_Id_Pedido primary key (id_pedido)
);

create table platos(
    id_plato varchar(10),
    desc_plato varchar(100),
    ingredientes varchar(100),
    precio decimal(10,2) not  null,
    constraint PK_Platos_Id_Plato primary key (id_plato)
);

create table detalle_pedido(
    id_pedido varchar(10),
    id_plato varchar(10),
    num_platos numeric(2) not null,
    constraint PK_Detalle_Pedidos primary key (id_pedido, id_plato),
    constraint fk_id_pedido_pedidos foreign key (id_pedido) references pedido(id_pedido),
    constraint fk_id_plato_pedidos foreign key (id_plato) references platos(id_plato)
);

alter table clientes add c_postal numeric(5);
alter table pedidos add constraint FK_Pedidios_Id_Cliente foreign key(id_cliente) references clientes(id_cliente);
alter table clientes change c_postal codigo_postal numeric(5);
alter table platos add constraint ck_precio_plato check(precio between 1 and 1000);