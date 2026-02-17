create database empresa;
use empresa;

create table departamentos(
    dpto_cod int,
    nombre_dpto varchar(10) not null,
    dpto_padre int,
    presupuesto int not null,
    pres_actual int,
    constraint pk_departamentos primary key (dpto_cod),
    constraint uq_departamentos_nombre unique (nombre_departamentos),
    constraint fk_departamentos_dpto_padre foreign key (dpto_pdare) references departamentos(dpto_cod)
);

create table estudios(
    empleado_dni varchar(9),
    universidad int,
    anio decimal(4,0),
    grado varchar(20),
    especialidad varchar(15),
    constraint pk_estudios primary key (empleado_dni, grado, especialidad),
    constraint fk_estudios_empleado_dni foreign key (empleado_dni) references empleados(dni),
    constraint fk_estudios_universidad foreign key (universidad) references universidades(univ_cod)
);

create table historial_laboral(
    empleado_dni varchar(9),
    trabajo_cod int,
    fecha_inicio date,
    fecha_fin date,
    dpto_cod int,
    supervisor_dni varchar(9),
    constraint pk_historial_laboral primary key (empleado_dni, trabajo_cod, fecha_inicio),
    constraint fk_historial_laboral_empleado_dni foreign key (empleado_dni) references empleados(dni),
    constraint fk_historial_laboral_trabajo_cod foreign key (trabajo_cod) references trabajos(trabajo_cod),
    constraint fk_historial_laboral_dpto_cod foreign key (dpto_cod) references departamentos(dpto_cod),
    constraint fk_historial_laboral_supervisor_dni foreign key (supervisor_dni) references empleados(dni)
);

create table historial_salarial( -- En la corrección no aparece, supongo que es algo así
    empleado_dni varchar(9),
    salario int,
    fecha_comienzo date,
    fecha_fin date,
    constraint pk_historial_salarial primary key (empleado_dni, fecha_comienzo),
    constraint fk_historial_salarial_empleado_dni foreign key (empleado_dni) references empleados(dni)
);

create table empleados(
    dni varchar(9),
    nombre varchar(10) not null,
    apellido1 varchar(10) not null,
    apellido2 varchar(10),
    direcc1 varchar(20),
    direcc2 varchar(20),
    ciudad varchar(20),
    cod_postal decimal(5,0),
    sexo char,
    fecha_nac date,
    constraint pk_empleados primary key (dni),
    constraint ck_empleados_sexo check (sexo = 'H' or sexo = 'M') -- !!!
);

create table universidades(
    univ_cod int,
    nombre_univ varchar(20) not null,
    ciudad varchar(20),
    municipio varchar(20),
    cod_postal decimal(5,0),
    constraint pk_universidades primary key (univ_cod),
    );

create table trabajos(
    trabajo_cod int,
    nombre_trab varchar(20) not null,
    salario_min decimal(6,2) not null,
    salario_max decimal(6,2) not null,
    constraint pk_trabajos primary key (trabajo_cod),
    constraint uq_trabajos_nombre unique (nombre_trab)
);
