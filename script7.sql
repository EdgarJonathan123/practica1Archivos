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
