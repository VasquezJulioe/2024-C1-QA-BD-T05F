package com.crismor;

import com.github.javafaker.Faker;

import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

public class Main {

    private static final String URL = "jdbc:mysql://localhost:3306/barberia";
    private static final String USER = "root";
    private static final String PASSWORD = "johan2233Z.";
    private static Connection conn;
    private static Faker faker = new Faker();

    public static void main(String[] args) throws SQLException {

//        System.out.println(faker.numerify("###"));
//        System.out.println("Hola mundo");

        conn = connect();
        insertIntoPersona();
        insertIntoTelefono();
        insertIntoEmpleado();
        insertIntoProveedor();
//        selectAllFromPersona();
        conn.close();
//        closeConnection();

    }

//    Foreign keys

    static ArrayList<String> cedulasPersonas = new ArrayList<String>();


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
        for (int i = 0; i < 50; i++) {  // Inserting 2 records in this example
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


    }
    public static void insertIntoEmpleado() throws SQLException {
        String sql = "INSERT INTO empleado (idEmpleado, salario) " +
                "VALUES (?, ?)";
        PreparedStatement stmt = conn.prepareStatement(sql);

        for (String cedula : cedulasPersonas.subList(0,5)) {
            String salarioEmpleado = faker.number().digits(6);
            stmt.setString(1, cedula);
            stmt.setString(2, salarioEmpleado);
            stmt.executeUpdate();
        }
    }
    public static void insertIntoProveedor() throws SQLException {
        String sql = "INSERT INTO proveedor (idProveedor, Marca) " +
                "VALUES (?, ?)";
        PreparedStatement stmt = conn.prepareStatement(sql);



        for (int i = 0; i < 50; i++) {
            String marca = faker.animal().name();
            String idProveedor = faker.number().digits(10);
            stmt.setString(1, idProveedor);
            stmt.setString(2, marca);
            stmt.executeUpdate();

        }
    }






}