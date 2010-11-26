
CREATE TABLE "Precio"
(
  "IdPrecio" integer NOT NULL,
  "Precio" integer,
  CONSTRAINT "Precio_pkey" PRIMARY KEY ("IdPrecio")
)
WITH (
  OIDS=FALSE
);
ALTER TABLE "Precio" OWNER TO postgres;


CREATE TABLE "Accesorios"
(
  "IdAccesorios" integer NOT NULL,
  "Sonido" character varying(30),
  "Vidrios" character varying(30),
  "Asientos" character varying(30),
  "IdPrecio" integer NOT NULL,
  CONSTRAINT "Accesorios_pkey" PRIMARY KEY ("IdAccesorios"),
  CONSTRAINT "Accesorios_IdPrecio_fkey" FOREIGN KEY ("IdPrecio")
      REFERENCES "Precio" ("IdPrecio") MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
)
WITH (
  OIDS=FALSE
);
ALTER TABLE "Accesorios" OWNER TO postgres;




CREATE TABLE "Datos Segundarios"
(
  "Placa" character varying(30) NOT NULL,
  "Tipo De Combustible" character varying(30),
  "CCMotor" integer,
  "Trasmision" character varying(30),
  "IdAccesorios" integer NOT NULL,
  CONSTRAINT "Datos Segundarios_pkey" PRIMARY KEY ("Placa"),
  CONSTRAINT "Datos Segundarios_IdAccesorios_fkey" FOREIGN KEY ("IdAccesorios")
      REFERENCES "Accesorios" ("IdAccesorios") MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
)
WITH (
  OIDS=FALSE
);
ALTER TABLE "Datos Segundarios" OWNER TO postgres;



CREATE TABLE "Datos Vehiculos"
(
  "IdIdentificacion" integer NOT NULL,
  "Placa" character varying(30) NOT NULL,
  "Marca" character varying(30),
  "Serie" character varying(30),
  "Modelo" integer,
  CONSTRAINT "Datos Vehiculos_pkey" PRIMARY KEY ("IdIdentificacion"),
  CONSTRAINT "Datos Vehiculos_Placa_fkey" FOREIGN KEY ("Placa")
      REFERENCES "Datos Segundarios" ("Placa") MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
)
WITH (
  OIDS=FALSE
);
ALTER TABLE "Datos Vehiculos" OWNER TO postgres;


CREATE TABLE "Documentos"
(
  "IdDocumento" integer NOT NULL,
  "Tipo De Documento" character varying(30),
  "Numero De Identificacion" integer,
  CONSTRAINT "Documentos_pkey" PRIMARY KEY ("IdDocumento")
)
WITH (
  OIDS=FALSE
);
ALTER TABLE "Documentos" OWNER TO postgres;


CREATE TABLE "Contactar"
(
  "IdTelefono" integer NOT NULL,
  "Numero Telefonico Casa" integer,
  "Numero Telefonico Celular" integer,
  "Numero Telefonico Alternativo" integer,
  CONSTRAINT "Contactar_pkey" PRIMARY KEY ("IdTelefono")
)
WITH (
  OIDS=FALSE
);
ALTER TABLE "Contactar" OWNER TO postgres;


CREATE TABLE "Datos Dueños"
(
  "IdIdentificacion" integer NOT NULL,
  "Nombre" character varying(30),
  "Apellido" character varying DEFAULT 30,
  "IdTelefono" integer NOT NULL,
  "IdDocumento" integer NOT NULL,
  CONSTRAINT "IdIdentificacion" PRIMARY KEY ("IdIdentificacion"),
  CONSTRAINT "Datos Dueños_IdDocumento_fkey" FOREIGN KEY ("IdDocumento")
      REFERENCES "Documentos" ("IdDocumento") MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT "Datos Dueños_IdIdentificacion_fkey" FOREIGN KEY ("IdIdentificacion")
      REFERENCES "Datos Vehiculos" ("IdIdentificacion") MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT "Datos Dueños_IdTelefono_fkey" FOREIGN KEY ("IdTelefono")
      REFERENCES "Contactar" ("IdTelefono") MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
)
WITH (
  OIDS=FALSE
);
ALTER TABLE "Datos Dueños" OWNER TO postgres;

