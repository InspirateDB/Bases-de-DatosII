-- Database: "Facebook"

-- DROP DATABASE "Facebook";

CREATE DATABASE "Facebook"
  WITH OWNER = postgres
       ENCODING = 'UTF8'
       LC_COLLATE = 'Spanish_Colombia.1252'
       LC_CTYPE = 'Spanish_Colombia.1252'
       CONNECTION LIMIT = -1;


CREATE TABLE tblalbum
(
  idalbum serial NOT NULL,
  fechacreacion date,
  idusuario integer,
  nombre character varying(100),
  lugar character varying(100),
  CONSTRAINT tblalbum_pkey PRIMARY KEY (idalbum)
)
-------------------------------------------------------------------------------------------------------------------
CREATE TABLE tblamigos
(
  idamigos serial NOT NULL,
  idusuario integer,
  nombreamigo character varying(100),
  CONSTRAINT tblamigos_pkey PRIMARY KEY (idamigos),
  CONSTRAINT tblamigos_idusuario_fkey FOREIGN KEY (idusuario)
      REFERENCES tblamigos (idamigos) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
)
-------------------------------------------------------------------------------------------------------------------
CREATE TABLE tblcuentas
(
  idcuentas serial NOT NULL,
  fecharegistro date,
  fechaactivacion date,
  fechadesactivacion date,
  contrasena character varying(100),
  CONSTRAINT tblcuentas_pkey PRIMARY KEY (idcuentas)
)
-------------------------------------------------------------------------------------------------------------------
CREATE TABLE tblfamiliares
(
  idfamiliares serial NOT NULL,
  idtipofamiliar integer,
  nombre character varying(100),
  fechanacimiento date,
  CONSTRAINT tblfamiliares_pkey PRIMARY KEY (idfamiliares),
  CONSTRAINT tblfamiliares_idtipofamiliar_fkey FOREIGN KEY (idtipofamiliar)
      REFERENCES tbltipofamiliar (idtipofamiliar) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
)
-------------------------------------------------------------------------------------------------------------------
CREATE TABLE tblformacionempleo
(
  idformacionempleo serial NOT NULL,
  idusuario integer,
  nombreinstituto character varying(100),
  nombreuniversidad character varying(100),
  graduacion date,
  empresa character varying(100),
  especializaciones character varying(100),
  CONSTRAINT tblformacionempleo_pkey PRIMARY KEY (idformacionempleo),
  CONSTRAINT tblformacionempleo_idusuario_fkey FOREIGN KEY (idusuario)
      REFERENCES tblusuario (idusuario) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
)
-------------------------------------------------------------------------------------------------------------------
CREATE TABLE tblfotosvideos
(
  idfotosvideos serial NOT NULL,
  nombre character varying(100),
  idalbum integer,
  fechapublicacion date,
  CONSTRAINT tblfotosvideos_pkey PRIMARY KEY (idfotosvideos),
  CONSTRAINT tblfotosvideos_idalbum_fkey FOREIGN KEY (idalbum)
      REFERENCES tblalbum (idalbum) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
)
-------------------------------------------------------------------------------------------------------------------
CREATE TABLE tblgustosintereses
(
  idgustosintereses serial NOT NULL,
  idusuario integer,
  actividades character varying(100),
  intereses character varying(100),
  musica character varying(100),
  libros character varying(100),
  peliculas character varying(100),
  television character varying(100),
  CONSTRAINT tblgustosintereses_pkey PRIMARY KEY (idgustosintereses),
  CONSTRAINT tblgustosintereses_idusuario_fkey FOREIGN KEY (idusuario)
      REFERENCES tblusuario (idusuario) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
)
-------------------------------------------------------------------------------------------------------------------
CREATE TABLE tblmensajes
(
  idmensajes serial NOT NULL,
  idusuario integer,
  idusuarioremitente integer,
  idusuariodestinatario integer,
  asunto character varying(50),
  mensaje character varying(100),
  CONSTRAINT tblmensajes_pkey PRIMARY KEY (idmensajes),
  CONSTRAINT tblmensajes_idusuario_fkey FOREIGN KEY (idusuario)
      REFERENCES tblusuario (idusuario) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
)
-------------------------------------------------------------------------------------------------------------------
CREATE TABLE tblnotificaciones
(
  idnotificaciones serial NOT NULL,
  nombrenoti character varying(100),
  idusuario integer,
  estado character varying(50),
  CONSTRAINT tblnotificaciones_pkey PRIMARY KEY (idnotificaciones),
  CONSTRAINT tblnotificaciones_idusuario_fkey FOREIGN KEY (idusuario)
      REFERENCES tblusuario (idusuario) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
)
-------------------------------------------------------------------------------------------------------------------
CREATE TABLE tblregistro
(
  idregistro serial NOT NULL,
  nombrereal character varying(100),
  email character varying(100),
  fechanacimiento date,
  sexo character varying(100),
  ciudadorigen character varying(100),
  CONSTRAINT tblregistro_pkey PRIMARY KEY (idregistro)
)
-------------------------------------------------------------------------------------------------------------------
CREATE TABLE tbltipofamiliar
(
  idtipofamiliar serial NOT NULL,
  nombre character varying(100),
  CONSTRAINT tbltipofamiliar_pkey PRIMARY KEY (idtipofamiliar)
)
-------------------------------------------------------------------------------------------------------------------
CREATE TABLE tblusuario
(
  idusuario serial NOT NULL,
  idformacionempleo integer,
  nombreusuario character varying(100),
  idregistro integer,
  idgustosintereses integer,
  preguntaseguridad character varying(50),
  creenciareligiosa character varying(50),
  ciudadactual character varying(50),
  situacionsentimental character varying(50),
  idcuentas integer,
  idfamiliares integer,
  idamigos integer,
  idnotificaciones integer,
  idmensaje integer,
  idalbum integer,
  CONSTRAINT tblusuario_pkey PRIMARY KEY (idusuario),
  CONSTRAINT tblusuario_idalbum_fkey FOREIGN KEY (idalbum)
      REFERENCES tblalbum (idalbum) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT tblusuario_idamigos_fkey FOREIGN KEY (idamigos)
      REFERENCES tblamigos (idamigos) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT tblusuario_idformacionempleo_fkey FOREIGN KEY (idformacionempleo)
      REFERENCES tblformacionempleo (idformacionempleo) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT tblusuario_idgustosintereses_fkey FOREIGN KEY (idgustosintereses)
      REFERENCES tblgustosintereses (idgustosintereses) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT tblusuario_idmensaje_fkey FOREIGN KEY (idmensaje)
      REFERENCES tblmensajes (idmensajes) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT tblusuario_idnotificaciones_fkey FOREIGN KEY (idnotificaciones)
      REFERENCES tblnotificaciones (idnotificaciones) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
)
-------------------------------------------------------------------------------------------------------------------
CREATE TABLE tblusuariofamiliares
(
  idusuario integer,
  idfamiliares integer
)
-------------------------------------------------------------------------------------------------------------------
CREATE TABLE tblusuarionotificaciones
(
  idusuario integer,
  idnotificaciones integer,
  CONSTRAINT tblusuarionotificaciones_idnotificaciones_fkey1 FOREIGN KEY (idnotificaciones)
      REFERENCES tblnotificaciones (idnotificaciones) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
)


------------------------------
