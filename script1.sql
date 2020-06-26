
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
drop table disciplina_atleta    cascade;
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
