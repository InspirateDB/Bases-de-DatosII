CREATE FUNCTION "tg_CalcularDefinitiva"() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE Definitiva double precision;
BEGIN
	

	IF (TG_OP = 'DELETE') THEN
		SELECT avg("fltCalificacion") INTO Definitiva FROM "tblNotas" WHERE "IdEstudiante"=OLD."IdEstudiante" AND "IdClase" = OLD."IdClase";
		DELETE FROM "tblDefinitivas" WHERE "IdEstudiante"=OLD."IdEstudiante" AND "IdClase"=OLD."IdClase";
		INSERT INTO "tblDefinitivas" ("IdEstudiante","IdClase","fltDefinitiva") VALUES (OLD."IdEstudiante",OLD."IdClase",definitiva);
		RETURN OLD;
	ELSE
		SELECT avg("fltCalificacion") INTO Definitiva FROM "tblNotas" WHERE "IdEstudiante"=NEW."IdEstudiante" AND "IdClase" = New."IdClase";
		DELETE FROM "tblDefinitivas" WHERE "IdEstudiante"=NEW."IdEstudiante" AND "IdClase"=NEW."IdClase";
		INSERT INTO "tblDefinitivas" ("IdEstudiante","IdClase","fltDefinitiva") VALUES (NEW."IdEstudiante",NEW."IdClase",definitiva);
		RETURN NEW;
	END IF;
END;
$$;


ALTER FUNCTION public."tg_CalcularDefinitiva"() OWNER TO postgres;



CREATE FUNCTION "tg_ModificarNota"() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    IF (TG_OP = 'DELETE') THEN

	/* INSERT INTO "tblHistoricoNotas"
	("IdEstudiante","IdClase","fltCalificacion","strDescripcion","strPeriodo","dtFechaModificacion","strAccion","strSO","strIP","IdModificador")
	VALUES
	(OLD."IdEstudiante",OLD."IdClase",OLD."fltCalificacion",OLD."strDescripcion",OLD."strPeriodo",NOW(),TG_OP,
	(SELECT so FROM tmpauditoria ORDER BY fecha DESC LIMIT 1),
	(SELECT ip FROM tmpauditoria ORDER BY fecha DESC LIMIT 1),
	(SELECT usuario FROM tmpauditoria ORDER BY fecha DESC LIMIT 1));
        RETURN OLD;*/
        RETURN NULL;
            
    ELSIF (TG_OP = 'UPDATE') THEN
        
        INSERT INTO "tblHistoricoNotas"
	("IdEstudiante","IdClase","fltCalificacion","strDescripcion","strPeriodo","dtFechaModificacion","strAccion","strSO","strIP","IdModificador")
	VALUES
	(NEW."IdEstudiante",NEW."IdClase",NEW."fltCalificacion",NEW."strDescripcion",NEW."strPeriodo",NOW(),TG_OP,
	(SELECT so FROM tmpauditoria ORDER BY fecha DESC LIMIT 1),
	(SELECT ip FROM tmpauditoria ORDER BY fecha DESC LIMIT 1),
	(SELECT usuario FROM tmpauditoria ORDER BY fecha DESC LIMIT 1));
        RETURN NEW;
            
    ELSIF (TG_OP = 'INSERT') THEN

	INSERT INTO "tblHistoricoNotas"
	("IdEstudiante","IdClase","fltCalificacion","strDescripcion","strPeriodo","dtFechaModificacion","strAccion","strSO","strIP","IdModificador")
	VALUES
	(NEW."IdEstudiante",NEW."IdClase",NEW."fltCalificacion",NEW."strDescripcion",NEW."strPeriodo",NOW(),TG_OP,
	(SELECT so FROM tmpauditoria ORDER BY fecha DESC LIMIT 1),
	(SELECT ip FROM tmpauditoria ORDER BY fecha DESC LIMIT 1),
	(SELECT usuario FROM tmpauditoria ORDER BY fecha DESC LIMIT 1));
        RETURN NEW;
        END IF;
END;
$$;


ALTER FUNCTION public."tg_ModificarNota"() OWNER TO postgres;

SET default_tablespace = '';

SET default_with_oids = false;
