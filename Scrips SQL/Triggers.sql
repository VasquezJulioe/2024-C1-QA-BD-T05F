-- Tabla: control_de_cambios_barberia
CREATE TABLE control_de_cambios_barberia (
    usuario VARCHAR(100),
    accion VARCHAR(100),
    fecha DATETIME
);


DELIMITER //

-- Creación del 1er Trigger: Control de eliminación 
/*
    Este trigger registra en la tabla 'control_de_cambios_barberia' cada vez que se inserta un nuevo producto en la tabla 'Producto'.
    
    Ejemplo de uso:
    CALL sp_eliminar_producto('pp9');
    SELECT * FROM control_de_cambios_barberia;
*/
CREATE TRIGGER controlEliminacionProducto
AFTER INSERT ON producto 
FOR EACH ROW
BEGIN
    INSERT INTO control_de_cambios_barberia (usuario, accion, fecha)
    VALUES (USER(), 'Delete Product', NOW());
END;
//

DELIMITER ;


-- Creación del segundo Trigger: Control de creación de cita 
/*
    Este trigger registra en la tabla 'control_de_cambios_barberia' cada vez que se inserta un nuevo registro en la tabla 'cita'.
    
    Ejemplo de uso:
    CALL CrearCita('ct4','15:30:01', '2023-02-03', '4444444444', '1515151515', 'a3');
    SELECT * FROM control_de_cambios_barberia;
*/
DELIMITER //

CREATE TRIGGER tr_crear_cita
AFTER INSERT ON cita
FOR EACH ROW
BEGIN
    INSERT INTO control_de_cambios_barberia (usuario, accion)
    VALUES (USER(), 'Creación cita');
END //

DELIMITER ;





