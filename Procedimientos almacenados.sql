-- SP 1: Agregar producto 
/*
    Este procedimiento almacenado tiene como objetivo agregar un nuevo producto a la tabla 'Producto' con los detalles proporcionados.
    
    Llamada al procedimiento almacenado:
    CALL sp_Agregar_producto('pp11', 'tijeras especiales', 12.99, 3, 'pv1');
*/
DELIMITER //

CREATE PROCEDURE sp_Agregar_producto 
    (IN IdProductoN VARCHAR(45),
    IN NombreProductoN VARCHAR(45),
    IN PrecioProductoN FLOAT,
    IN CantidadDisponibleN INT,
    IN idProveedorN VARCHAR(45))
BEGIN
    INSERT INTO Producto (idProducto, Nombre, Precio, CantidadDisponible, idProveedor) VALUES
    (IdProductoN, NombreProductoN, PrecioProductoN, CantidadDisponibleN, idProveedorN);
END //

DELIMITER ;


-- SP 2: Eliminar producto 
/*
    Este procedimiento almacenado tiene como objetivo eliminar un producto de la tabla 'Producto' según el ID proporcionado.
    
    Llamada al procedimiento almacenado:
    CALL sp_eliminar_producto('pp11');
*/
DELIMITER //

CREATE PROCEDURE sp_eliminar_producto 
    (IN IdProductoD VARCHAR(45))
BEGIN
    DELETE FROM producto
    WHERE idProducto = idProductoD;
END //

DELIMITER ;


-- SP 3: Crear cita 
/*
    Este procedimiento almacenado tiene como objetivo crear una nueva cita.
    
    Llamada al procedimiento almacenado:
    CALL CrearCita('ct3','15:30:01', '2023-02-03', '4444444444', '1515151515', 'a4');
*/

DELIMITER //

CREATE PROCEDURE CrearCita(
    IN idCita VARCHAR(45),
    IN Hora TIME,
    IN Fecha DATE,
    IN idCliente VARCHAR(45),
    IN idEmpleado VARCHAR(45),
    IN idAtencion VARCHAR(45)
)
BEGIN
    INSERT INTO cita (idCita, Hora, Fecha, idCliente, idEmpleado, idAtencion)
    VALUES (idCita, Hora, Fecha, idCliente, idEmpleado, idAtencion);
END //

DELIMITER ;


-- SP 4: Borrar cita 
/*
    Este procedimiento almacenado tiene como objetivo eliminar una cita existente.
    
    Llamada al procedimiento almacenado:
    CALL BorrarCita('ct3');
*/

DELIMITER //

CREATE PROCEDURE BorrarCita(
    IN idCitaArg VARCHAR(45)
)
BEGIN
    DELETE FROM cita
    WHERE idCita = idCitaArg;
END //

DELIMITER ;





