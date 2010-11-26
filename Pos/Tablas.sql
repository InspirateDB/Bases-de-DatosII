CREATE TABLE "tblForma_pago"
(
  strcodigo serial NOT NULL,
  "strContado" integer,
  "strCredito" "char",
  "strCheque" integer,
  "strTargeta_credito" character varying(80),
  strnumero_cliente integer,
  CONSTRAINT "tblForma_pago_pkey" PRIMARY KEY (strcodigo),
  CONSTRAINT "tblForma_pago_strnumero_cliente_fkey" FOREIGN KEY (strnumero_cliente)
      REFERENCES tblclientes (strnumero)
);

CREATE TABLE tblatriculos_de_la_canasta
(
  strcodigo serial NOT NULL,
  strfecha_y_hora date NOT NULL,
  strcantidad character varying(50),
  strsku_producto integer,
  strcosto integer,
  CONSTRAINT tblatriculos_de_la_canasta_pkey PRIMARY KEY (strfecha_y_hora),
  CONSTRAINT tblatriculos_de_la_canasta_strsku_producto_fkey FOREIGN KEY (strsku_producto)
      REFERENCES tblproductos (strsku)
);

CREATE TABLE tblcesta_de_compras
(
  strnumero_cliente serial NOT NULL,
  strfecha_y_hora_de_la_compra date NOT NULL,
  strcosto_total character varying(50),
  CONSTRAINT tblcesta_de_compras_pkey PRIMARY KEY (strfecha_y_hora_de_la_compra),
  CONSTRAINT tblcesta_de_compras_strnumero_cliente_fkey FOREIGN KEY (strnumero_cliente)
      REFERENCES tblclientes (strnumero)
);

CREATE TABLE tblclientes
(
  strnumero serial NOT NULL,
  strnombre character varying(50),
  strtelefono character varying(50),
  stremail character varying(50),
  strfecha_en_que_se_convirtio_en_cliente date,
  strid_tipo_de_documento integer,
  "strCodigo_forma_pago" integer,
  CONSTRAINT tblclientes_pkey PRIMARY KEY (strnumero),
  CONSTRAINT "tblclientes_strCodigo_forma_pago_fkey" FOREIGN KEY ("strCodigo_forma_pago")
      REFERENCES "tblForma_pago" (strcodigo) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT tipodocument FOREIGN KEY (strid_tipo_de_documento)
      REFERENCES tbltipo_de_documento (strid)
);

CREATE TABLE tblcostos
(
  strvalor_venta serial NOT NULL,
  strvalor_entrada character varying(100),
  strdescuento_por_temporada integer,
  strsku_del_producto integer,
  CONSTRAINT tblcostos_pkey PRIMARY KEY (strvalor_venta),
  CONSTRAINT tblcostos_strdescuento_por_temporada_fkey FOREIGN KEY (strdescuento_por_temporada)
      REFERENCES tbltemporada (strcodigo_de_temporada)
);

CREATE TABLE tbldirecciones
(
  strciudad character varying(100),
  strcodigo_postal character varying(100),
  strdepartamento character varying(50),
  "strCodigo" serial NOT NULL,
  strnumero_cliente integer,
  "strIdentificacion_proveedor" integer,
  CONSTRAINT strcodigo PRIMARY KEY ("strCodigo"),
  CONSTRAINT "tbldirecciones_strIdentificacion_proveedor_fkey" FOREIGN KEY ("strIdentificacion_proveedor")
      REFERENCES tblproveedores (stridentificacion) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT tbldirecciones_strnumero_cliente_fkey FOREIGN KEY (strnumero_cliente)
      REFERENCES tblclientes (strnumero)
);

CREATE TABLE tblimpuestos
(
  striva serial NOT NULL,
  strsku_producto integer,
  CONSTRAINT tblimpuestos_pkey PRIMARY KEY (striva),
  CONSTRAINT tblimpuestos_strsku_producto_fkey FOREIGN KEY (strsku_producto)
      REFERENCES tblproductos (strsku) 
);

CREATE TABLE tblinventarios
(
  strcodigo serial NOT NULL,
  strfecha date NOT NULL,
  strlocalizacion character varying(50),
  strcantidad_en_stock character varying(50),
  strreordenar_nivel character varying(50),
  strreordenar_cantidad character varying(50),
  strtotal_de_consumo_mensual_promedio character varying(100),
  "strSku_producto" integer,
  strcodigo_proveedores_de_productos integer,
  CONSTRAINT tblinventarios_pkey PRIMARY KEY (strfecha),
  CONSTRAINT "tblinventarios_strSku_producto_fkey" FOREIGN KEY ("strSku_producto")
      REFERENCES tblproductos (strsku) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT tblinventarios_strcodigo_proveedores_de_productos_fkey FOREIGN KEY (strcodigo_proveedores_de_productos)
      REFERENCES tblproveedores_de_productos (strcodigo)
);

CREATE TABLE tblmarca
(
  strid serial NOT NULL,
  strsku_producto integer,
  CONSTRAINT tblmarca_pkey PRIMARY KEY (strid),
  CONSTRAINT tblmarca_strsku_producto_fkey FOREIGN KEY (strsku_producto)
      REFERENCES tblproductos (strsku)
);

CREATE TABLE tblproductos
(
  strsku serial NOT NULL,
  strnombre_producto character varying(100),
  strfecha_entrada date,
  strfecha_vencimiento date,
  strcodigo_tipo_de_producto integer,
  strvalor_venta integer,
  strid_marca integer,
  "strCodigo_de_temporada" integer,
  striva integer,
  CONSTRAINT tblproductos_pkey PRIMARY KEY (strsku),
  CONSTRAINT "tblproductos_strCodigo_de_temporada_fkey" FOREIGN KEY ("strCodigo_de_temporada")
      REFERENCES tbltemporada (strcodigo_de_temporada) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT tblproductos_strcodigo_tipo_de_producto_fkey FOREIGN KEY (strcodigo_tipo_de_producto)
      REFERENCES tbltipos_de_productos (strcodigo_tipo_de_producto) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT tblproductos_strid_marca_fkey FOREIGN KEY (strid_marca)
      REFERENCES tblmarca (strid) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT tblproductos_striva_fkey FOREIGN KEY (striva)
      REFERENCES tblimpuestos (striva) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT tblproductos_strvalor_venta_fkey FOREIGN KEY (strvalor_venta)
      REFERENCES tblcostos (strvalor_venta)
);

CREATE TABLE tblproveedores
(
  stridentificacion serial NOT NULL,
  strnombre character varying(50),
  stremail character varying(50),
  strtelefono character varying(50),
  strnombre_empresa character varying(50),
  "strCodigo_direccion" integer,
  strcodigo_proveedores_de_productos integer,
  CONSTRAINT tblproveedores_pkey PRIMARY KEY (stridentificacion),
  CONSTRAINT tblproveedores_strcodigo_proveedores_de_productos_fkey FOREIGN KEY (strcodigo_proveedores_de_productos)
      REFERENCES tblproveedores_de_productos (strcodigo)
);

CREATE TABLE tblproveedores_de_productos
(
  strcodigo serial NOT NULL,
  strsku character varying(50),
  strvalor_proporcionado_hasta_la_fecha character varying(50),
  strcantidad_total_suministrada_a_la_fecha character varying(50),
  strtiempo_entrega character varying(50),
  strprecio_estandar character varying(50),
  strporcentaje_de_descuento character varying(50),
  strcantidad_minima_de_pedido character varying(50),
  strcantidad_maxima_de_pedido character varying(50),
  "strIdentificacion_proveedor" integer,
  CONSTRAINT tblproveedores_de_productos_pkey PRIMARY KEY (strcodigo),
  CONSTRAINT "tblproveedores_de_productos_strIdentificacion_proveedor_fkey" FOREIGN KEY ("strIdentificacion_proveedor")
      REFERENCES tblproveedores (stridentificacion)
);

CREATE TABLE tblregularizacion_de_stock
(
  strnumero_movimiento serial NOT NULL,
  strfecha date,
  strmovimiento character varying(100),
  stralmacenamiento_de_entrada character varying(100),
  stralmacenamiento_de_salida character varying(100),
  strcodigo_proveedores_de_productos integer,
  strsku_producto integer,
  CONSTRAINT tblregularizacion_de_stock_pkey PRIMARY KEY (strnumero_movimiento),
  CONSTRAINT tblregularizacion_de_stock_strcodigo_proveedores_de_produc_fkey FOREIGN KEY (strcodigo_proveedores_de_productos)
      REFERENCES tblproveedores_de_productos (strcodigo) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT tblregularizacion_de_stock_strsku_producto_fkey FOREIGN KEY (strsku_producto)
      REFERENCES tblproductos (strsku)
);

CREATE TABLE tbltemporada
(
  strcodigo_de_temporada serial NOT NULL,
  strfecha_temporada date,
  strvalor_venta character varying(100),
  strdescuento character varying(100),
  strsku_producto integer,
  CONSTRAINT tbltemporada_pkey PRIMARY KEY (strcodigo_de_temporada),
  CONSTRAINT tbltemporada_strsku_producto_fkey FOREIGN KEY (strsku_producto)
      REFERENCES tblproductos (strsku)
);

CREATE TABLE tbltipo_de_documento
(
  strid serial NOT NULL,
  strnombre character varying(100),
  CONSTRAINT tbltipo_de_documento_pkey PRIMARY KEY (strid)
);

CREATE TABLE tbltipos_de_productos
(
  strcodigo_tipo_de_producto serial NOT NULL,
  strdescripcion character varying(200),
  CONSTRAINT tbltipos_de_productos_pkey PRIMARY KEY (strcodigo_tipo_de_producto)
);

CREATE TABLE cliente_actualizado
(
  strnumero integer,
  strnombre character varying(100),
  strtelefono_anterior character varying(100),
  strtelefono_actual character varying(100),
  strautor character varying(100),
  fecha_cambio date,
  CONSTRAINT strnumero_fk FOREIGN KEY (strnumero)
      REFERENCES tblclientes (strnumero)
);

CREATE TABLE costo_actualizado
(
  strvalor_venta integer,
  strvalor_entrada character varying(50),
  strsku_producto integer,
  strprecio_venta_anterior integer,
  strprecio_venta_actual integer,
  strvalor_entrada_anterior integer,
  strvalor_entrada_actual integer,
  strfecha_cambio date,
  strautor character varying(100),
  CONSTRAINT strvalor_venta_fk FOREIGN KEY (strvalor_venta)
      REFERENCES tblcostos (strvalor_venta)
);

CREATE TABLE producto_actualizado
(
  strsku integer,
  strnombre_producto character varying(100),
  strcodigo_tipo_de_producto integer,
  strvalor_venta_anterior integer,
  strvalor_venta_actualizado integer,
  strautor character varying(100),
  strfecha_cambio date,
  CONSTRAINT strsku_fk FOREIGN KEY (strsku)
      REFERENCES tblproductos (strsku)
 );

 CREATE TABLE stock_actualizado
(
  strnumero_movimiento integer,
  strfecha_anterior date,
  strfecha_actualizada date,
  strsku_producto integer,
  strautor character varying(100),
  strfecha_cambio date,
  CONSTRAINT strnumero_movimiento_fk FOREIGN KEY (strnumero_movimiento)
      REFERENCES tblregularizacion_de_stock (strnumero_movimiento)
);

CREATE TABLE temporada_actualizada
(
  strcodigo_de_temporada integer,
  strfecha_temporada date,
  strdescuento_anterior character varying(100),
  strdescuento_actual character varying(100),
  strautor character varying(100),
  strfecha_cambio date,
  CONSTRAINT strcodigo_de_temporada_fk FOREIGN KEY (strcodigo_de_temporada)
      REFERENCES tbltemporada (strcodigo_de_temporada)
);
