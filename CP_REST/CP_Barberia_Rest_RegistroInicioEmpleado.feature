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
    And debería ver un mensaje con su información asociada
    And el usuario quedaría guardado en la BD
  
  @BD
  Scenario: Ingreso de usuario exitoso 
    Given ingreso al servicio de inicio de sesión de usuario
    When ingresa sus credenciales correctamente
    And ejecuta la petición POST al servicio
    Then se debería recibir un código de respuesta 200
    And debería ver un token único para iniciar sesión
    And se guardaria el registro de ingreso en la BD 
