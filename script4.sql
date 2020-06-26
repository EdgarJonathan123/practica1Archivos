--  ***************************************************************************************************************
--  ********************************** 4. Crear Tabla Sede ********************************************************
--  ***************************************************************************************************************

-- 4. Se decidió que las ubicación de los eventos se registrarán previamente en
-- una tabla y que en la tabla “Evento” sólo se almacenara la llave foránea
-- según el código del registro de la ubicación, para esto debe realizar lo
-- siguiente:

-- a. Crear la tabla llamada “Sede” que tendrá los campos:
-- i. Código: será tipo entero y será la llave primaria.
-- ii. Sede: será tipo varchar(50) y será obligatoria.
create table SEDE
(
    codigo  integer         primary key,
    sede    varchar(50)     not null
);
\d SEDE;


-- b. Cambiar el tipo de dato de la columna Ubicación de la tabla Evento
-- por un tipo entero.
-- \dEVENTO;
alter table EVENTO
    alter column ubicacion type integer using ubicacion::integer;

-- \d EVENTO;

-- c. Crear una llave foránea en la columna Ubicación de la tabla Evento y
-- referenciarla a la colum
alter table EVENTO 
    add constraint FK_SEDE_CODIGO foreign key (ubicacion) references SEDE(codigo) on delete cascade;

\d EVENTO;