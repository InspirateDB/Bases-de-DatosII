CREATE OR REPLACE FUNCTION "sp_InsertarCliente" 
( tipodocumento varchar, metodopago varchar, 
nombre varchar, telefono varchar, email varchar, fechaconversioncliente date) /*PARAMETROS: nombre tipodato*/
RETURNS boolean 
AS
$BODY$ 
DECLARE IDTEMP INTEGER;
BEGIN

SELECT strnumero INTO idtemp from tblclientes where strnombre;

INSERT INTO tblclientes(
            strnumero, strid_tipo_de_documento, strcodigo_del_metodo_de_pago, 
            strnombre, strtelefono, stremail, strfecha_en_que_se_convirtio_en_cliente)
    VALUES ( tipodocumento, metodopago, 
            nombre, telefono, email, fechaconversioncliente);
            RETURN TRUE;
END ;
$BODY$
LANGUAGE "plpgsql";

CREATE OR REPLACE FUNCTION "sp_ActualizacionCliente"(tipodocumento varchar, metodopago varchar, 
nombre varchar, telefono varchar, email varchar, fechaconversioncliente date) RETURNS boolean
AS
$BODY$
DECLARE IDTEMP INTEGER;
BEGIN

SELECT strnumero INTO idtemp from tblclientes where strnombre;

UPDATE tblclientes SET 
            
            strid_tipo_de_documento= tipodocumento, strcodigo_del_metodo_de_pago=metodopago , 
            strnombre=nombre , strtelefono=telefono , stremail= email, strfecha_en_que_se_convirtio_en_cliente=fechaconversioncliente
            WHERE strnumero= IDTEMP;
            RETURN TRUE;
END ;
$BODY$
LANGUAGE "plpgsql";

/*articulos de la canasta*/

CREATE OR REPLACE FUNCTION "sp_InsertarArticulosdelacanasta" 
(Codigo int, Fechayhora date, Skuproducto varchar, 
Cantidad varchar, Costo varchar) 
RETURNS boolean 
AS
$BODY$ 
BEGIN

INSERT INTO tblarticulos_de_la_canasta(
            strcodigo, strfecha_y_hora, strsku_producto, 
            strCantidad, strtcosto)
    VALUES (Codigo, Fechayhora, sku_producto, 
            cantidad, costo);
            RETURN TRUE;
END ;
$BODY$
LANGUAGE "plpgsql";


CREATE OR REPLACE FUNCTION "sp_ActualizacionArticulosdelacanasta"(Codigo int, fechayhora date, skuProducto varchar, 
cantidad varchar, costo varchar) RETURNS boolean
AS
$BODY$
BEGIN

UPDATE tblarticulos_de_la_canasta SET 
            strcodigo= codigo, strfecha_y_hora= fechayhora, strsku_producto=skuproducto , 
            strcantidad=cantidad , strcosto=costo
           WHERE strcodigo= codigo;
            RETURN TRUE;
END ;
$BODY$
LANGUAGE "plpgsql";

/*cesta de compras*/
CREATE OR REPLACE FUNCTION "sp_InsertarCesta_de_compras" 
(numerocliente int, Fechayhoradelacompra date, costototal varchar) 
RETURNS boolean 
AS
$BODY$ 
BEGIN

INSERT INTO tblcestadecompras(
            strnumero_cliente, strfecha_y_hora_de_la_compra, strcosto_total)
    VALUES (numerocliente, Fechayhoradelacompra, costototal);
            RETURN TRUE;
END ;
$BODY$
LANGUAGE "plpgsql";

CREATE OR REPLACE FUNCTION "sp_Actualizacioncestadecompras"(numerocliente int, fechayhoradelacompra date,costototal varchar) RETURNS boolean
AS
$BODY$
BEGIN

UPDATE tblcestadecompras SET 
            strnumero_cliente= numerocliente, strfecha_y_hora_de_la_compra=fechayhoradelacompra,strcosto_total=costototal
           WHERE strfecha_y_hora_de_la_compra= fechayhoradelacompra;
            RETURN TRUE;
END ;
$BODY$
LANGUAGE "plpgsql";

/*costos*/
CREATE OR REPLACE FUNCTION "sp_Insertarcostos" 
(valorventa int, valorentrada varchar, descuentoportemporada varchar, 
skudelproducto varchar) 
RETURNS boolean 
AS
$BODY$ 
BEGIN

INSERT INTO tblcostos(
            strvalor_venta, strvalor_entrada, strDescuento_por_temporada, 
            strsku_del_producto)
    VALUES (valorventa, valorentrada, descuentoportemporada, 
            skudelproducto);
            RETURN TRUE;
END ;
$BODY$
LANGUAGE "plpgsql";

CREATE OR REPLACE FUNCTION "sp_ActualizacionCostos"(valorventa int,valorentrada varchar, descuentoportemporada varchar, 
skudelproducto varchar)
RETURNS boolean
AS
$BODY$
BEGIN

UPDATE tblcostos SET 
           strvalor_venta= valorventa, strvalor_entrada= valorentrada, strdescuento_por_temporada= descuentoportemporada, 
            strsku_del_producto=skudelproducto
           WHERE strvalor_venta= valorventa;
            RETURN TRUE;
END ;
$BODY$
LANGUAGE "plpgsql";

/*direcciones*/
CREATE OR REPLACE FUNCTION "sp_InsertarDirecciones" 
(direccion int, ciudad varchar, codigopostal varchar,departamento varchar) 
RETURNS boolean 
AS
$BODY$ 
BEGIN

INSERT INTO tblDirecciones(
            strDireccion, strciudad, strcodigo_postal,strDepartamento)
    VALUES (direccion, ciudad, codigopostal,departamento);
            RETURN TRUE;
END ;
$BODY$
LANGUAGE "plpgsql";


CREATE OR REPLACE FUNCTION "sp_Actualizaciondirecciones"(direccion int,ciudad varchar, codigopostal varchar, 
departamento varchar)
RETURNS boolean
AS
$BODY$
BEGIN

UPDATE tbldirecciones SET 
           strdireccion= direccion, strciudad= ciudad, strcodigo_postal= codigopostal, 
            strdepartamento=departamento
           WHERE strdireccion= direccion;
            RETURN TRUE;
END ;
$BODY$
LANGUAGE "plpgsql";

/*inventario*/
CREATE OR REPLACE FUNCTION "sp_Insertarinventarios" 
(codigo int, fecha date, sku varchar,localizacion varchar,
 cantidadenstock varchar, reordenarnivel varchar, reordenarcantidad varchar,totalconsumomensual varchar) 
RETURNS boolean 
AS
$BODY$ 
BEGIN

INSERT INTO tblInventarios(
            strcodigo,strfecha, strsku,strlocalizacion,strcantidad_en_stock,
            strreordenar_nivel,strreordenarcantidad, strtotal_de_consumo_mensual)
    VALUES (codigo, fecha, sku,localizacion, cantidadenstock,reordenarnivel,reordenarcantidad,totaldeconsumomensual);
            RETURN TRUE;
END ;
$BODY$
LANGUAGE "plpgsql";


CREATE OR REPLACE FUNCTION "sp_ActualizacionInventarios"(codigo int,fecha date,localizacion varchar, 
cantidad_en_stock varchar,reordenar_nivel varchar,reordenar_cantidad varchar,total_de_consumo_mensual varchar,sku_producto integer,codigo_proveedores_de_productos integer)
RETURNS boolean
AS
$BODY$
BEGIN

UPDATE tblinventarios SET 
           strcodigo= codigo, strfecha= fecha, strlocalizacion= localizacion,strcantidad_en_stock= cantidad_en_stock, 
            strreordenar_nivel=reordenar_nivel, strreordenar_cantidad= reordenar_cantidad,strtotal_de_consumo_mensual= total_de_consumo_mensual, strsku_producto=sku_producto, strcodigo_proveedores_de_productos= codigo_proveedores_de_productos
           WHERE strcodigo= codigo;
            RETURN TRUE;
END ;
$BODY$
LANGUAGE "plpgsql";



/*regularizacion de stock*/

CREATE OR REPLACE FUNCTION "sp_Insertarregularizacion" 
(numero_movimiento int, fecha date, movimiento varchar,almacenamiento_de_entrada varchar,
 almacenamiento_de_salida varchar, codigo_proveedores_de_productos integer, sku_producto integer)  
RETURNS boolean 
AS
$BODY$ 
BEGIN

INSERT INTO tblregularizacion_de_stock(
            strnumero_movimiento,strfecha, strmovimiento,stralmacenamiento_de_entrada,stralmacenamiento_de_salida,
            strcodigo_proveedores_de_productos,strsku_producto)
    VALUES (numero_movimiento, fecha, movimiento, almacenamiento_de_entrada,almacenamiento_de_salida,codigo_proveedores_de_productos,sku_producto);
            RETURN TRUE;
END ;
$BODY$
LANGUAGE "plpgsql";


CREATE OR REPLACE FUNCTION "sp_Actualizacionregularizacion"(numero_movimiento int,fecha date,movimiento varchar, 
almacenamiento_de_entrada varchar,almacenemiento_de_salida varchar,codigo_proveedores_de_productos integer,sku_producto integer)
RETURNS boolean
AS
$BODY$
BEGIN

UPDATE tblregularizacion_de_stock SET 
           strnumero_movimiento= numero_movimiento, strfecha= fecha, strmovimiento=movimiento,stralmacenamiento_de_entrada=almacenamiento_de_salida,strcodigo_proveedores_de_productos=codigo_proveedores_de_productos, 
            strsku_producto=sku_producto
           WHERE strnumero_movimiento= numero_movimiento;
            RETURN TRUE;
END ;
$BODY$
LANGUAGE "plpgsql";

/*proveedores*/
CREATE OR REPLACE FUNCTION "sp_Insertarproveedor" 
(identificacion int, nombre varchar, email varchar,telefono varchar,
 nombre_empresa varchar, codigo_direccion integer, codigo_proveedores_de_productos integer)  
RETURNS boolean 
AS
$BODY$ 
BEGIN

INSERT INTO tblproveedores(
            stridentificacion,strnombre, stremail,strtelefono,strnombre_empresa,
            strcodigo_direccion,strcodigo_proveedores_de_productos)
    VALUES (identificacion, nombre, email,telefono ,nombre_empresa,codigo_direccion,codigo_proveedores_de_productos);
            RETURN TRUE;
END ;
$BODY$
LANGUAGE "plpgsql";


CREATE OR REPLACE FUNCTION "sp_Actualizacionproveedores"(identificacion int,nombre varchar,email varchar, 
telefono varchar,nombre_empresa varchar,codigo_proveedores_de_productos integer,codigo_direccion integer)
RETURNS boolean
AS
$BODY$
BEGIN

UPDATE tblproveedores SET 
           stridentificacion= identificacion, strnombre= nombre, stremail=email,strtelefono=telefono,strnombre_emopresa=nombre_empresa, 
            strnumero_direccion= numero_direccion,strcodigo_proveedores_de_productos=codigo_proveedores_de_productos
            WHERE stridentificacion= identificacion;
            RETURN TRUE;
END ;
$BODY$
LANGUAGE "plpgsql";
