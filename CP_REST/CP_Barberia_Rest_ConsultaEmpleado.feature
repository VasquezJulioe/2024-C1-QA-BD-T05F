## Estos scenarios no tienen que ver con guardar registros en la base de datos, solo usar la información ya guardada
Feature: Consulta de clientes usando el servicio REST de la barbería

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

  @Excepción
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
