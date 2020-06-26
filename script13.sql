--  ***************************************************************************************************************
--  *************** 13.Actualizar Numero de Telefono **************************************************************
--  ***************************************************************************************************************
select * from MIEMBRO;
update MIEMBRO set telefono=55464601    where NOMBRE='Laura' and apellido='Cunha Silva';
update MIEMBRO set telefono=91514243    where NOMBRE='Jeuel' and apellido='Villalpando';
update MIEMBRO set telefono=920686670   where NOMBRE='Scott' and apellido='Mitchell';
select * from MIEMBRO;