Feature: Comprar de producto a traves de los servicios REST de la barbería 

    Yo como usuario
    Quiero comprar varios productos de la barbería
    Para verme mucho mejor 

  Background: 
    Given El usuario está en Postman con acceso a los servicios de la barbería
    
  Scenario: Compra exitosa de productos 
    Given el usuario ingreso al servicio de compra de productos de la barbería
    When ingresa los productos de interes y su cantidad correctamente
    And ingresa sus credenciales correctamente y ejecuta la petición POST al servicio
    Then debería recibir un codigo de respuesta 200
    And la compra seria registrada en la BD
    And se restarian los productos disponibles en la BD

