CREATE VIEW "vwSalones"
AS
(
  Select "tblSalon"."Id","tblBloques"."strUbicacion" As "Ubicacion","tblSalon"."intPiso" As "Piso","tblSalon"."intNumero" As "Numero"
  From "tblSalon"
  Left Join "tblBloques"
    On "tblSalon"."IdBloque" = "tblBloques"."Id"
)
;
CREATE VIEW "vwClases"
AS
(
  Select "tblClase"."Id" As "IdClase","tblClase"."IdProfesor",("tblPersonas"."strPrimerNombre" || "tblPersonas"."strPrimerApellido") As "strNombreProfesor",
	 "tblMaterias"."strNombre" As "Materia","vwSalones"."Ubicacion", "vwSalones"."Piso", "vwSalones"."Numero",
	 "tblClase"."strGrupo" As "Grupo","tblClase"."intGrado" As "Grado","tblClase"."intAño" As "Año"
  From "tblClase"
  Left Join "tblPersonas" 
    On "tblClase"."IdProfesor" = "tblPersonas"."Id"
  Left Join "tblMaterias"
    On "tblClase"."IdMateria" = "tblMaterias"."Id"
  Left Join "vwSalones"
    On "tblClase"."IdSalon" = "vwSalones"."Id"	
)
;
CREATE VIEW "vwEstudiantes"
AS
(
   Select
  "tblPersonas"."Id", 
  "tblPersonas"."dtFechaIngreso" As "dtFechaRegistro", "tblPersonas"."dtFechaActualizacion", 
  "tblPersonas"."IdCreador", "tblPersonas"."IdModificador", 
  "vwDocumentos"."strAbreviatura","vwDocumentos"."bintNumero",
  "tblPersonas"."strPrimerNombre", "tblPersonas"."strSegundoNombre", 
  "tblPersonas"."strPrimerApellido", "tblPersonas"."strSegundoApellido", 
  "tblPersonas"."blSexo",  "tblPersonas"."dtFechaNacimiento", 
  "tblPersonas"."strLugarNacimiento",   "tblPersonas"."strDireccionAlt", 
  "tblPersonas"."strBarrioAlt",  "tblPersonas"."strCiudadAlt", "tblPersonas"."strDepartamentoAlt",  "tblPersonas"."strTelefono", 
  "tblPersonas"."strTelefonoTrabajo",  "tblPersonas"."strTelefonoAlt",  "tblPersonas"."blEstado",  "tblEstudiantes"."intGrado",  
  "tblEstudiantes"."strGrupo",  "tblEstudiantes"."dtFechaRetiro",  "tblEstudiantes"."dtFechaIngreso", "tblEstudiantes"."strMotivoRetiro"
   From "tblEstudiantes"
   Left Join "tblPersonas"
	On "tblPersonas"."Id" = "tblEstudiantes"."IdPersona"
   Left Join "vwDocumentos"
	On "vwDocumentos"."IdPersona" = "tblPersonas"."Id"
   Where "vwDocumentos"."blEstado" = true
)
;

CREATE VIEW "vwHorario"
AS
(
SELECT 
  "tblHorario"."IdClase", 
  "tblHorario"."strDia", 
  "tblHorario"."tmHora", 
  "vwClases"."strNombreProfesor", 
  "vwClases"."Materia"
FROM 
  "tblHorario", 
  "vwClases"
WHERE 
  "tblHorario"."IdClase" = "vwClases"."IdClase"
)
;

CREATE VIEW "vwEstudiantesNotas"
AS
(
     Select "vwEstudiantes"."Id", "vwEstudiantes"."strPrimerNombre", "vwEstudiantes"."strSegundoNombre", 
  "vwEstudiantes"."strPrimerApellido", "vwEstudiantes"."strSegundoApellido", 
"vwClases"."Materia","tblNotas"."fltCalificacion","tblNotas"."strDescripcion"
     From "tblNotas"
     left join "vwClases"
	on "vwClases"."IdClase" = "tblNotas"."IdClase"
     left join "vwEstudiantes"
	on "vwEstudiantes"."Id" = "tblNotas"."IdEstudiante"
)
;

CREATE VIEW "vwDocumentos"
AS (
SELECT 
  "tblDocumentos"."Id", 
  "tblTiposDocumento"."strDescripcion",
  "tblTiposDocumento"."strAbreviatura",
  "tblDocumentos"."bintNumero", 
  "tblDocumentos"."IdPersona", 
  "tblDocumentos"."blEstado" 
 
FROM 
  "tblDocumentos", 
  "tblTiposDocumento"
 WHERE 
"tblTiposDocumento"."Id" = "tblDocumentos"."IdTipoDocumento"
);