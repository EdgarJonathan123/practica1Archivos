/*****************  Comandos  **********************************/
/*---Ingresar al dbms               ->  sudo -u postgres psql    */
/*---Limpiar la pantalla            ->  ctrl + l                 */
/*---Salir de la consola            ->  ctrl + d                 */
/*---Ejecutar algun script          ->  \i  'path/postgres.sql'; */
/*---Listar las bases de datos      ->  \l                       */
/*---Informacion de la conexion     ->  \conninfo                */
/*---Ver las tablas creadas         ->  \dt                      */
/*---Ver una table y tipo de datos  ->  \dt  table;              */
/*---Conectarse a una BD especifica  >  \c              */

-- create database olimpic;

-- \c olimpic;


\dt;

/* Eliminando las tablas */
drop table PROFESION            cascade;
drop table PAIS                 cascade;
drop table PUESTO               cascade;
drop table DEPARTAMENTO         cascade;
drop table MIEMBRO              cascade;
drop table PUESTO_MIEMBRO       cascade;
drop table TIPO_MEDALLA         cascade;
drop table MEDALLERO            cascade;
drop table DISCIPLINA           cascade;
drop table ATLETA               cascade;
drop table CATEGORIA            cascade;
drop table TIPO_PARTICIPACION   cascade;
drop table EVENTO               cascade;
drop table EVENTO_ATLETA        cascade;
drop table TELEVISORA           cascade;
drop table COSTO_EVENTO         cascade;
drop table SEDE                 cascade;

--  ***************************************************************************************************************
--  ********************************** 1. Creacion de Tablas ******************************************************
--  ***************************************************************************************************************
\dt;
-- orden segun las imagenes
create table  PROFESION
(
    cod_prof integer        primary key,
    nombre   VARCHAR(50)    not null unique
);
-- \d PROFESION;

create table PAIS
(
    cod_pais integer     primary key,
    nombre   VARCHAR(50) not null unique
);
-- \d PAIS;

-- ALTER TABLE PAIS DROP CONSTRAINT pais_nombre_key;
-- \d PAIS;

create table PUESTO
(
    cod_puesto integer      primary key,
    nombre     varchar(50)  not null unique
);
-- \d PUESTO;

create table DEPARTAMENTO
(
    cod_depto integer       primary key,
    nombre    varchar(50)   not null unique
);
-- \d DEPARTAMENTO;

create table MIEMBRO
(
    cod_miembro         integer         primary key ,
    nombre              varchar(100)    not null,
    apellido            varchar(100)    not null,
    edad                integer         not null,
    telefono            integer         null,
    residencia          varchar(100)    null,
    PAIS_cod_pais       integer         not null,
    PROFESION_cod_prof  integer         not null,

    foreign key (PAIS_cod_pais)         references PAIS     (cod_pais) on delete cascade,
    foreign key (PROFESION_cod_prof)    references PROFESION(cod_prof) on delete cascade
);
-- \d MIEMBRO;

create table  PUESTO_MIEMBRO
(
    fecha_inicio            date        not null,
    fecha_fin               date        null,

    MIEMBRO_cod_miembro     integer     not null,
    PUESTO_cod_puesto       integer     not null,
    DEPARTAMENTO_cod_depto  integer     not null,

    foreign key (MIEMBRO_cod_miembro)   references MIEMBRO  (cod_miembro)   on delete cascade,
    foreign key (PUESTO_cod_puesto)     references PUESTO   (cod_puesto)    on delete cascade,
    foreign key (DEPARTAMENTO_cod_depto)references DEPARTAMENTO(cod_depto)  on delete cascade,

    primary key ( MIEMBRO_cod_miembro, PUESTO_cod_puesto, DEPARTAMENTO_cod_depto)
);
-- \d PUESTO_MIEMBRO;

create table TIPO_MEDALLA
(
    cod_tipo    integer         primary key,
    medalla     varchar(20)     unique
);
-- \d TIPO_MEDALLA;

create table MEDALLERO
(
    cantidad_medallas       integer     not null,
    TIPO_MEDALLA_cod_tipo   integer     not null,
    PAIS_cod_pais           integer     not null,

    foreign key (TIPO_MEDALLA_cod_tipo) references  TIPO_MEDALLA (cod_tipo)  on delete cascade,
    foreign key (PAIS_cod_pais)         references  PAIS         (cod_pais)  on delete cascade,

    primary key (TIPO_MEDALLA_cod_tipo, PAIS_cod_pais)      
);
-- \d MEDALLERO;

create table DISCIPLINA
(
    cod_disciplina  integer         primary key,
    nombre          varchar(50)     not null,
    descripcion     varchar(150)    null
);
-- \d DISCIPLINA;

create table ATLETA
(
    cod_atleta                  integer         primary key,
    nombre                      varchar(50)     not null,
    apellido                    varchar(50)     not null, 
    edad                        integer         not null,
    participaciones             varchar(100)    not null,

    DISCIPLINA_cod_disciplina   integer         not null,
    PAIS_cod_pais               integer         not null,

    foreign key(DISCIPLINA_cod_disciplina)  references DISCIPLINA (cod_disciplina)  on delete cascade,
    foreign key(PAIS_cod_pais)              references PAIS       (cod_pais)        on delete cascade
);
-- \d ATLETA;

create table CATEGORIA
(
    cod_categoria   integer         primary key,
    categoria       varchar(50)     not null
);
-- \d CATEGORIA;

create table TIPO_PARTICIPACION
(
    cod_participacion   integer         primary key,
    tipo_participacion  varchar(100)    not null
);
-- \d TIPO_PARTICIPACION;


create table EVENTO
(
    cod_evento      integer         primary key,
    fecha           date            not null,
    ubicacion       varchar(50)     not null,
    hora            time            not null,

    DISCIPLINA_cod_disciplina                   integer         not null,
    TIPO_PARTICIPACION_cod_participacion        integer         not null,
    CATEGORIA_cod_categoria                     integer         not null,

    foreign key (DISCIPLINA_cod_disciplina)             references DISCIPLINA         (cod_disciplina)    on delete cascade,
    foreign key (TIPO_PARTICIPACION_cod_participacion)  references TIPO_PARTICIPACION (cod_participacion) on delete cascade,
    foreign key (CATEGORIA_cod_categoria)               references CATEGORIA          (cod_categoria)     on delete cascade
);
-- \d EVENTO;

create table EVENTO_ATLETA
(
    ATLETA_cod_atleta   integer     not null,
    EVENTO_cod_evento   integer     not null,

    foreign key (ATLETA_cod_atleta)     references  ATLETA      (cod_atleta)      on delete cascade,
    foreign key (EVENTO_cod_evento)     references  EVENTO      (cod_evento)      on delete cascade,

    primary key (ATLETA_cod_atleta, EVENTO_cod_evento)
);
-- \d EVENTO_ATLETA;

create table TELEVISORA
(
    cod_televisora      integer         primary key,
    nombre              varchar(50)     not null
);
-- \d TELEVISORA;

create table COSTO_EVENTO
(
    tarifa                      integer     not null,
    EVENTO_cod_evento           integer     not null,
    TELEVISORA_cod_televisora   integer     not null,

    foreign key (EVENTO_cod_evento)             references EVENTO       (cod_evento)        on delete cascade,
    foreign key (TELEVISORA_cod_televisora)     references TELEVISORA   (cod_televisora)    on delete cascade,

    primary key (EVENTO_cod_evento, TELEVISORA_cod_televisora)

);
-- \d COSTO_EVENTO;

\dt;


--  ***************************************************************************************************************
--  ********************************** 2. Tabla Evento Cambios ****************************************************
--  ***************************************************************************************************************

-- \d EVENTO;
-- 2.1. Eliminar Columnas  Fecha y Hora
alter table EVENTO drop column fecha;
alter table EVENTO drop column hora;

-- \d EVENTO;

-- 2.2. Crear Columna 'fecha_hora' con tipo de dato timestamp
alter table EVENTO add fecha_hora timestamp not null;

-- \d EVENTO;


--  ***************************************************************************************************************
--  ********************************** 3. Restringir Fecha Evento *************************************************
--  ***************************************************************************************************************

-- Todos los eventos de las olimpiadas deben ser programados del 24 de julio
-- de 2020 a partir de las 9:00:00 hasta el 09 de agosto de 2020 hasta las
-- 20:00:00.

alter table EVENTO add constraint FECHA_EVENTO check(fecha_hora > '2020-07-24 09:00:00' and fecha_hora < '2020-08-09 20:00:00'); 

-- \d EVENTO;

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
-- \d SEDE;


-- b. Cambiar el tipo de dato de la columna Ubicación de la tabla Evento
-- por un tipo entero.
alter table EVENTO
    alter column ubicacion type integer using ubicacion::integer;

-- \d EVENTO;

-- c. Crear una llave foránea en la columna Ubicación de la tabla Evento y
-- referenciarla a la colum
alter table EVENTO 
    add constraint FK_SEDE_CODIGO foreign key (ubicacion) references SEDE(codigo) on delete cascade;

-- \d EVENTO;

--  ***************************************************************************************************************
--  ***************************** 5. Verificacion Numero Telefonico ***********************************************
--  ***************************************************************************************************************

-- 5. Se revisó la información de los miembros que se tienen actualmente y antes
-- de que se ingresen a la base de datos el Comité desea que a los miembros
-- que no tengan número telefónico se le ingrese el número por Default 0 al
-- momento de ser cargados a la base de datos.
alter  table MIEMBRO alter column telefono set default 0;
\d MIEMBRO;

--  ***************************************************************************************************************
--  *********************************** 6. Insercion de datos *****************************************************
--  ***************************************************************************************************************

--  ************PAIS
insert into pais (cod_pais, nombre) values(1,'Guatemala');
insert into pais (cod_pais, nombre) values(2,'Francia');
insert into pais (cod_pais, nombre) values(3,'Argentina');
insert into pais (cod_pais, nombre) values(4,'Alemania');
insert into pais (cod_pais, nombre) values(5,'Italia');
insert into pais (cod_pais, nombre) values(6,'Brasil');
insert into pais (cod_pais, nombre) values(7,'Estados Unidos');

--  ************PROFESION
insert into PROFESION (cod_prof, nombre) values(1,'Medico');
insert into PROFESION (cod_prof, nombre) values(2,'Arquitecto');
insert into PROFESION (cod_prof, nombre) values(3,'Ingeniero');
insert into PROFESION (cod_prof, nombre) values(4,'Secretaria');
insert into PROFESION (cod_prof, nombre) values(5,'Auditor');

--  ************MIEMBRO
insert into MIEMBRO (cod_miembro,nombre,apellido,edad,telefono,residencia,PAIS_cod_pais,PROFESION_cod_prof) 
            values  (1,'Scott','Mitchell',32,null,'1092 Highland Drive Manitowoc, WI 54220',7,3);
insert into MIEMBRO (cod_miembro,nombre,apellido,edad,telefono,residencia,PAIS_cod_pais,PROFESION_cod_prof) 
            values(2,'Fanette','Poulin',25,25075853,'49, boulevard Aristide Briand 76120 LE GRAND-QUEVILLY',2,4);
insert into MIEMBRO (cod_miembro,nombre,apellido,edad,telefono,residencia,PAIS_cod_pais,PROFESION_cod_prof) 
            values(3,'Laura','Cunha Silva',55,null,'Rua Onze, 86 Uberaba-MG',6,5);
insert into MIEMBRO (cod_miembro,nombre,apellido,edad,telefono,residencia,PAIS_cod_pais,PROFESION_cod_prof) 
            values(4,'Juan Jose','Lopez',38,36985247,'26 calle 4-10 zona 11',1,2);
insert into MIEMBRO (cod_miembro,nombre,apellido,edad,telefono,residencia,PAIS_cod_pais,PROFESION_cod_prof) 
            values(5,'Arcangela','Punicucci',39,391664921,'Via Santa Teresa, 114 90010-Geraci Siculo PA',5,1);
insert into MIEMBRO (cod_miembro,nombre,apellido,edad,telefono,residencia,PAIS_cod_pais,PROFESION_cod_prof) 
            values(6,'Jeuel','Villalpando',31,null,'Acuña de Figeroa 6106 80101 Playa Pascual',3,5);

--  ************DISCIPLINA
insert into DISCIPLINA (cod_disciplina,nombre,descripcion) 
            values(1,'Atletismo','Saltos de longitud y triples, de altura y con pértiga o garrocha; las pruebas de lanzamiento de martillo, jabalina y disco.');
insert into DISCIPLINA (cod_disciplina,nombre,descripcion) 
            values(2,'Badminton',null);
insert into DISCIPLINA (cod_disciplina,nombre,descripcion)
            values(3,'ciclismo',null);
insert into DISCIPLINA (cod_disciplina,nombre,descripcion)
            values(4,'judo','Es un arte marcial que se originó en Japón alrededor de 1880');
insert into DISCIPLINA (cod_disciplina,nombre,descripcion)
            values(5,'lucha',null);
insert into DISCIPLINA (cod_disciplina,nombre,descripcion)
            values(6,'Tenis de mesa',null);
insert into DISCIPLINA (cod_disciplina,nombre,descripcion) 
            values(7,'Boxeo',null);
insert into DISCIPLINA (cod_disciplina,nombre,descripcion) 
            values(8,'Natacion','Está presente como deporte en los Juegos desde la primera edición de la era moderna, en Atenas, Grecia, en 1896, donde se disputo en aguas abiertas.');
insert into DISCIPLINA (cod_disciplina,nombre,descripcion) 
            values(9,'Esgrima',null);
insert into DISCIPLINA (cod_disciplina,nombre,descripcion) 
            values(10,'Vela',null);

--  ************TIPO_MEDALLA
insert into TIPO_MEDALLA (cod_tipo,medalla) values(1,'Oro');
insert into TIPO_MEDALLA (cod_tipo,medalla) values(2,'Plata');
insert into TIPO_MEDALLA (cod_tipo,medalla) values(3,'Bronce');
insert into TIPO_MEDALLA (cod_tipo,medalla) values(4,'Platino');

--  ************CATEGORIA
insert into CATEGORIA (cod_categoria,categoria) values(1,'Clasificatorio');
insert into CATEGORIA (cod_categoria,categoria) values(2,'Eliminatorio');
insert into CATEGORIA (cod_categoria,categoria) values(3,'final');

--  ************TIPO_PARTICIPACION
insert into TIPO_PARTICIPACION (cod_participacion,tipo_participacion) values(1,'Individual');
insert into TIPO_PARTICIPACION (cod_participacion,tipo_participacion) values(2,'Parejas');
insert into TIPO_PARTICIPACION (cod_participacion,tipo_participacion) values(3,'Equipos');

--  ************MEDALLERO
insert into MEDALLERO (PAIS_cod_pais,TIPO_MEDALLA_cod_tipo,cantidad_medallas) values(5,1,3);
insert into MEDALLERO (PAIS_cod_pais,TIPO_MEDALLA_cod_tipo,cantidad_medallas) values(2,1,5);
insert into MEDALLERO (PAIS_cod_pais,TIPO_MEDALLA_cod_tipo,cantidad_medallas) values(6,3,4);
insert into MEDALLERO (PAIS_cod_pais,TIPO_MEDALLA_cod_tipo,cantidad_medallas) values(4,4,3);
insert into MEDALLERO (PAIS_cod_pais,TIPO_MEDALLA_cod_tipo,cantidad_medallas) values(7,3,10);
insert into MEDALLERO (PAIS_cod_pais,TIPO_MEDALLA_cod_tipo,cantidad_medallas) values(3,2,8);
insert into MEDALLERO (PAIS_cod_pais,TIPO_MEDALLA_cod_tipo,cantidad_medallas) values(1,1,2);
insert into MEDALLERO (PAIS_cod_pais,TIPO_MEDALLA_cod_tipo,cantidad_medallas) values(1,4,5);
insert into MEDALLERO (PAIS_cod_pais,TIPO_MEDALLA_cod_tipo,cantidad_medallas) values(5,2,7);

--  ************SEDE
insert into SEDE (codigo,sede) values(1,'Gimnasio Metropolitano de Tokio');
insert into SEDE (codigo,sede) values(2,'Jardín del Palacio Imperial de Tokio');
insert into SEDE (codigo,sede) values(3,'Gimnasio Nacional Yoyogi');
insert into SEDE (codigo,sede) values(4,'Nippon Budokan');
insert into SEDE (codigo,sede) values(5,'Estadio Olímpico');

--  ************EVENTO
insert into EVENTO (cod_evento,fecha_hora,ubicacion,DISCIPLINA_cod_disciplina,TIPO_PARTICIPACION_cod_participacion  ,CATEGORIA_cod_categoria)
            values(1,'2020-07-24 11:00:00',3,2,2,1);
insert into EVENTO (cod_evento,fecha_hora,ubicacion,DISCIPLINA_cod_disciplina,TIPO_PARTICIPACION_cod_participacion  ,CATEGORIA_cod_categoria) 
            values(2,'2020-07-26 10:30:00',1,6,1,3);
insert into EVENTO (cod_evento,fecha_hora,ubicacion,DISCIPLINA_cod_disciplina,TIPO_PARTICIPACION_cod_participacion  ,CATEGORIA_cod_categoria) 
            values(3,'2020-07-30 18:45:00',5,7,1,2);
insert into EVENTO (cod_evento,fecha_hora,ubicacion,DISCIPLINA_cod_disciplina,TIPO_PARTICIPACION_cod_participacion  ,CATEGORIA_cod_categoria)
            values(4,'2020-08-01 12:15:00',2,1,1,1);
insert into EVENTO (cod_evento,fecha_hora,ubicacion,DISCIPLINA_cod_disciplina,TIPO_PARTICIPACION_cod_participacion  ,CATEGORIA_cod_categoria)
             values(5,'2020-08-08 19:35:00',4,10,3,1);
-- \dt;


--  ***************************************************************************************************************
--  *********************************** 7. Restriccion UNIQUE *****************************************************
--  ***************************************************************************************************************

-- Después de que se implementó el script el cuál creó todas las tablas de las
-- bases de datos, el Comité Olímpico Internacional tomó la decisión de
-- eliminar la restricción “UNIQUE” de las siguientes tablas:

--  PAIS         nombre
\d PAIS;
alter table PAIS drop constraint pais_nombre_key;
\d PAIS;

--  TIPO_MEDALLA medalla
\d TIPO_MEDALLA;
alter table TIPO_MEDALLA drop constraint tipo_medalla_medalla_key;
\d TIPO_MEDALLA;

--  DEPARTAMENTO NOMBRE
\d DEPARTAMENTO;
alter table DEPARTAMENTO drop constraint departamento_nombre_key;
\d DEPARTAMENTO;


--  ***************************************************************************************************************
--  *********************************** 8. Romper Relacion ********************************************************
--  ***************************************************************************************************************
-- Después de un análisis más profundo se decidió que los Atletas pueden
-- participar en varias disciplinas y no sólo en una como está reflejado
-- actualmente en las tablas, por lo que se pide que realice lo siguiente.

-- a. Script que elimine la llave foránea de “cod_disciplina” que se
-- encuentra en la tabla “Atleta”.
\d ATLETA;
alter table ATLETA drop constraint atleta_disciplina_cod_disciplina_fkey;
\d ATLETA;


-- b. Script que cree una tabla con el nombre “Disciplina_Atleta” que
-- contendrá los siguiente campos:
-- i. Cod_atleta (llave foránea de la tabla Atleta)
-- ii. Cod_disciplina (llave foránea de la tabla Disciplina)
-- La llave primaria será la
create table DISCIPLINA_ATLETA
(
    cod_atleta                  integer not null,
    cod_disciplina              integer not null,

    foreign key(cod_atleta)     REFERENCES ATLETA(cod_atleta)           on delete cascade,
    foreign key(cod_disciplina) REFERENCES DISCIPLINA(cod_disciplina)   on delete cascade,

    primary key(cod_atleta,cod_disciplina)
);

\d DISCIPLINA_ATLETA;

--  ***************************************************************************************************************
--  *********************************** 9. Columna Tarifa Cambiar  a decimal **************************************
--  ***************************************************************************************************************
\d COSTO_EVENTO;
alter table COSTO_EVENTO alter column tarifa TYPE numeric(38,2);
\d COSTO_EVENTO;


--  ***************************************************************************************************************
--  *********************************** 10.Borrar Registro *********************************************************
--  ***************************************************************************************************************
select * from MEDALLERO;
select * from TIPO_MEDALLA;
delete from TIPO_MEDALLA where Medalla='Platino';
select * from TIPO_MEDALLA;
select * from MEDALLERO;

--  ***************************************************************************************************************
--  *********************************** 11.Borrar Registro ********************************************************
--  ***************************************************************************************************************
\dt;
drop table TELEVISORA cascade;
drop table COSTO_EVENTO cascade;
\dt;

--  ***************************************************************************************************************
--  *************** 12.Eliminar Contenido Tabla disciplina ********************************************************
--  ***************************************************************************************************************
select * from DISCIPLINA;
delete from DISCIPLINA;
select * from DISCIPLINA;

--  ***************************************************************************************************************
--  *************** 13.Actualizar Numero de Telefono **************************************************************
--  ***************************************************************************************************************
select * from MIEMBRO;
update MIEMBRO set telefono=55464601    where NOMBRE='Laura' and apellido='Cunha Silva';
update MIEMBRO set telefono=91514243    where NOMBRE='Jeuel' and apellido='Villalpando';
update MIEMBRO set telefono=920686670   where NOMBRE='Scott' and apellido='Mitchell';
select * from MIEMBRO;

--  ***************************************************************************************************************
--  *************** 14.Agregar Columna Fotografia *****************************************************************
--  ***************************************************************************************************************
\d ATLETA;
alter table ATLETA add fotografia varchar(250) null;
\d ATLETA;
--  ***************************************************************************************************************
--  *************** 15. Atletas Menores a 25 anios ****************************************************************
--  ***************************************************************************************************************
\d ATLETA;
alter table ATLETA add constraint verifica_edad CHECK (edad<25);
\d ATLETA;