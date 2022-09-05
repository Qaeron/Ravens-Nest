package com.svalero.project.dao;

import com.svalero.project.domain.Autor;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Optional;

public class AutorDao {
    private Connection connection;

    public AutorDao(Connection connection) {
        this.connection = connection;
    }


    public ArrayList<Autor> findAll() throws SQLException {
        String sql = "SELECT * FROM AUTHORS ORDER BY author_name";
        ArrayList<Autor> authors = new ArrayList<>();

        PreparedStatement statement = connection.prepareStatement(sql);
        ResultSet resultSet = statement.executeQuery();
        while (resultSet.next()) {
            Autor author = fromResultSet(resultSet);
            authors.add(author);
        }

        return authors;
    }

    public ArrayList<Autor> findAll(String searchText) throws SQLException {
        String sql = "SELECT * FROM AUTHORS WHERE INSTR(author_name, ?) ORDER BY author_name";
        ArrayList<Autor> authors = new ArrayList<>();

        PreparedStatement statement = connection.prepareStatement(sql);
        statement.setString(1, searchText);
        ResultSet resultSet = statement.executeQuery();
        while (resultSet.next()) {
            Autor author = fromResultSet(resultSet);
            authors.add(author);
        }

        return authors;
    }

    public Optional<Autor> findById(int id) throws SQLException {
        String sql = "SELECT * FROM AUTHORS WHERE id_author = ?";
        Autor author = null;

        PreparedStatement statement = connection.prepareStatement(sql);
        statement.setInt(1, id);
        ResultSet resultSet = statement.executeQuery();
        if (resultSet.next()) {
            author = fromResultSet(resultSet);
        }

        return Optional.ofNullable(author);
    }

    private Autor fromResultSet(ResultSet resultSet) throws SQLException {
        Autor author = new Autor();
        author.setIdAutor(resultSet.getInt("id_author"));
        author.setNombreAutor(resultSet.getString("author_name"));
        author.setApellidoAutor(resultSet.getString("author_surname"));
        author.setFeNacimiento(resultSet.getDate("author_birthdate"));
        author.setDescripcionAutor(resultSet.getString("author_description"));
        return author;
    }
}
