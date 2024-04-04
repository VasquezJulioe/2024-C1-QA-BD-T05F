package com.sofkau;

import com.github.javafaker.Faker;
import com.sofkau.integration.database.mysql.MySqlOperation;

import java.security.spec.RSAOtherPrimeInfo;
import java.sql.SQLException;

public class Main {

    private static final String SERVER = "localhost";
    private static final String DATA_BASE_NAME = "barberia";
    private static final String USER = "root";
    private static final String PASSWORD = "1234";

    private static final String SELECT_ALL_FROM_PERSONA = String.format("select * from %s.Persona", DATA_BASE_NAME);
    private static final String INSERT_TELEFONO = "insert into barberia.telefono values ('1111111111', '222-1234');";
    private static final MySqlOperation mySqlOperation = new MySqlOperation();

    public static void main(String[] args) throws SQLException {
  /*      openConnection();
        insertIntoLibro();
        selectAllFromLibro();
        closeConnection();*/

        Faker faker = new Faker();
        System.out.println(faker.numerify("###"));
        System.out.println("Hola mundo");

        openConnection();
        selectAllFromPersona();
        insertIntoTelefono();
        closeConnection();


    }

    public static void openConnection() {
        mySqlOperation.setServer(SERVER);
        mySqlOperation.setDataBaseName(DATA_BASE_NAME);
        mySqlOperation.setUser(USER);
        mySqlOperation.setPassword(PASSWORD);
    }

    public static void selectAllFromPersona() throws SQLException {
        mySqlOperation.setSqlStatement(SELECT_ALL_FROM_PERSONA);
        mySqlOperation.executeSqlStatement();
        mySqlOperation.printResulset();
    }

    public static void insertIntoTelefono() throws SQLException {
        mySqlOperation.setSqlStatement(INSERT_TELEFONO);
        mySqlOperation.executeSqlStatementVoid();
        mySqlOperation.printResulset();

    }

    public static void closeConnection() {
        mySqlOperation.close();
    }
}