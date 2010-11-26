CREATE OR REPLACE VIEW vw_detallesdecueta AS 
 SELECT tblusuario.nombreusuario, tblcuentas.fecharegistro, tblcuentas.fechaactivacion, tblcuentas.fechadesactivacion
   FROM tblusuario
   LEFT JOIN tblcuentas ON tblusuario.idcuentas = tblcuentas.idcuentas;
-------------------------------------------------------------------------------------------------------------------
CREATE OR REPLACE VIEW vw_familiares AS 
 SELECT tblusuario.nombreusuario, tblfamiliares.nombre AS nombre_del_familiar, tbltipofamiliar.nombre AS tipo_familiar
   FROM tblusuario
   LEFT JOIN tblfamiliares ON tblusuario.idfamiliares = tblfamiliares.idfamiliares
   LEFT JOIN tbltipofamiliar ON tblfamiliares.idtipofamiliar = tbltipofamiliar.idtipofamiliar
   LEFT JOIN tblusuariofamiliares ON tblusuario.idusuario = tblusuariofamiliares.idusuario;
-------------------------------------------------------------------------------------------------------------------
CREATE OR REPLACE VIEW vw_fotos AS 
 SELECT tblfotosvideos.idfotosvideos, tblfotosvideos.nombre, tblfotosvideos.fechapublicacion
   FROM tblusuario
   LEFT JOIN tblalbum ON tblusuario.idusuario = tblalbum.idusuario
   LEFT JOIN tblfotosvideos ON tblalbum.idalbum = tblfotosvideos.idalbum;
-------------------------------------------------------------------------------------------------------------------
CREATE OR REPLACE VIEW vw_mensajes AS 
 SELECT tblmensajes.idmensajes, tblmensajes.mensaje, tblmensajes.asunto, tblmensajes.idusuariodestinatario, tblmensajes.idusuarioremitente
   FROM tblusuario
   LEFT JOIN tblmensajes ON tblusuario.idmensaje = tblmensajes.idmensajes;
-------------------------------------------------------------------------------------------------------------------
CREATE OR REPLACE VIEW vw_registro AS 
 SELECT tblusuario.nombreusuario, tblregistro.nombrereal, tblregistro.email, tblregistro.ciudadorigen, tblregistro.fechanacimiento, tblregistro.sexo
   FROM tblusuario
   LEFT JOIN tblregistro ON tblusuario.idregistro = tblregistro.idregistro;
-------------------------------------------------------------------------------------------------------------------
CREATE OR REPLACE VIEW vw_vernotificaciones AS 
 SELECT tblusuario.nombreusuario, tblnotificaciones.nombrenoti, tblnotificaciones.estado AS dia
   FROM tblusuario
   LEFT JOIN tblnotificaciones ON tblusuario.idnotificaciones = tblnotificaciones.idnotificaciones;
