Feature: Registro e inicio de sesion usando el servicio REST de la Barbería

  Yo como usuario
  Quiero registrarme e iniciar sesion en la pagina de la barbería usando los servicios REST
  Para comprar los productos que ofrece y consumir sus servicios 
  
  Background: 
    Given El usuario está en Postman con acceso a los servicios de la barbería

  @camino_feliz
  Scenario: Registro de usuario exitoso
    Given ingreso al servicio de registro de usuario
    When ingresa sus credenciales correctamente 
    And ejecuta la petición POST al servicio
    Then debería recibir un codigo de respuesta 201
    And debería ver un mensaje con su informacion asociada
    
    Scenario: Ingreso de usuario exitoso 
    Given ingreso al servicio de inicio de sesion de usuario
    When ingresa sus credenciales correctamente
    And ejecuta la petición POST al servicio
    Then debería recibir un codigo de respuesta 200
    And debería ver un token unico para iniciar sesion