-- Schema: "public"

-- DROP SCHEMA public;

CREATE SCHEMA public
  AUTHORIZATION postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO public;
COMMENT ON SCHEMA public IS 'standard public schema';


CREATE FUNCTION "sp_ActualizarNota"(idestudiante integer, idclase integer, periodo character varying, nota double precision, descripcion character varying) RETURNS integer
    LANGUAGE plpgsql
    AS $$ 
BEGIN
	UPDATE "tblNotas" SET "fltCalificacion"=nota, "strDescripcion"= descripcion
	WHERE "IdEstudiante"=idestudiante AND "IdClase"=idclase AND "strPeriodo"=periodo;
	RETURN 1;
END;
$$;


ALTER FUNCTION public."sp_ActualizarNota"(idestudiante integer, idclase integer, periodo character varying, nota double precision, descripcion character varying) OWNER TO postgres;




CREATE FUNCTION "sp_IngresarNota"(idestudiante integer, idclase integer, periodo character varying, nota double precision, descripcion character varying) RETURNS integer
    LANGUAGE plpgsql
    AS $$ 
BEGIN
	INSERT INTO "tblNotas" ("IdEstudiante","IdClase","strPeriodo","fltCalificacion","strDescripcion") VALUES (idestudiante,idclase,periodo,nota,descripcion);
	RETURN 1;
END;
$$;


ALTER FUNCTION public."sp_IngresarNota"(idestudiante integer, idclase integer, periodo character varying, nota double precision, descripcion character varying) OWNER TO postgres;

