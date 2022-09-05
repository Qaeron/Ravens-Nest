package com.svalero.project.dao;

import com.svalero.project.domain.Autor;
import com.svalero.project.domain.Poema;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Optional;

public class PoemaDao {
    private Connection connection;

    public PoemaDao(Connection connection) {
        this.connection = connection;
    }


    public ArrayList<Poema> findAll() throws SQLException {
        String sql = "SELECT * FROM POEMS ORDER BY title";
        ArrayList<Poema> poems = new ArrayList<>();

        PreparedStatement statement = connection.prepareStatement(sql);
        ResultSet resultSet = statement.executeQuery();
        while (resultSet.next()) {
            Poema poem = fromResultSet(resultSet);
            poems.add(poem);
        }

        return poems;
    }

    public ArrayList<Poema> findAll(String searchText) throws SQLException {
        String sql = "SELECT * FROM POEMS WHERE INSTR(title, ?) ORDER BY title";
        ArrayList<Poema> poems = new ArrayList<>();

        PreparedStatement statement = connection.prepareStatement(sql);
        statement.setString(1, searchText);
        ResultSet resultSet = statement.executeQuery();
        while (resultSet.next()) {
            Poema poem = fromResultSet(resultSet);
            poems.add(poem);
        }

        return poems;
    }

    public Optional<Poema> findById(int id) throws SQLException {
        String sql = "SELECT * FROM POEMS WHERE id_poem = ?";
        Poema poem = null;

        PreparedStatement statement = connection.prepareStatement(sql);
        statement.setInt(1, id);
        ResultSet resultSet = statement.executeQuery();
        if (resultSet.next()) {
            poem = fromResultSet(resultSet);
        }

        return Optional.ofNullable(poem);
    }

    private Poema fromResultSet(ResultSet resultSet) throws SQLException {
        Poema poem = new Poema();
        poem.setIdPoema(resultSet.getInt("id_poem"));
        AutorDao autorDao = new AutorDao(connection);
        int idAutor = resultSet.getInt("id_author");
        Autor autor = autorDao.findById(idAutor).get();
        poem.setAutor(autor);
        poem.setTitulo(resultSet.getString("title"));
        poem.setFePublicacion(resultSet.getDate("publish_date"));
        poem.setDescripcionPoema(resultSet.getString("poem_description"));
        return poem;
    }
}
