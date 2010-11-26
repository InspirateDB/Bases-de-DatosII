==== /\ CREAR LA BASE DE DATOS /\ ==

-- Database: "dbParqueadero"

-- DROP DATABASE "dbParqueadero";

CREATE DATABASE "dbParqueadero"
  WITH OWNER = postgres
       ENCODING = 'UTF8'
       TABLESPACE = pg_default
       LC_COLLATE = 'Spanish_Colombia.1252'
       LC_CTYPE = 'Spanish_Colombia.1252'
       CONNECTION LIMIT = -1;


/\ STORED PROCEDURES /\

-- Function: sp_actualizarcliente(integer, character varying, character varying, character varying, integer, integer)

-- DROP FUNCTION sp_actualizarcliente(integer, character varying, character varying, character varying, integer, integer);

CREATE OR REPLACE FUNCTION sp_actualizarcliente(codigoant integer, documentoidentidad character varying, nombre character varying, direccion character varying, celular integer, telefonocasa integer)
  RETURNS boolean AS
$BODY$
BEGIN
SELECT intcodigo FROM tblclientes WHERE strdocumentoidentidad = documentoidentidad;
UPDATE tblclientes set strdocumentoidentidad = documentoidentidad, strnombre = nombre, strdireccion = direccion, intcelular = celular, inttelefonocasa = telefonocasa where intcodigo = codigoant;
RETURN TRUE;
END;
$BODY$
  LANGUAGE 'plpgsql' VOLATILE
  COST 100;
ALTER FUNCTION sp_actualizarcliente(integer, character varying, character varying, character varying, integer, integer) OWNER TO postgres;




-- Function: sp_add_cliente(character varying, character varying, character varying, integer, integer)

-- DROP FUNCTION sp_add_cliente(character varying, character varying, character varying, integer, integer);

CREATE OR REPLACE FUNCTION sp_add_cliente(documentoidentidad character varying, nombre character varying, direccion character varying, celular integer, telefonocasa integer)
  RETURNS boolean AS
$BODY$ 
BEGIN

INSERT INTO tblclientes(
strdocumentoidentidad, strnombre, strdireccion, intcelular, inttelefonocasa)
VALUES (documentoidentidad, nombre, direccion, celular, telefonocasa);
RETURN TRUE;
END ;
$BODY$
  LANGUAGE 'plpgsql' VOLATILE
  COST 100;
ALTER FUNCTION sp_add_cliente(character varying, character varying, character varying, integer, integer) OWNER TO postgres;




-- Function: sp_add_factura(character varying, character varying, integer)

-- DROP FUNCTION sp_add_factura(character varying, character varying, integer);

CREATE OR REPLACE FUNCTION sp_add_factura(documentoidentidadcliente character varying, placavehiculo character varying, valor integer)
  RETURNS boolean AS
$BODY$ 
BEGIN

INSERT INTO tblfacturas(
strdocumentoidentidadcliente, strplacavehiculo, intvalor)
VALUES (documentoidentidad, placavehiculo, valor);
RETURN TRUE;
END ;
$BODY$
  LANGUAGE 'plpgsql' VOLATILE
  COST 100;
ALTER FUNCTION sp_add_factura(character varying, character varying, integer) OWNER TO postgres;




-- Function: sp_add_servicio(character varying, character varying)

-- DROP FUNCTION sp_add_servicio(character varying, character varying);

CREATE OR REPLACE FUNCTION sp_add_servicio(nombre character varying, descripcion character varying)
  RETURNS boolean AS
$BODY$ 
BEGIN

INSERT INTO tblservicios(strnombre, strdescripcion)
VALUES (nombre, descripcion);
RETURN TRUE;
END ;
$BODY$
  LANGUAGE 'plpgsql' VOLATILE
  COST 100;
ALTER FUNCTION sp_add_servicio(character varying, character varying) OWNER TO postgres;




-- Function: sp_add_servicio_suscrito(character varying, date, date)

-- DROP FUNCTION sp_add_servicio_suscrito(character varying, date, date);

CREATE OR REPLACE FUNCTION sp_add_servicio_suscrito(documentoidentidadcliente character varying, fechainicio date, fechasalida date)
  RETURNS boolean AS
$BODY$ 
BEGIN

INSERT INTO tblserviciossuscritos(
"strDocumentoIdentidadCliente", "dtFechaInicio", "dtFechaSalida")
VALUES (documentoidentidadcliente, fechainicio, fechasalida);
RETURN TRUE;
END ;
$BODY$
  LANGUAGE 'plpgsql' VOLATILE
  COST 100;
ALTER FUNCTION sp_add_servicio_suscrito(character varying, date, date) OWNER TO postgres;




-- Function: sp_add_vehiculo(character varying, integer, integer, character varying)

-- DROP FUNCTION sp_add_vehiculo(character varying, integer, integer, character varying);

CREATE OR REPLACE FUNCTION sp_add_vehiculo(placa character varying, tipovehiculo integer, codigocliente integer, documentoidentidadcliente character varying)
  RETURNS boolean AS
$BODY$ 
BEGIN

INSERT INTO tblvehiculos(
strplaca, inttipovehiculo, intcodigocliente, strdocumentoidentidadcliente)
VALUES (placa, tipovehiculo, codigocliente, documentoidentidadcliente);
RETURN TRUE;
END ;
$BODY$
  LANGUAGE 'plpgsql' VOLATILE
  COST 100;
ALTER FUNCTION sp_add_vehiculo(character varying, integer, integer, character varying) OWNER TO postgres;





-- Function: sp_clientes_vehiculos(character varying, character varying)

-- DROP FUNCTION sp_clientes_vehiculos(character varying, character varying);

CREATE OR REPLACE FUNCTION sp_clientes_vehiculos(documentoidentidadcliente character varying, palacavehiculo character varying)
  RETURNS boolean AS
$BODY$ 
BEGIN

INSERT INTO tblclientesvehiculos(
strdocumentoidentidadcliente, strplacavehiculo)
VALUES (documentoidentidadcliente, placavehiculo);
RETURN TRUE;
END ;
$BODY$
  LANGUAGE 'plpgsql' VOLATILE
  COST 100;
ALTER FUNCTION sp_clientes_vehiculos(character varying, character varying) OWNER TO postgres;





-- Function: sp_up_clientesvehiculos(integer, character varying, character varying)

-- DROP FUNCTION sp_up_clientesvehiculos(integer, character varying, character varying);

CREATE OR REPLACE FUNCTION sp_up_clientesvehiculos(codigoclienteant integer, documentoidentidadcliente character varying, placavehiculo character varying)
  RETURNS boolean AS
$BODY$
BEGIN
SELECT intcodigo FROM tblclientes WHERE strdocumentoidentidad = documentoidentidadcliente;
UPDATE tblclientesvehiculos set strdocumentoidentidadcliente = documentoidentida, strplacavehiculo = placavehiculo where intcodigo = codigoclienteant;
RETURN TRUE;
END;
$BODY$
  LANGUAGE 'plpgsql' VOLATILE
  COST 100;
ALTER FUNCTION sp_up_clientesvehiculos(integer, character varying, character varying) OWNER TO postgres;





-- Function: sp_up_factura(integer, character varying, character varying, integer)

-- DROP FUNCTION sp_up_factura(integer, character varying, character varying, integer);

CREATE OR REPLACE FUNCTION sp_up_factura(codigoant integer, documentoidentidadcliente character varying, placavehiculo character varying, valor integer)
  RETURNS boolean AS
$BODY$
BEGIN
SELECT intcodigo FROM tblfacturas WHERE strdocumentoidentidadcliente = documentoidentidadcliente;
UPDATE tblfacturas set strdocumentoidentidadcliente = documentoidentidad, strplacavehiculo = placavehiculo, intvalor = valor where intcodigo = codigoant;
RETURN TRUE;
END;
$BODY$
  LANGUAGE 'plpgsql' VOLATILE
  COST 100;
ALTER FUNCTION sp_up_factura(integer, character varying, character varying, integer) OWNER TO postgres;





-- Function: sp_up_servicio(integer, character varying, character varying)

-- DROP FUNCTION sp_up_servicio(integer, character varying, character varying);

CREATE OR REPLACE FUNCTION sp_up_servicio(codigoant integer, nombreservicio character varying, descripcion character varying)
  RETURNS boolean AS
$BODY$
BEGIN
SELECT intcodigo FROM tblservicios WHERE strnombreservicio = nombreservicio;
UPDATE tblservicios set strnombre = nombreservicio, strdescripcion = descripcion where "intCodigo" = codigoant;
RETURN TRUE;
END;
$BODY$
  LANGUAGE 'plpgsql' VOLATILE
  COST 100;
ALTER FUNCTION sp_up_servicio(integer, character varying, character varying) OWNER TO postgres;




-- Function: sp_up_serviciosuscrito(integer, integer, character varying, date, date)

-- DROP FUNCTION sp_up_serviciosuscrito(integer, integer, character varying, date, date);

CREATE OR REPLACE FUNCTION sp_up_serviciosuscrito(codigocliente integer, codigoservicio integer, documentoidentidadcliente character varying, fechainicio date, fechasalida date)
  RETURNS boolean AS
$BODY$
BEGIN
SELECT intcodigo FROM tblclientes WHERE tblclientes.strdocumentoidentidad = documentoidentidadcliente;
UPDATE tblserviciossuscritos SET "strDocumentoCliente" = documentoidentidadcliente, "dtFechaInicio" = fechainicio, "dtFechaSalida" = fechasalida WHERE "intCodCliente" = codigocliente AND "intCodServicio" = codigoservicio;
RETURN TRUE;
END;
$BODY$
  LANGUAGE 'plpgsql' VOLATILE
  COST 100;
ALTER FUNCTION sp_up_serviciosuscrito(integer, integer, character varying, date, date) OWNER TO postgres;




-- Function: sp_up_tipovehiculo(integer, character varying)

-- DROP FUNCTION sp_up_tipovehiculo(integer, character varying);

CREATE OR REPLACE FUNCTION sp_up_tipovehiculo(codigo integer, nombre character varying)
  RETURNS boolean AS
$BODY$
BEGIN
SELECT intcodigo FROM tbltipovehiculo WHERE tbltipovehiculo.nombre = nombre;
UPDATE tbltipovehiculo SET strnombre = nombre WHERE intcodigo = codigo;
RETURN TRUE;
END;
$BODY$
  LANGUAGE 'plpgsql' VOLATILE
  COST 100;
ALTER FUNCTION sp_up_tipovehiculo(integer, character varying) OWNER TO postgres;




-- Function: sp_up_vehiculo(character varying, character varying)

-- DROP FUNCTION sp_up_vehiculo(character varying, character varying);

CREATE OR REPLACE FUNCTION sp_up_vehiculo(placa character varying, documentoidentidadcliente character varying)
  RETURNS boolean AS
$BODY$
BEGIN
UPDATE tblvehiculos SET strplaca = placa, strdocumentoidentidadcliente = documentoidentidadcliente WHERE strplaca = placa;
RETURN TRUE;
END;
$BODY$
  LANGUAGE 'plpgsql' VOLATILE
  COST 100;
ALTER FUNCTION sp_up_vehiculo(character varying, character varying) OWNER TO postgres;

/\ /\

