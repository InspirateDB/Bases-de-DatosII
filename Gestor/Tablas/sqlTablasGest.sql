CREATE TABLE "tblTiposDocumento"
("Id" serial,
"strAbreviatura" char(2),
"strDescripcion" varchar(20),
Primary Key("Id")
)
;

CREATE TABLE "tblDocumentos"
("Id" bigserial,
"IdTipoDocumento" int,
"bintNumero" bigint,
"IdPersona" bigint,
"blEstado" boolean,
Primary Key("Id"),
Unique("IdTipoDocumento","bintNumero")
)
;

CREATE TABLE "tblPersonas"
("Id" bigserial,
"dtFechaIngreso" date,
"dtFechaActualizacion" date,
"IdCreador" bigint,
"IdModificador" bigint,
"strPrimerNombre" varchar(30),
"strSegundoNombre" varchar(30),
"strPrimerApellido" varchar(30),
"strSegundoApellido" varchar(30),
"blSexo" char(2),
"dtFechaNacimiento" date,
"strLugarNacimiento" varchar(40),
"strDireccionAlt" varchar(30),
"strBarrioAlt" varchar(30),
"strCiudadAlt" varchar(30),
"strDepartamentoAlt" varchar(30),
"strTelefono" varchar(30),
"strTelefonoTrabajo" varchar(30),
"strTelefonoAlt" varchar(30),
"blEstado" boolean,
Primary Key ("Id")
)
;

CREATE TABLE "tblEmails"
(
"strEmail" varchar(60),
"IdPersona" bigint,
"blEstado" boolean,
Primary Key("strEmail","IdPersona")
)
;

CREATE TABLE "tblDirecciones"
("Id" bigserial,
"IdReferido" bigint,
"strDireccion" varchar(30),
"strBarrio" varchar(30),
"strCiudad" varchar(30),
"strDepartamento" varchar(30),
"blEstado" boolean,
Primary Key("Id")
)
;

CREATE TABLE "tblTelefonos"
("Id" bigserial,
"IdPersona" bigint,
"IdTipoTelefono" int,
"intIdicativo" int,
"bintNumero" bigint,
"intExtension" int,
"blEstado" boolean,
Primary Key("Id")
)
;

CREATE TABLE "tblEstudiantes"
( "IdPersona" bigint,
  "intGrado" integer,
  "strGrupo" varchar(10),
  "dtFechaIngreso" date,
  "dtFechaRetiro" date,
  "strMotivoRetiro" varchar(200),
  Unique("IdPersona")
)
;

CREATE TABLE "tblCategorias"
( "Id" Integer not null,
  "strDescripcion" varchar(30),
  Primary Key("Id")
)
;

CREATE TABLE "tblCuestionario"
( "Id" Integer not null,
  "strPregunta" varchar(80),
  "IdCategoria" Integer,
  Primary Key("Id")
)
;

CREATE TABLE "tblEvaluacion"
( "IdCuestionario" Integer not null,
  "IdProfesor" BigInt not null,
  "strCalificacion" varchar(20),
  Primary Key("IdCuestionario","IdProfesor")
)
;

CREATE TABLE "tblPerfiles"
( "IdProfesor" Integer not null,
  "strInstitucion" varchar(50),
  "strTiempoLaborado" varchar(30)
)
;

CREATE TABLE "tblInfoAcademica"
( "IdProfesor" Integer not null,
  "strFormacion" varchar(50),
  "strInstitucion" varchar(50),
  "intAño" integer
)
;

CREATE TABLE "tblProfesores"
( "IdPersona" bigint,
  "strTituloProfesional" varchar(80),
  "dtFechaIngreso" date,
  "dtFechaRetiro" date,
  "IdEstado" Integer,
  Unique("IdPersona")
)
;

CREATE TABLE "tblResponsablesEstudiantes"
( "IdPersonaResponsable" bigint,
  "IdEstudiante" bigint,
  "blConviven" boolean,
  "strParentezco" varchar(30),
  "blAutorizacionRetiro" boolean,
  Primary Key("IdPersonaResponsable","IdEstudiante")
)
;

CREATE TABLE "tblEstado"
( "Id" serial,
  "strDescripcion" varchar(30) 
)
;

CREATE TABLE "tblClase"
( "Id" serial,
  "IdProfesor" bigint,
  "IdMateria" int,
  "IdSalon" int,
  "strGrupo" varchar(10),
  "intGrado" integer,
  "intAño" integer,
  Primary Key("Id")
)
;

CREATE TABLE "tblMaterias"
(
"Id" serial,
"strNombre" varchar(20),
Primary Key ("Id")
)
;

CREATE TABLE "tblBloques"
( "Id" serial,
  "strUbicacion" varchar(30),
  Primary Key("Id")
)
;

CREATE TABLE "tblSalon"
(
"Id" serial,
"IdBloque" integer,
"intPiso" integer,
"intNumero" integer,
Primary Key ("Id")
)
;

CREATE TABLE "tblHorario" 
(
"IdClase" integer,
"strDia" varchar(20),
"tmHora" time,
Primary Key ("IdClase","strDia","tmHora")
)
;

CREATE TABLE "tblNotas" 
("IdEstudiante" bigint,
"IdClase" integer,
"fltCalificacion" float,
"strDescripcion" varchar(100),
"strPeriodo" varchar(20),
Primary Key ("IdEstudiante","IdClase")
)
;

CREATE TABLE "tblClasesEstudiantes"
(
"IdEstudiante" bigint,
"IdClase" integer,
"IdEstado" int
)
;