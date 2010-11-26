CREATE OR REPLACE VIEW vista_atriculos_de_la_canasta AS 
 SELECT tblatriculos_de_la_canasta.strcodigo, tblatriculos_de_la_canasta.strfecha_y_hora, tblatriculos_de_la_canasta.strsku_producto, tblatriculos_de_la_canasta.strcantidad, tblatriculos_de_la_canasta.strcosto
   FROM tblatriculos_de_la_canasta;

CREATE OR REPLACE VIEW vista_cesta_de_compras AS 
 SELECT tblcesta_de_compras.strnumero_cliente, tblcesta_de_compras.strfecha_y_hora_de_la_compra, tblcesta_de_compras.strcosto_total
   FROM tblcesta_de_compras;

CREATE OR REPLACE VIEW vista_costos AS 
 SELECT tblcostos.strvalor_venta, tblcostos.strvalor_entrada, tblcostos.strdescuento_por_temporada, tblcostos.strsku_del_producto
   FROM tblcostos;


CREATE OR REPLACE VIEW vista_impuestos AS 
 SELECT tblimpuestos.strsku_producto, tblimpuestos.striva
   FROM tblimpuestos;

CREATE OR REPLACE VIEW vista_regularizacion_de_stock AS 
 SELECT tblregularizacion_de_stock.strnumero_movimiento, tblregularizacion_de_stock.strfecha, tblregularizacion_de_stock.strmovimiento, tblregularizacion_de_stock.stralmacenamiento_de_entrada, tblregularizacion_de_stock.stralmacenamiento_de_salida, tblregularizacion_de_stock.strcodigo_proveedores_de_productos, tblregularizacion_de_stock.strsku_producto
   FROM tblregularizacion_de_stock;

CREATE OR REPLACE VIEW vista_temporada AS 
 SELECT tbltemporada.strcodigo_de_temporada, tbltemporada.strfecha_temporada, tbltemporada.strsku_producto, tbltemporada.strvalor_venta, tbltemporada.strdescuento
   FROM tbltemporada;


CREATE OR REPLACE VIEW vista_tipo_de_documento AS 
 SELECT tbltipo_de_documento.strid, tbltipo_de_documento.strnombre
   FROM tbltipo_de_documento;

CREATE OR REPLACE VIEW vw_clientes AS 
 SELECT tblclientes.strnumero, tbltipo_de_documento.strid AS id
   FROM tblclientes
   JOIN tbltipo_de_documento ON tblclientes.strid_tipo_de_documento = tbltipo_de_documento.strid;

CREATE OR REPLACE VIEW vw_productos AS 
 SELECT tblproductos.strsku, tbltipos_de_productos.strcodigo_tipo_de_producto AS codigo
   FROM tblproductos
   JOIN tbltipos_de_productos ON tblproductos.strcodigo_tipo_de_producto = tbltipos_de_productos.strcodigo_tipo_de_producto;

CREATE OR REPLACE VIEW vw_proveedores_de_productos AS 
 SELECT tblproveedores_de_productos.strcodigo, tblproveedores.stridentificacion AS identificacion
   FROM tblproveedores_de_productos
   LEFT JOIN tblproveedores ON tblproveedores_de_productos.strcodigo = tblproveedores.strcodigo_proveedores_de_productos;
