-- La siguiente vista muestra a los empleados con cantidad de servicios ordenados 
-- de mayor a menor cantidad. Le permite al administrador de la barbería ver
-- cuáles empleados son los que más trabajan 

CREATE VIEW ServiciosPorEmpleados AS
SELECT 
	E.idEmpleado
    ,P.Nombre
    ,COUNT(E.IdEmpleado) AS ServiciosRealizados
FROM empleado E 
INNER JOIN Persona P ON (E.IdEmpleado = P.cedula)
INNER JOIN Factura F ON E.idEmpleado = F.idEmpleado
INNER JOIN facturaservicioatencion FSA ON F.IdFactura = FSA.IdFactura
INNER JOIN servicioatencion SA ON FSA.IdAtencion = SA.IdAtencion
INNER JOIN servicio S ON (s.idServicio = SA.idServicio)
GROUP BY E.idEmpleado ORDER BY 3 DESC;


-- La siguiente vista muestra la cantidad de productos consumidos por tipo de servicio, esto 
-- nos muestra que servicios usan que componentes y que tanto, util para administrar correctamente 
-- el inventario

CREATE VIEW ProductoMasConsumido AS
SELECT 
	S.nombre AS NombreServicio
    ,p.Nombre AS NombreProducto
    ,SUM(PC.cantidad) AS CantidadUsada
FROM Producto P
INNER JOIN ProductoConsumido PC ON P.idProducto = PC.idProducto
INNER JOIN ServicioAtencion SA ON SA.IdAtencion = PC.IdAtencion
INNER JOIN Servicio S ON S.IdServicio = SA.IdServicio
GROUP BY S.Nombre, P.Nombre;


-- La siguiente vista muestra la cantidad de productos vendidos por empleado
-- ordenados de mayor a menor 

CREATE VIEW VentasPorEmpleado AS
SELECT 
	p.Cedula
    ,p.Nombre AS "Nombre empleado"
    ,SUM(pc.Cantidad) AS "Productos vendidos"
FROM Persona P
INNER JOIN empleado E ON P.Cedula = E.idEmpleado
INNER JOIN factura F ON E.idEmpleado = F.idEmpleado
INNER JOIN facturaproductocompra FPC ON F.idFactura = FPC.IdFactura
INNER JOIN productocompra PC ON PC.idCompra = FPC.IdCompraProducto
GROUP BY p.Cedula, p.Nombre
ORDER BY SUM(pc.Cantidad) DESC;

SELECT * FROM ProductoMasConsumido
/*
	Esta vista se creo con la intencion de mostrar los productos comprados por un cliente, el precio, el producto y la cantidad total
    tiene la intencion de simular una factura de simplemente los productos comprados
*/
CREATE VIEW factura_productos_comprados AS 
SELECT 
	F.idFactura
    ,PCli.nombre AS "Nombre Cliente"
    ,PE.nombre AS "Nombre Empleado"
    ,HS.Fecha
    ,P.Nombre AS "Nombre Producto"
    ,PC.Cantidad AS "Cantidad Producto Comprada"
    ,P.Precio AS "Precio Por unidad"
    ,PC.Cantidad * P.Precio AS "Total Compra"
FROM Factura F 
INNER JOIN historialservicio HS ON HS.idFactura = F.idFactura
INNER JOIN facturaproductocompra FPC ON F.idFactura = FPC.idFactura
INNER JOIN Persona AS PE ON PE.cedula = F.idEmpleado
INNER JOIN Persona AS PCli ON PCli.cedula = F.idCliente
INNER JOIN productocompra PC ON PC.idCompra = FPC.IdCompraProducto
INNER JOIN producto P ON P.idProducto = PC.idProducto
ORDER BY 1;


/*
	Esta vista tiene la finalidad de simular una factura con los servicios adquiridos, la cantidad, precio y monto total
    esta vista sirve para reflejar el gasto de un cliente simplemente incluyendo los servicios
*/
CREATE VIEW factura_servicios_consumidos 
AS 
SELECT 
	F.idFactura
    ,PCli.nombre AS "Nombre Cliente"
    ,PE.nombre AS "Nombre Empleado"
    ,HS.Fecha
    ,S.Nombre AS "Nombre Servicio"
    ,SA.Cantidad AS "Cantidad Servicio Adquirido"
    ,S.Precio AS "Precio Servicio"
    ,SA.Cantidad * S.precio AS "Total Servicio Adquirido"
FROM Factura F 
INNER JOIN historialservicio HS ON HS.idFactura = F.idFactura
INNER JOIN Persona AS PE ON PE.cedula = F.idEmpleado
INNER JOIN Persona AS PCli ON PCli.cedula = F.idCliente
INNER JOIN facturaservicioatencion FSA ON F.idFactura = FSA.IdFactura
INNER JOIN servicioatencion SA ON SA.IdAtencion = FSA.IdAtencion
INNER JOIN servicio S ON S.idServicio = SA.idServicio
ORDER BY 1;



/*
	Esta vista tiene la finalidad de simular el precio total de los productos y servicios adquiridos por cada cliente
    Trabaja en conjunto con las 2 anteriores vistas 
*/
CREATE VIEW `factura_servicios_productos_comprados_consumidos` 
AS  
SELECT 
	FPC.IdFactura
    ,FPC.`Nombre Cliente`
    ,FPC.`Nombre Empleado`
    ,SUM(FPC.`Total Compra` + FSC.`Total Servicio Adquirido`) AS "Monto Total"
FROM factura_servicios_consumidos FSC 
INNER JOIN factura_productos_comprados FPC ON FSC.IdFactura = FPC.IdFactura
GROUP BY FPC.IdFactura














