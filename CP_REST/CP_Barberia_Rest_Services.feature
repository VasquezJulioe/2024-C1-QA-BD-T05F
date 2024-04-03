Feature: Registro e inicio de sesión usando el servicio REST de la Barbería

  Yo como usuario
  Quiero registrarme e iniciar sesión en la página de la barbería usando los servicios REST
  Para comprar los productos que ofrece y consumir sus servicios 
  
  Background: 
    Given El usuario está en Postman con acceso a los servicios de la barbería

  @BD
  Scenario: Registro de usuario exitoso
    Given ingreso al servicio de registro de usuario
    When ingresa sus credenciales correctamente 
    And ejecuta la petición POST al servicio
    Then debería recibir un código de respuesta 201
    And el usuario debería quedar guardado en la BD
  
  @BD
  Scenario: inicio de sesion de usuario exitoso 
    Given ingreso al servicio de inicio de sesión de usuario
    When ingresa sus credenciales correctamente
    And ejecuta la petición POST al servicio
    Then se debería recibir un código de respuesta 200
    And se debería guardar el registro de ingreso en la BD 

Feature: Eliminar empleado usando servicio REST de la barberia

    Yo como usuario
    Quiero poder eliminar empleados registrados
    Para limpiar eliminar información obsoleta

  Background: 
        Given El usuario está en Postman con acceso al servicio de eliminar empleado
  @BD
  Scenario: Eliminar empleado exitosamente
    When ingresa correctamente el id del empleado 
    And ejecuta la petición DELETE al servicio
    Then debería recibir un código de respuesta 204 
    And el empleado debería ser removido de la BD
    
## Estos scenarios no tienen que ver con guardar registros en la base de datos, solo usar la información ya guardada
Feature: Consulta de empleados usando servicio REST de la barberia

  Yo como usuario
  Quiero hacer uso del servicio de consulta de empleados 
  Para mirar la lista de personal disponible y su información

  Background: 
    Given El usuario está en Postman con acceso a los servicios de la barbería

  
  Scenario: Consulta de todos los clientes exitosa 
    Given el usuario ingreso al servicio de consulta de todos los empleados 
    When ejecuta la petición GET al servicio 
    Then debería ver la información de todos los empleados 
    And debería obtener un código de respuesta 200

  
  Scenario Outline: Consulta de un cliente exitosa 
    Given el usuario ingreso al servicio de consulta de un empleado por id
    When ingresa correctamente el id <id>
    And ejecuta la petición GET al servicio
    Then debería ver la información del cliente asociado con el id <id> en formato 
    And debería obtener un código de respuesta 200

    Examples:
        | id |
        | 2  |
        | 3  |  

  
  Scenario Outline: Consulta de un cliente fallida 
    Given el usuario ingreso al servicio de consulta de un empleado por id
    When ingresa el id <id> no registrado en la base de datos
    And ejecuta la petición GET al servicio
    Then debería de ver un mensaje de error indicando que el empleado no existe
    And debería obtener un código de respuesta 404

    Examples:
        | id    |
        | 1000  |
        | 2000  |  


Feature: Compra de producto a través de los servicios REST de la barbería 

    Yo como usuario
    Quiero comprar varios productos de la barbería
    Para verme mucho mejor 

  Background: 
    Given El usuario está en Postman con acceso al servicio de compra de la barbería
    
  @BD
  Scenario: Compra exitosa de productos 
    When ingresa los productos de interés correctamente y valida sus credenciales
    And ejecuta la petición POST al servicio
    Then la compra debería ser registrada en la BD
    And se deberían restar los productos disponibles en la BD

Feature: Agendar cita a través de los servicios REST de la barbería 

  Yo como usuario
  Quiero poder agendar citas a la barbería
  Para consumir sus servicios y comprar sus productos 

  Background: 
    Given El usuario está en Postman con acceso al servicio de citas de la barbería
  @BD
  Scenario: Agendar cita exitosamente
    When ingresa correctamente sus credenciales 
    And  ejecuta la petición POST al servicio 
    Then debería recibir un mensaje de confirmaciòn al correo
    And debería quedar registrada la cita en la BD