CREATE OR REPLACE FUNCTION sp_actualizar_album(nombreusuario character varying, pnombre character varying, plugar character varying)
  RETURNS boolean AS
$BODY$
DECLARE actualizar integer;
BEGIN 
select nombreusuario into actualizar from tblalbum where nombreusuario;
	UPDATE tblalbum SET nombre=pnombre, lugar=plugar WHERE tblusuario.nombreusuario=actualizar;
	RETURN TRUE;
END;
$BODY$
  LANGUAGE 'plpgsql' VOLATILE
  COST 100;
-------------------------------------------------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION sp_actualizar_mensajes(nombreusuario character varying, pasunto character varying, pmensaje character varying)
  RETURNS boolean AS
$BODY$
DECLARE actualizar integer;
BEGIN
select nombreusuario into actualizar from tblgustosintereses where nombreusuario;

UPDATE tblmensajes
   SET asunto=pasunto, mensaje=pmensaje
 WHERE   tblusuario.nombreusuario=actualizar;
 RETURN true;
 END;
$BODY$
  LANGUAGE 'plpgsql' VOLATILE
  COST 100;
-------------------------------------------------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION sp_actualizar_usuario(pnombreusuario character varying, ppreguntaseguridad character varying, pcreenciareligiosa character varying, pciudadactual character varying, psituacionsentimental character varying)
  RETURNS boolean AS
$BODY$
DECLARE actualizar integer;
BEGIN
	UPDATE tblusuario
        SET nombreusuario=pnombreusuario,preguntaseguridad=ppreguntaseguridad, creenciareligiosa=pcreenciareligiosa, ciudadactual=pciudadactual, situacionsentimental=psituacionsentimental  
	WHERE tblusuario.nombreusuario=actualizar;
	RETURN TRUE;
END;
$BODY$
  LANGUAGE 'plpgsql' VOLATILE
  COST 100;
-------------------------------------------------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION sp_actualizarfotos_videos(pidfovi integer, pidalbun character varying, pnombre character varying, pfechapublicacion character varying)
  RETURNS boolean AS
$BODY$
DECLARE actualizar integer;
BEGIN
select nombreusuario into actualizar from tblfotosvideos where nombreusuario;

	UPDATE tblfotosvideos
        SET nombre=pnombre, fechapublicacion=pfechapublicacion
        WHERE tblusuario.nombreusuario=actualizar;
	RETURN true;
END;
$BODY$
  LANGUAGE 'plpgsql' VOLATILE
  COST 100;
-------------------------------------------------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION sp_actualizargustos_intereses(nombreusuario character varying, pidusuario integer, pactividades character varying, pintereses character varying, pmusica character varying, plibros character varying, ppeliculas character varying)
  RETURNS boolean AS
$BODY$
DECLARE actualizar integer;
BEGIN
select nombreusuario into actualizar from tblgustosintereses where nombreusuario;

	UPDATE tblgustosintereses
        SET  actividades=pactividades, intereses=pintereses, 
        musica=pmusica, libros=plibros, peliculas=ppeliculas, television=ptelevison
        WHERE tblusuario.nombreusuario=actualizar;
	RETURN true;
END;
$BODY$
  LANGUAGE 'plpgsql' VOLATILE
  COST 100;
-------------------------------------------------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION sp_fotosvideos(pidfovi integer, pidalbun character varying, pnombre character varying, pfechapublicacion character varying)
  RETURNS integer AS
$BODY$
BEGIN

INSERT INTO tblfotosvideos(
            idfotosvideos, nombre, idalbum, fechapublicacion)
    VALUES (pidfovi, pidalbum, pnombre, pfechapublicacion);
	
            RETURN currval('tblfotosvideos_idfotosvideos_seq ');
END;
$BODY$
  LANGUAGE 'plpgsql' VOLATILE
  COST 100;
-------------------------------------------------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION sp_insertaralbum(pidu integer, pnombre character varying, plugar character varying)
  RETURNS integer AS
$BODY$
BEGIN
	INSERT INTO tblalbum(fechacreacion,idusuario, nombre, lugar)
		VALUES (current_date,pidu, pnombre, plugar);
	RETURN currval('tblalbum_idalbum_seq');
END;
$BODY$
  LANGUAGE 'plpgsql' VOLATILE
  COST 100;
-------------------------------------------------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION sp_insertaramigo(pida integer, pidusuario integer, pnombreamigo character varying)
  RETURNS integer AS
$BODY$
BEGIN
	INSERT INTO tblamigos(
            idamigos, idusuario, nombreamigo)
    VALUES (pida,pidusuario ,pnombreamigo );

	RETURN currval('tblamigos_idamigos_seq');
END;
$BODY$
  LANGUAGE 'plpgsql' VOLATILE
  COST 100;
-------------------------------------------------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION sp_insertausuario(pnombreusuario character varying, ppreguntaseguridad character varying, pcreenciareligiosa character varying, pciudadactual character varying, psituacionsentimental character varying)
  RETURNS integer AS
$BODY$
BEGIN
	INSERT INTO tblusuario(
            nombreusuario,preguntaseguridad, creenciareligiosa, ciudadactual, situacionsentimental)
        VALUES ( pnombreusuario,ppreguntaseguridad, pcreenciareligiosa, pciudadactual, psituacionsentimental);
            RETURN currval('tblusuario_idusuario_seq');
END;
$BODY$
  LANGUAGE 'plpgsql' VOLATILE
  COST 100;
-------------------------------------------------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION sp_insetargustosintereses(pidgusto integer, pidusuario integer, pactividades character varying, pintereses character varying, pmusica character varying, plibros character varying, ppeliculas character varying, ptelevision character varying)
  RETURNS integer AS
$BODY$
BEGIN
INSERT INTO tblgustosintereses(
            idgustosintereses, idusuario, actividades, intereses, musica, 
            libros, peliculas, television)
    VALUES (pidgusto,pidusuario,pactividades,pintereses, pmusica, plibros, 
            ppeliculas, ptelevision );	
            RETURN currval('tblgustosintereses_idgustosintereses_seq');
END;
$BODY$
  LANGUAGE 'plpgsql' VOLATILE
  COST 100;
-------------------------------------------------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION sp_insetarmensajes(pidmen integer, pidusuario integer, pidusuarioremitente integer, pidusuariodestinatario integer, pasunto character varying, pmensaje character varying)
  RETURNS integer AS
$BODY$
BEGIN

INSERT INTO tblmensajes(
            idmensajes, idusuario, idusuarioremitente, idusuariodestinatario, 
            asunto, mensaje)
    VALUES (pidmen, pidusuario, pidusuarioremitente,pidusuariodestinatario, pasunto, 
            pmensaje);	
            RETURN currval('tblmensajes_idmensajes_seq');
END;
$BODY$
  LANGUAGE 'plpgsql' VOLATILE
  COST 100;

