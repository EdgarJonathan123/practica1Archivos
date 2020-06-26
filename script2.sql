--  ***************************************************************************************************************
--  ********************************** 2. Tabla Evento Cambios ****************************************************
--  ***************************************************************************************************************

\d EVENTO;
-- 2.1. Eliminar Columnas  Fecha y Hora
alter table EVENTO drop column fecha;
alter table EVENTO drop column hora;

\d EVENTO;

-- 2.2. Crear Columna 'fecha_hora' con tipo de dato timestamp
alter table EVENTO add fecha_hora timestamp not null;

\d EVENTO;