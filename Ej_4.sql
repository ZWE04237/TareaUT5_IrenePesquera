use CentroEducativo;

-- Crea un nuevo atributo llamado Edad de tipo numérico en la tabla ALUMNOS.
alter table alumnos add edad numeric(2);

-- Modifica el campo que has creado anteriormente para que la edad del alumno/a esté comprendida entre 14 y 65 años.
alter table alumnos add constraint ck_edad check (edad between 14 and 65);

-- Modifica el campo Número de horas del CURSO de manera que solo pueda haber cursos con 30, 40 o 60 horas.
alter table cursos add constraint ck_numHoTo check (numHoTo in (30, 40, 60));

-- No podemos añadir un curso si su número máximo de alumnos es inferior a 15.
alter table cursos add constraint ck_maxAlu check (maxAlu >= 15);

-- Elimina la restricción que controla los valores que puede tomar el atributo Sexo.
alter table alumnos drop constraint check_sexoAlu;

-- Elimina la columna Dirección de la tabla PROFESORES.
alter table profesores drop column direPro;

-- Cambia la clave primaria de la tabla PROFESORES por Nombre y Apellidos.
alter table profesores drop constraint pk_profesores;
alter table profesores add constraint pk_profesores primary key (nombrePro, apellido1Pro, apellido2Pro);

--Renombra la tabla PROFESORES por TUTORES.
alter table profesores rename to tutores; -- !!

-- Elimina la tabla ALUMNOS.
drop table alumnos;