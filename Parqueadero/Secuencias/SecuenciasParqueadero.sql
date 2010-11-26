-- == SECUENCIAS == --

-- Sequence: "tblClientes_intCodigo_seq"

-- DROP SEQUENCE "tblClientes_intCodigo_seq";

CREATE SEQUENCE "tblClientes_intCodigo_seq"
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 1
  CACHE 1;
ALTER TABLE "tblClientes_intCodigo_seq" OWNER TO postgres;



-- Sequence: "tblFacturas_intCodigo_seq"

-- DROP SEQUENCE "tblFacturas_intCodigo_seq";

CREATE SEQUENCE "tblFacturas_intCodigo_seq"
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 1
  CACHE 1;
ALTER TABLE "tblFacturas_intCodigo_seq" OWNER TO postgres;




-- Sequence: "tblServicios_intCodigo_seq"

-- DROP SEQUENCE "tblServicios_intCodigo_seq";

CREATE SEQUENCE "tblServicios_intCodigo_seq"
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 1
  CACHE 1;
ALTER TABLE "tblServicios_intCodigo_seq" OWNER TO postgres;




-- Sequence: "tblTipoVehiculo_intCodigo_seq"

-- DROP SEQUENCE "tblTipoVehiculo_intCodigo_seq";

CREATE SEQUENCE "tblTipoVehiculo_intCodigo_seq"
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 1
  CACHE 1;
ALTER TABLE "tblTipoVehiculo_intCodigo_seq" OWNER TO postgres;
