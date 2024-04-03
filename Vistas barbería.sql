-- La siguiente vista muestra a los empleados con cantidad de servicios ordenados 
-- de mayor a menor cantidad. Le permite al administrador de la barbería ver
-- cuáles empleados son los que más trabajan 

CREATE VIEW ServiciosPorEmpleados AS
SELECT e.idEmpleado, f.idCliente, COUNT(sa.idServicio) AS 'Servicios totales'
FROM empleado e
INNER JOIN factura f ON e.idEmpleado = f.idEmpleado
INNER JOIN servicioatencion sa ON f.idElemento = sa.idAtencion
GROUP BY e.idEmpleado, f.idCliente
ORDER BY COUNT(sa.idServicio) DESC;

-- La siguiente vista muestra los productos más consumidos en los servicios y la
-- cantidad de servicios en los que aparece

CREATE VIEW ProductoMasConsumido AS
SELECT p.Nombre, COUNT(pc.idProducto) AS 'Cantidad servicios', SUM(pc.Cantidad) AS 'Consumo total'
FROM Producto p
JOIN ProductoConsumido pc ON p.idProducto = pc.idProducto
GROUP BY p.Nombre
ORDER BY SUM(pc.Cantidad) DESC;


-- La siguiente vista muestra la cantidad de productos vendidos por empleado
-- ordenados de mayor a menor 

CREATE VIEW VentasPorEmpleado AS
SELECT p.Cedula, p.Nombre AS "Nombre empleado", SUM(pc.Cantidad) AS "Productos vendidos"
FROM persona p
JOIN empleado e ON p.Cedula = e.idEmpleado
JOIN factura f ON e.idEmpleado = f.idEmpleado
JOIN productocompra pc ON f.idElemento = pc.idCompra
GROUP BY p.Cedula, p.Nombre
ORDER BY SUM(pc.Cantidad) DESC;


/*
	Esta vista se creo con la intencion de mostrar los productos comprados por un cliente, el precio, el producto y la cantidad total
    tiene la intencion de simular una factura de simplemente los productos comprados
*/
CREATE VIEW factura_productos_comprados AS 
SELECT 
    F.idFactura,
    PC.idCompra,
    PCli.nombre     AS nombreCliente,
    PE.nombre       AS nombreEmpleado,
    PCli.Correo     AS correoCliente,
    PCli.Direccion  AS direccionCliente,
    PR.nombre 		AS nombreProducto,
    PR.Precio 		AS precioProducto,
    PC.Cantidad 	AS cantidadComprada,
    PC.Total 		AS valorTotal
FROM factura AS F
INNER JOIN productocompra AS PC ON F.idElemento = PC.idCompra
INNER JOIN Persona AS PE ON PE.cedula = F.idEmpleado
INNER JOIN Persona AS PCli ON PCli.cedula = F.idCliente
INNER JOIN Producto AS PR ON PC.idProducto = PR.idProducto;


/*
	Esta vista tiene la finalidad de simular una factura con los servicios adquiridos, la cantidad, precio y monto total
    esta vista sirve para reflejar el gasto de un cliente simplemente incluyendo los servicios
*/
CREATE VIEW factura_servicios_consumidos 
AS 
SELECT     
	F.idFactura,
    SA.idAtencion,
    PCli.nombre     AS nombreCliente,
    PE.nombre       AS nombreEmpleado,
    PCli.Correo     AS correoCliente,
    PCli.Direccion  AS direccionCliente,
    S.nombre 		AS nombreServicio,
    S.Precio 		AS precioServicio,
    SA.Cantidad 	AS cantidadConsumida,
    SA.Total 		AS valorTotal
FROM factura AS F
INNER JOIN servicioatencion AS SA ON F.idElemento = SA.idAtencion
INNER JOIN Persona AS PE ON PE.cedula = F.idEmpleado
INNER JOIN Persona AS PCli ON PCli.cedula = F.idCliente
INNER JOIN servicio AS S ON S.idServicio = SA.idServicion;



/*
	Esta vista tiene la finalidad de simular una factura total, incluyendo los servicios adquiridos y los productos comprados, juntandolo todo
    en una consulta, resulta factible cuando un cliente consumio varios servicios 
    y aparte compro varios productos
*/
CREATE VIEW `factura_servicios_productos_comprados_consumidos` 
AS  
SELECT 
    F.idFactura,
    PC.idCompra AS idOperacion,
    PCli.nombre AS nombreCliente,
    PE.nombre AS nombreEmpleado,
    PCli.Correo AS correoCliente,
    PCli.Direccion AS direccionCliente,
    PR.nombre AS nombreProducto,
    PR.Precio AS precioProducto,
    PC.Cantidad AS cantidadComprada,
    PC.Total AS valorTotal
FROM factura AS F
INNER JOIN productocompra AS PC ON F.idElemento = PC.idCompra
INNER JOIN Persona AS PE ON PE.cedula = F.idEmpleado
INNER JOIN Persona AS PCli ON PCli.cedula = F.idCliente
INNER JOIN Producto AS PR ON PC.idProducto = PR.idProducto

UNION ALL

SELECT     
    F.idFactura,
    SA.idAtencion AS idOperacion,
    PCli.nombre AS nombreCliente,
    PE.nombre AS nombreEmpleado,
    PCli.Correo AS correoCliente,
    PCli.Direccion AS direccionCliente,
    -- SA.idAtencion AS idAtencion,
    S.nombre AS nombreProducto,
    S.Precio AS precioProducto,
    SA.Cantidad AS cantidadConsumida,
    SA.Total AS valorTotal
FROM factura AS F
INNER JOIN servicioatencion AS SA ON F.idElemento = SA.idAtencion
INNER JOIN Persona AS PE ON PE.cedula = F.idEmpleado
INNER JOIN Persona AS PCli ON PCli.cedula = F.idCliente
INNER JOIN servicio AS S ON S.idServicio = SA.idServicion;














