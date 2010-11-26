CREATE OR REPLACE FUNCTION producto_actualizado_tri()
 RETURNS trigger AS
 '
   BEGIN
      IF  TG_OP =''UPDATE'' THEN
  insert into producto_actualizado values ( old.strsku_producto,strold.nombre_producto,old.strfecha_entrada,old.strfecha_vencimiento,old.strcodigo_tipo_de_producto,old.strvalor_venta,old.strid_marca,old.strcodigo_de_temporada,old.striva,
  new.precio_venta,new.fecha_entrada,current_user, current_date);
      END IF;
      RETURN NULL;
   END;
 ' LANGUAGE plpgsql;


CREATE TRIGGER producto_actualizado AFTER UPDATE ON tblproductos
 FOR EACH ROW EXECUTE PROCEDURE producto_actualizado_tri()

/*clientes*/
CREATE OR REPLACE FUNCTION cliente_actualizado_tri()
  RETURNS trigger AS
$BODY$
   BEGIN
      IF  TG_OP ='UPDATE' THEN
  insert into cliente_actualizado values ( old.strnumero,old.strnombre,old.strtelefono,old.stremail,old.strfecha_en_que_se_convirtio_en_cliente,old.strid_tipo_de_documento,old.strcodigo_forma_pago,
  new.telefono,current_user, current_date);
      END IF;
      RETURN NULL;
   END;
 $BODY$
  LANGUAGE 'plpgsql';

CREATE TRIGGER cliente_actualizado AFTER UPDATE ON tblclientes
 FOR EACH ROW EXECUTE PROCEDURE cliente_actualizado_tri()

/*costos*/
CREATE OR REPLACE FUNCTION costo_actualizado_tri()
  RETURNS trigger AS
$BODY$
   BEGIN
      IF  TG_OP ='UPDATE' THEN
  insert into costo_actualizado values ( old.strvalor_venta,old.strvalor_entrada,old.strsku_producto,
  new.precio_venta,new.valor_entrada,current_user, current_date);
      END IF;
      RETURN NULL;
   END;
 $BODY$
  LANGUAGE 'plpgsql';

  CREATE TRIGGER costo_actualizado AFTER UPDATE ON tblcostos
 FOR EACH ROW EXECUTE PROCEDURE costo_actualizado_tri()

/*stock actualizado*/
CREATE OR REPLACE FUNCTION stock_actualizado_tri()
  RETURNS trigger AS
$BODY$
   BEGIN
      IF  TG_OP ='UPDATE' THEN
  insert into stock_actualizado values ( old.strnumero_movimiento,old.strfecha,old.strsku_producto,
  new.fecha,current_user, current_date);
      END IF;
      RETURN NULL;
   END;
 $BODY$
  LANGUAGE 'plpgsql';
 CREATE TRIGGER stock_actualizado AFTER UPDATE ON tblregularizacion_de_stock
 FOR EACH ROW EXECUTE PROCEDURE stock_actualizado_tri()

 /*temporada*/

 CREATE OR REPLACE FUNCTION temporada_actualizada_tri()
  RETURNS trigger AS
$BODY$
   BEGIN
      IF  TG_OP ='UPDATE' THEN
  insert into temporada_actualizada values ( old.strcodigo_de_temporada,old.strfecha,old.strdescuento,
  new.descuento,current_user, current_date);
      END IF;
      RETURN NULL;
   END;
 $BODY$
  LANGUAGE 'plpgsql';

  CREATE TRIGGER temporada_actualizada AFTER UPDATE ON tbltemporada
 FOR EACH ROW EXECUTE PROCEDURE temporada_actualizada_tri()


 
