
/*¿averiaguar el precio de hyundai vision */

SELECT "Precio"
FROM "Datos Vehiculos" as "v" join "Datos Segundarios" as "s"
ON "v"."Placa"="s"."Placa" join  "Accesorios" as "a"
ON "s"."IdAccesorios"="a"."IdAccesorios" join "Precio" as "p"
ON "a"."IdPrecio"="p"."IdPrecio"
WHERE "Marca"='hyundai' and "Serie"='vision';

/*¿numero de la casa y del celular del dueño del chaverolet swift ?*/

SELECT  "Nombre","Numero Telefonico Casa" as "Numero De La Casa" , "Numero Telefonico celular" as "Numero Del Celular"
FROM "Datos Vehiculos" as "v"join "Datos Dueños" as "d"
ON "v"."IdIdentificacion"="d"."IdIdentificacion" join "Contactar" as "c"
ON "d"."IdTelefono"="c"."IdTelefono"
WHERE "Marca"='chevrolet' and "Serie"='swift';


/*¿ Que sonido tiene la chevrolet dmax?*/

SELECT "Sonido"
FROM "Datos Vehiculos" as "v" join "Datos Segundarios" as "s"
ON "v"."Placa"="s"."Placa" join "Accesorios" as "a"
ON "s"."IdAccesorios"="a"."IdAccesorios"
WHERE "Marca"= 'chevrolet' and "Serie"= 'dmax' ;