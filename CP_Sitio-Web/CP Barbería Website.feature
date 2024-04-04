Feature: Registro usuario
  Yo como usuario del sitio web de la barbería
  Deseo poder registrarme
  Para poder iniciar sesión 

  Background: Usuario en módulo de registro
    Given El usuario está en el módulo de registro

  @happyPath
  Scenario: Registro exitoso
    When El usuario ingresa todos los datos válidos
    Then Se debería almacenar la información del usuario en la BD
    And El usuario debería ser redirigido a home

  @sadPath
  Scenario: Registro no exitoso
    When El usuario ingresa datos no válidos
    Then No se debería almacenar la información del usuario en la BD
    And El usuario debería ver un mensaje de error

Feature: Inicio de sesión
  Yo como usuario registrado del sitio web de la barbería
  Deseo poder iniciar sesión
  Para no tener que ingresar de nuevo mis datos personales al pedir una cita

  Background: Usuario en módulo de inicio de sesión
    Given El usuario está en el módulo de inicio de sesión

  @happyPath
  Scenario: Inicio sesión exitoso
    When El usuario ingresa correo y contraseña válidos
    Then Se debería almacenar la información de nuevo inicio de sesión del usuario en la BD
    And El usuario debería ser redirigido a home

  @sadPath
  Scenario: Inicio sesión no exitoso
    When El usuario ingresa correo y/o contraseña no válidos
    Then No se debería almacenar la información de nuevo inicio de sesión en la BD
    And El usuario debería ver un mensaje de error

Feature: Agendar cita
  Yo como usuario del sitio web de la barbería
  Deseo poder agendar una cita
  Para poder hacer uso de los servicios de la barbería

  Background: Usuario en módulo de citas
    Given El usuario se encuentra en el módulo de agendas de citas

  @happyPath
  Scenario: Agendar cita - exitosa
    When El usuario ingresa los campos válidos requeridos en el formulario
    Then Se debería crear un nuevo registro de citas con la información del usuario en la BD
    And Se debería mostrar un mensaje de cita creada al usuario

  @sadPath
  Scenario: Agendar cita - no exitosa
    When El usuario ingresa campos no válidos requeridos en el formulario
    Then No se debería crear un nuevo registro de citas en la BD
    And El usuario debería ver un mensaje de error
