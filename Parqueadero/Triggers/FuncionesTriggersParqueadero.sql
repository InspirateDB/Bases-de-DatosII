jjhnv-- == FUNCIONES DE TRIGGERS == --


-- Function: cliente_upd_tri()

-- DROP FUNCTION cliente_upd_tri();

CREATE OR REPLACE FUNCTION cliente_upd_tri()
  RETURNS trigger AS
$BODY$
BEGIN
IF TG_OP ='UPDATE' THEN
INSERT INTO tblcaulientes(
strnewdocumentoidentidad, strnewnombre, strnewdireccion, intnewcelular, intnewtelefonocasa)
VALUES (documentoidentidad, nombre, direccion, celular, telefonocasa);END IF;
RETURN NULL;
END;
$BODY$
  LANGUAGE 'plpgsql' VOLATILE
  COST 100;
ALTER FUNCTION cliente_upd_tri() OWNER TO postgres;





-- Function: upd_vehiculo()

-- DROP FUNCTION upd_vehiculo();

CREATE OR REPLACE FUNCTION upd_vehiculo()
  RETURNS trigger AS
$BODY$
BEGIN
IF TG_OP ='UPDATE' THEN
INSERT INTO tblauvehiculos(
strnewplaca, intnewtipovehiculo, intnewcodigocliente)
VALUES (placa, tipovehiculo, codigocliente);
END IF;
RETURN NULL;
END;
$BODY$
  LANGUAGE 'plpgsql' VOLATILE
  COST 100;
ALTER FUNCTION upd_vehiculo() OWNER TO postgres;
