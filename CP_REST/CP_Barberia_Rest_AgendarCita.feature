Feature: Agendar cita a través de los servicios REST de la barbería 

  Yo como usuario
  Quiero poder agendar citas a la barbería
  Para consumir sus servicios y comprar sus productos 

  Background: 
    Given El usuario está en Postman con acceso a los servicios de la barbería

  Scenario: Agendar cita exitosamente
    Given el usuario ingreso al servicio de agendar cita
    When ingresa correctamente sus credenciales 
    And  ejecuta la petición POST al servicio 
    Then debería obtener un código de respuesta 200
    And debería quedar registrada la cita en la BD
