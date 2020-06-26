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

select * from pais;

--  ************PROFESION
insert into PROFESION (cod_prof, nombre) values(1,'Medico');
insert into PROFESION (cod_prof, nombre) values(2,'Arquitecto');
insert into PROFESION (cod_prof, nombre) values(3,'Ingeniero');
insert into PROFESION (cod_prof, nombre) values(4,'Secretaria');
insert into PROFESION (cod_prof, nombre) values(5,'Auditor');

select * from PROFESION;

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

select * from MIEMBRO;

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

select * from DISCIPLINA;

--  ************TIPO_MEDALLA
insert into TIPO_MEDALLA (cod_tipo,medalla) values(1,'Oro');
insert into TIPO_MEDALLA (cod_tipo,medalla) values(2,'Plata');
insert into TIPO_MEDALLA (cod_tipo,medalla) values(3,'Bronce');
insert into TIPO_MEDALLA (cod_tipo,medalla) values(4,'Platino');
select * from TIPO_MEDALLA;

--  ************CATEGORIA
insert into CATEGORIA (cod_categoria,categoria) values(1,'Clasificatorio');
insert into CATEGORIA (cod_categoria,categoria) values(2,'Eliminatorio');
insert into CATEGORIA (cod_categoria,categoria) values(3,'final');
select* from CATEGORIA;

--  ************TIPO_PARTICIPACION
insert into TIPO_PARTICIPACION (cod_participacion,tipo_participacion) values(1,'Individual');
insert into TIPO_PARTICIPACION (cod_participacion,tipo_participacion) values(2,'Parejas');
insert into TIPO_PARTICIPACION (cod_participacion,tipo_participacion) values(3,'Equipos');
select * from TIPO_PARTICIPACION;

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
select * from MEDALLERO;

--  ************SEDE
insert into SEDE (codigo,sede) values(1,'Gimnasio Metropolitano de Tokio');
insert into SEDE (codigo,sede) values(2,'Jardín del Palacio Imperial de Tokio');
insert into SEDE (codigo,sede) values(3,'Gimnasio Nacional Yoyogi');
insert into SEDE (codigo,sede) values(4,'Nippon Budokan');
insert into SEDE (codigo,sede) values(5,'Estadio Olímpico');
select * from SEDE;

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
select*from EVENTO;
\dt;