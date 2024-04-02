Feature: Eliminar empleado de la base de datos usando el servicio REST de la barbería 

    Yo como usuario
    Quiero poder eliminar empleados registrados
    Para limpiar eliminar información obsoleta

    Background: 
        Given El usuario está en Postman con acceso a los servicios de la barbería

    Scenario: Eliminar empleado exitosamente
    Given El usuario ingreso al servicio de eliminar empleado
    When ingresa correctamente el id del empleado 
    And ejecuta la petición DELETE al servicio
    Then debería recibir un código de respuesta 204 
    And el empleado debería ser removido de la BD: 
    

