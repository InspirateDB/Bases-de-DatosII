-- == VISTAS == --

-- View: clientes_vehiculos

-- DROP VIEW clientes_vehiculos;

CREATE OR REPLACE VIEW clientes_vehiculos AS 
 SELECT tblclientes.intcodigo, tblclientes.strdocumentoidentidad, tblclientes.strnombre, tblclientes.strdireccion, tblclientes.intcelular, tblclientes.inttelefonocasa, tblvehiculos.strplaca, tblvehiculos.inttipovehiculo, tblvehiculos.intcodigocliente
   FROM tblclientes
   JOIN tblvehiculos ON tblclientes.intcodigo = tblvehiculos.intcodigocliente;

ALTER TABLE clientes_vehiculos OWNER TO postgres;



-- View: vwclientes

-- DROP VIEW vwclientes;

CREATE OR REPLACE VIEW vwclientes AS 
 SELECT tblclientes.intcodigo, tblclientes.strdocumentoidentidad, tblclientes.strnombre, tblclientes.strdireccion, tblclientes.intcelular, tblclientes.inttelefonocasa
   FROM tblclientes;

ALTER TABLE vwclientes OWNER TO postgres;




-- View: vwfacturas

-- DROP VIEW vwfacturas;

CREATE OR REPLACE VIEW vwfacturas AS 
 SELECT tblfacturas.intcodigo AS "intCodigo", tblfacturas.strdocumentoidentidadcliente, tblfacturas.strplacavehiculo, tblfacturas.intvalor
   FROM tblfacturas;

ALTER TABLE vwfacturas OWNER TO postgres;





-- View: vwservicios

-- DROP VIEW vwservicios;

CREATE OR REPLACE VIEW vwservicios AS 
 SELECT tblservicios."intCodigo", tblservicios.strnombre, tblservicios.strdescripcion
   FROM tblservicios;

ALTER TABLE vwservicios OWNER TO postgres;




-- View: vwvehiculos

-- DROP VIEW vwvehiculos;

CREATE OR REPLACE VIEW vwvehiculos AS 
 SELECT tblvehiculos.strplaca, tblvehiculos.inttipovehiculo, tblvehiculos.intcodigocliente
   FROM tblvehiculos;

ALTER TABLE vwvehiculos OWNER TO postgres;

