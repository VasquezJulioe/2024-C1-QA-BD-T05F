package com.sofkau.integration.database;

import java.sql.ResultSet;
import java.sql.SQLException;

public interface DataBase {

    public void configureDataBaseConnection();

    public void executeSqlStatement();

    public void executeSqlStatementVoid();

    public ResultSet getResulset();

    public void close();

    public void printResulset()throws SQLException;
}
