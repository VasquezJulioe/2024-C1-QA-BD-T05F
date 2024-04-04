package com.crismor;

import com.github.javafaker.Faker;

import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

public class Main {

    private static final String URL = "jdbc:mysql://localhost:3306/barberia";
    private static final String USER = "root";
    private static final String PASSWORD = "0000";

    private static Connection conn;
    private static Faker faker = new Faker();

    public static void main(String[] args) throws SQLException {

//        System.out.println(faker.numerify("###"));
//        System.out.println("Hola mundo");

        conn = connect();
        insertIntoPersona();
        insertIntoTelefono();
        insertIntoCliente();
        insertIntoEmpleado();
        insertIntoProveedor();
        insertIntoServicio();
        insertIntoEspecialidad();
//        selectAllFromPersona();
        conn.close();
//        closeConnection();

    }

//    Foreign keys

    static ArrayList<String> cedulasPersonas = new ArrayList<String>();
    static ArrayList<String> serviciosIds = new ArrayList<String>();
    static ArrayList<String> especialidadesIds = new ArrayList<String>();

    static String[] profesiones = {
            "Abogado",
            "QA",
            "Arquitecto",
            "Electrico",
            "Ingeniero",
            "Tester",
            "Medico",
            "Empresario",
            "Anestesiologo",
            "Electronico",
            "Juez",
            "Fiscal",
            "Contador",
            "Conductor",
            "Enfermera",
            "Soldador",
            "Emprendedor",
            "Independiente",
            "Medico",
            "Electronico",
            "Desarrollador"
    };

    static String[] nombresServicios = new String[]{
            "Corte de cabello masculino",
            "Corte de cabello femenino",
            "Afeitado de barba",
            "Tratamiento facial",
            "Depilación de cejas",
            "Manicura",
            "Pedicura",
            "Masaje capilar",
            "Tinte de cabello",
            "Alisado de cabello",
            "Mascarilla facial",
            "Corte de cabello alegre",
            "Afeitado de barba + cejas",
            "Tratamiento facial + barba",
            "Rand Honors",
            "Manicura + pedicura",
            "Decoloración y Tinte de Cabello",
            "Masaje general",
            "Tinte de barba",
            "Corte + barba + cejas",
            "Corte ´cejas"
    };

    static String[] especialidades = new String[]{
            "Corte de cabello",
            "Afeitado de barba",
            "Tratamiento facial",
            "Depilación de cejas",
            "Manicura",
            "Pedicura",
            "Masaje capilar",
            "Tinte de cabello",
            "Alisado de cabello",
            "Peinado para eventos",
            "Corte degradado",
            "Afeitado de barba extrema",
            "Tratamiento facial especial",
            "Depilación de cejas con cera",
            "Manicura + pedicura",
            "Pedicura laser",
            "Masaje general",
            "Tinte de barba",
            "Mascarilla",
            "Mascarilla puntos negros"
    };

    public static Connection connect() {
        Connection conn = null;
        try {
            conn = DriverManager.getConnection(URL, USER, PASSWORD);
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return conn;
    }


    public static void selectAllFromPersona() throws SQLException {
        String sql = "SELECT *  FROM Persona";
        PreparedStatement stmt = conn.prepareStatement(sql);
        stmt.executeUpdate();
    }

    public static void insertIntoPersona() throws SQLException {
        String sql = "INSERT INTO Persona (Cedula, Nombre, Correo, Direccion, FechaNacimiento) " +
                "VALUES (?, ?, ?, ?, ?)";
        PreparedStatement stmt = conn.prepareStatement(sql);
        for (int i = 0; i < 40; i++) {
            // Generate fake data
            String cedula = faker.number().digits(10);
            cedulasPersonas.add(cedula);
            String nombre = faker.name().fullName();
            String correo = faker.internet().emailAddress();
            String direccion = faker.address().streetAddress();
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            Date fechaNacimiento = java.sql.Date.valueOf(sdf.format(faker.date().birthday()));

            // Set values to the prepared statement
            stmt.setString(1, cedula);
            stmt.setString(2, nombre);
            stmt.setString(3, correo);
            stmt.setString(4, direccion);
            stmt.setDate(5, fechaNacimiento);

            // Execute the statement
            stmt.executeUpdate();
        }

    }

    public static void insertIntoTelefono() throws SQLException {
        String sql = "INSERT INTO telefono (idPersona, Telefono) " +
                "VALUES (?, ?)";
        PreparedStatement stmt = conn.prepareStatement(sql);

        for (String cedula : cedulasPersonas) {
            String telephoneNumber = faker.phoneNumber().cellPhone();
            stmt.setString(1, cedula);
            stmt.setString(2, telephoneNumber);

            stmt.executeUpdate();
        }

//        to do: Agregar personas con 2 telefonos

    }

    public static void insertIntoCliente() throws SQLException {
        String sql = "INSERT INTO cliente (idCliente, Profesion) " +
                "VALUES (?, ?)";
        PreparedStatement stmt = conn.prepareStatement(sql);

        int counter = 0;

        for (String profesion : profesiones) {
            String idCliente = cedulasPersonas.get(counter);
            counter++;
            String telephoneNumber = faker.phoneNumber().cellPhone();
            stmt.setString(1, idCliente);
            stmt.setString(2, profesion);

            stmt.executeUpdate();
        }

    }

    public static void insertIntoEmpleado() throws SQLException {
        String sql = "INSERT INTO empleado (idEmpleado, Salario) " +
                "VALUES (?, ?)";
        PreparedStatement stmt = conn.prepareStatement(sql);

        int counter = 0;

        for (String cedula : cedulasPersonas) {
            double salario = faker.number().numberBetween(10000, 50000);
            stmt.setString(1, cedula);
            stmt.setInt(2, (int) salario);

            stmt.executeUpdate();
        }

    }

    public static void insertIntoProveedor() throws SQLException {
        String sql = "INSERT INTO proveedor (idProveedor, Marca) " +
                "VALUES (?, ?)";
        PreparedStatement stmt = conn.prepareStatement(sql);

        for (int i = 0; i < 50; i++){
            String marca = faker.animal().name();
            String idProveedor = faker.number().digits(10);
            stmt.setString(1, idProveedor);
            stmt.setString(2, marca);
            // System.out.println(idProveedor + " " + marca);
            stmt.executeUpdate();
        }

    }

    public static void insertIntoServicio() throws SQLException {
        String sql = "INSERT INTO servicio (idServicio, Nombre, Precio, Duracion) " +
                "VALUES (?, ?, ?, ?)";
        PreparedStatement stmt = conn.prepareStatement(sql);

        for (String nombresServicio : nombresServicios){
            String idServicio = faker.number().digits(10);
            serviciosIds.add(idServicio);
            double precio = faker.number().randomDouble(2, 50, 500);

            // Generar una duración aleatoria entre 15 y 120 minutos
            int duracion = faker.number().numberBetween(15, 120);

            stmt.setString(1, idServicio);
            stmt.setString(2, nombresServicio);
            stmt.setFloat(3, (float) precio);
            stmt.setString(4, String.valueOf(duracion));

            stmt.executeUpdate();
        }

    }

    public static void insertIntoEspecialidad() throws SQLException {
        String sql = "INSERT INTO especialidad (idEspecialidad, Especialidad) " +
                "VALUES (?, ?)";
        PreparedStatement stmt = conn.prepareStatement(sql);

        for (String especialidad : especialidades){

            String idEspecialidad = faker.number().digits(10);
            especialidadesIds.add(idEspecialidad);

            stmt.setString(1, idEspecialidad);
            stmt.setString(2, especialidad);


            stmt.executeUpdate();
        }

    }


}