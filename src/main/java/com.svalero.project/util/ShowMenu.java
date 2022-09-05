package com.svalero.project.util;

import com.svalero.project.dao.Database;

import java.sql.Connection;

public class ShowMenu {
    private Database database;
    private Connection connection;

    public void connect(){
        database = new Database();
        connection = database.getConnection();
    }

    public void showMenu() { connect();}
}
