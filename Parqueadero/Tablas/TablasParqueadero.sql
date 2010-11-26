-- == TABLAS == --

-- Table: tblauclientes

-- DROP TABLE tblauclientes;

CREATE TABLE tblauclientes
(
  intnewcodigo bigint NOT NULL DEFAULT nextval('"tblClientes_intCodigo_seq"'::regclass),
  strnewdocumentoidentidad character varying(20) NOT NULL,
  strnewnombre character varying(100) NOT NULL,
  strnewdireccion character varying(50) NOT NULL,
  intnewcelular integer NOT NULL,
  intnewtelefonocasa integer NOT NULL,
  CONSTRAINT "tblauClientes_pkey" PRIMARY KEY (intnewcodigo)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE tblauclientes OWNER TO postgres;



-- Table: tblauvehiculos

-- DROP TABLE tblauvehiculos;

CREATE TABLE tblauvehiculos
(
  strnewplaca character varying(10) NOT NULL,
  intnewtipovehiculo bigint NOT NULL,
  intnewcodigocliente bigint NOT NULL,
  CONSTRAINT tblauvehiculos_pkey PRIMARY KEY (strnewplaca),
  CONSTRAINT "tblauvehiculos_intCodigoCliente_fkey" FOREIGN KEY (intnewcodigocliente)
      REFERENCES tblclientes (intcodigo) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT "tblauvehiculos_intTipoVehiculo_fkey" FOREIGN KEY (intnewtipovehiculo)
      REFERENCES tbltipovehiculo (intcodigo) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
)
WITH (
  OIDS=FALSE
);
ALTER TABLE tblauvehiculos OWNER TO postgres;



-- Table: tblclientes

-- DROP TABLE tblclientes;

CREATE TABLE tblclientes
(
  intcodigo bigint NOT NULL DEFAULT nextval('"tblClientes_intCodigo_seq"'::regclass),
  strdocumentoidentidad character varying(20) NOT NULL,
  strnombre character varying(100) NOT NULL,
  strdireccion character varying(50) NOT NULL,
  intcelular integer NOT NULL,
  inttelefonocasa integer NOT NULL,
  CONSTRAINT "tblClientes_pkey" PRIMARY KEY (intcodigo)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE tblclientes OWNER TO postgres;

-- Trigger: upd_cliente on tblclientes

-- DROP TRIGGER upd_cliente ON tblclientes;

CREATE TRIGGER upd_cliente
  AFTER UPDATE
  ON tblclientes
  FOR EACH ROW
  EXECUTE PROCEDURE cliente_upd_tri();




-- Table: tblclientesvehiculos

-- DROP TABLE tblclientesvehiculos;

CREATE TABLE tblclientesvehiculos
(
  intcodigocliente bigint NOT NULL DEFAULT nextval('"tblClientes_intCodigo_seq"'::regclass),
  strplacavehiculo character varying(10) NOT NULL,
  CONSTRAINT "tblClientesVehiculos_strplacavehiculo_fkey" FOREIGN KEY (strplacavehiculo)
      REFERENCES tblvehiculos (strplaca) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT tblclientesvehiculos_intcodigocliente_fkey FOREIGN KEY (intcodigocliente)
      REFERENCES tblclientes (intcodigo) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
)
WITH (
  OIDS=FALSE
);
ALTER TABLE tblclientesvehiculos OWNER TO postgres;




-- Table: tblfacturas

-- DROP TABLE tblfacturas;

CREATE TABLE tblfacturas
(
  intcodigo bigint NOT NULL DEFAULT nextval('"tblFacturas_intCodigo_seq"'::regclass),
  strdocumentoidentidadcliente character varying(20) NOT NULL,
  strplacavehiculo character varying(20) NOT NULL,
  intvalor bigint NOT NULL,
  CONSTRAINT "tblFacturas_pkey" PRIMARY KEY (intcodigo),
  CONSTRAINT tblfacturas_strplacavehiculo_fkey FOREIGN KEY (strplacavehiculo)
      REFERENCES tblvehiculos (strplaca) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
)
WITH (
  OIDS=FALSE
);
ALTER TABLE tblfacturas OWNER TO postgres;



-- Table: tblfacturasservicios

-- DROP TABLE tblfacturasservicios;

CREATE TABLE tblfacturasservicios
(
  "intCodigoFactura" bigint,
  "intCodigoServicio" bigint,
  CONSTRAINT "tblfacturasservicios_intCodigoFactura_fkey" FOREIGN KEY ("intCodigoFactura")
      REFERENCES tblfacturas (intcodigo) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT "tblfacturasservicios_intCodigoServicio_fkey" FOREIGN KEY ("intCodigoServicio")
      REFERENCES tblservicios ("intCodigo") MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
)
WITH (
  OIDS=FALSE
);
ALTER TABLE tblfacturasservicios OWNER TO postgres;



-- Table: tblservicios

-- DROP TABLE tblservicios;

CREATE TABLE tblservicios
(
  "intCodigo" bigint NOT NULL DEFAULT nextval('"tblServicios_intCodigo_seq"'::regclass),
  strnombre character varying(50) NOT NULL,
  strdescripcion character varying(100) NOT NULL,
  CONSTRAINT "tblServicios_pkey" PRIMARY KEY ("intCodigo")
)
WITH (
  OIDS=FALSE
);
ALTER TABLE tblservicios OWNER TO postgres;



-- Table: tblserviciosportipovehiculo

-- DROP TABLE tblserviciosportipovehiculo;

CREATE TABLE tblserviciosportipovehiculo
(
  strcodigoservicio character varying(10) DEFAULT NULL::character varying,
  strcodigoserviciotipovehiculo character varying(10) DEFAULT NULL::character varying,
  strprecioservicio character varying(20) DEFAULT NULL::character varying
)
WITH (
  OIDS=FALSE
);
ALTER TABLE tblserviciosportipovehiculo OWNER TO postgres;



-- Table: tblserviciossuscritos

-- DROP TABLE tblserviciossuscritos;

CREATE TABLE tblserviciossuscritos
(
  "intCodCliente" bigint NOT NULL,
  "intCodServicio" bigint NOT NULL,
  "strDocumentoCliente" character varying(20) NOT NULL,
  "dtFechaInicio" date NOT NULL,
  "dtFechaSalida" date NOT NULL,
  CONSTRAINT "tblserviciossuscritos_intCodCliente_fkey" FOREIGN KEY ("intCodCliente")
      REFERENCES tblclientes (intcodigo) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT "tblserviciossuscritos_intCodServicio_fkey" FOREIGN KEY ("intCodServicio")
      REFERENCES tblservicios ("intCodigo") MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
)
WITH (
  OIDS=FALSE
);
ALTER TABLE tblserviciossuscritos OWNER TO postgres;



-- Table: tbltipovehiculo

-- DROP TABLE tbltipovehiculo;

CREATE TABLE tbltipovehiculo
(
  intcodigo bigint NOT NULL DEFAULT nextval('"tblTipoVehiculo_intCodigo_seq"'::regclass),
  strnombre character varying(50) NOT NULL,
  CONSTRAINT "tblTipoVehiculo_pkey" PRIMARY KEY (intcodigo)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE tbltipovehiculo OWNER TO postgres;



-- Table: tblvehiculos

-- DROP TABLE tblvehiculos;

CREATE TABLE tblvehiculos
(
  strplaca character varying(10) NOT NULL,
  inttipovehiculo bigint NOT NULL,
  intcodigocliente bigint NOT NULL,
  CONSTRAINT tblvehiculos_pkey PRIMARY KEY (strplaca),
  CONSTRAINT "tblvehiculos_intCodigoCliente_fkey" FOREIGN KEY (intcodigocliente)
      REFERENCES tblclientes (intcodigo) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT "tblvehiculos_intTipoVehiculo_fkey" FOREIGN KEY (inttipovehiculo)
      REFERENCES tbltipovehiculo (intcodigo) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
)
WITH (
  OIDS=FALSE
);
ALTER TABLE tblvehiculos OWNER TO postgres;

-- Trigger: upd_vehiculo on tblvehiculos

-- DROP TRIGGER upd_vehiculo ON tblvehiculos;

CREATE TRIGGER upd_vehiculo
  AFTER UPDATE
  ON tblvehiculos
  FOR EACH ROW
  EXECUTE PROCEDURE upd_vehiculo();

