# Reto BD

**Barbería (Ejercicio A)**

Una barbería desea llevar el control de sus empleados y de sus clientes así como

de los servicios que se prestan. Se desea almacenar la siguiente información:

- Empleados: ID,cedula,Nombre, Especialidad (Masaje, Corte, Cejas, etc.)
- Clientes: Datos personales (ID,cedula,Nombre, Profesión, Teléfono, correo, edad y Dirección).
- Historial de Servicios prestados por la barbería: Un registro para saber información del servicio prestado por un empleado a un cliente, productos consumidos, duración del procedimiento y fecha.
- Citas: Fecha y Hora en la que se cita al cliente yel barberoque realizará el servicio.
- Productos vendidos por la barbería: REF, Nombre, Cantidad y Precio.
- Proveedor: los productos vendidos deben tener una fuente.
- Registro de Ventas : Si un barbero vende un producto a un cliente, termina obteniendo una “liga” ganancia ocasional.

**ZOO (Ejercicio B)**

El parque zoo santafe “parque de la conservación” quiere registrar en una base de datos el consumo de alimentos por los animales que tiene en su sede.

Usted acaba de hablar con el administrador y el le comenta que tienen una clasificación para los animales (mamiferos, aves, anfibios, peces y reptíles) de los cuales usted debe seleccionar 3 para el MVP.

- Tierragro empresa de alimentos para diferentes especies es uno de los 5 proveedores del parque, pero se esperan que almenos lleguen 10 nuevos proveedores.
- Dentro del parque hay varios roles para las personas, empleados cuidadores, empleados logisticos, empleados veterinarios, empleados entrenadores, visitantes.
- El veterinario esta encargado de realizar consultas a sus especies y de diseñar la dieta de cada especie.
- El alimento de cada especie es diferente y tiene una dosis y un tipo (humeda, seca, etc).
- Uno de los roles de empleado del Zoo debe contactarse con el proveedor para solicitar alimentos y debe asear cada una de las hábitas de las especies.
- El proveedor recibe una orden de compra revisa que tenga todo el alimento que le piden y con el genera una factura, a final de mes el gerente del Zoo consulta las facturas que debe a sus distintos proveedores y genera su pago correspondiente.
- Los empleados entrenadores son los encargados de llevar el peso de cada especie e informar a un veterinario en que condición están.
- El alimento es una entidad fuerte y debe contener sus características.

**Tienda Virtual Don pepe (Ejercicio C)**

Don pepe quiere que sus clientes puedan realizar compras desde sus casas. El junto a su esposa tienen una cantidad domiciliarios conocidos que se encargan de llevar los pedidos a los clientes.

A continuación se muestra la conversación que se tuvo con don pepe:

- ¡Veee mijo! yo quiero que mas gente me compre los producticos, cuando llegá un vecino nuevo a la cuadra yo lo apunto en un cuadernito. Entiendo don pepe, y no le gustaría que le comprarán por internet?
- Ehhh mijo pues no es mala idea y que hago con mi clientela?
- Pues don pepe hacemos un video tutorial para usar la aplicación, y le pedimos una información a sus clientes indicando sus datos personales (ID, cedula, Nombre, Dirección, Teléfono, email y password) a través de un formulario de registro. Una vez registrado podrá acceder a la realización de pedidos con su email y su password.
- ¡ eeeee yo no te creo! Asi de fácil? Como motilando calvos?
- Don pepe ojala fuera así de sencillo dejeme le cuento mejor, Los productos que oferta el supermercado deben estar divididos en diversas categorías. Los datos necesarios para cada categoría son: nombre de la categoría, condiciones de almacenamiento (frío, congelado, seco) y observaciones. Tambien debemos detallar la información de los productos (nombre, marca, origen, dimensiones (volumen y peso), una fotografía, la categoría y unidades disponibles).¡ no mijo eso me va salir muy caro con tanto detalle!
- don pepe todo lo contrario va aumentar mucho sus ganancias espereme le cuento algo mas, la aplicación permitirá visualizar un listado de productos ordenado por categoría, permitiendo seleccionar los productos que desee comprar mediante una caja de texto donde se indicará el número de unidades seleccionadas. La aplicación llevará la cuenta (cesta de la compra) de los productos que el cliente ha ido seleccionando. La aplicación permitirá también efectuar un pedido con todos los productos que lleve almacenados en su cesta de la compra. Los datos del pedido son: código del pedido, fecha del pedido, cliente, dirección de entrega, productos pedidos, importe total del pedido y datos de pago (número de tarjeta y fecha de caducidad)®.

Para poder generar un pedido se deberán dar dos situaciones:

- El cliente deberá pertenecer a una zona (Código Postal) donde existan domiciliarios. Un domiciliario se identifica mediante un nombre, número de matrículade la furgoneta y zona donde reparte.
- Debe haber unidades suficientes por cada producto para satisfacer las demandas de cada pedido.

Una vez generado el pedido se mostrará al usuario una página con los datos de su pedido, se restarán del stock las unidades pedidas y se emitirá una nota de entrega a los responsables de almacén para que sirvan ese pedido.

## Se pide:

- Indicar que ejercicio fue asignado
- Realizar el modelo E-R
- Realizar el modelo relacional
- Normalizar correctamente
- Escribir con sentencias SQL toda la definición de la base de datos.
- Escribir consultas que me permitan ver la información de cada tabla o de varias tablas (10).
- Generar de 4 a 6 vistas donde se evidencie lo más importante de cada ejercicio (haga una selección muy responsable de la información realmente importante según el contexto).
- Generar al menos 4 procedimientos almacenados.
- Buscar una página web y un servicio de tipo rest que represente el módelo que usted realizo.
- Realizar un plan de calidad, una matriz de riesgo
- Realizar 10 escenarios de prueba que incluyan consultas a la base de datos.
- Generar al menos 2 triggers
- Poblar la base de datos (50 registros por tabla) utilizando una conexión desde Java.
- Al terminar el ejercicio responda ¿ Está conforme con el resultado obtenido según el contexto o cree que hubiera obtenido un mejor resultado con una base de datos no relacional?
- documente muy bien su proceso (paso a paso) en un archivo PDF escriba todas las aclaraciónes o especificaciones necesarias para realizar el ejercicio.