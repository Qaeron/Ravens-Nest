package com.svalero.project.dao;

import com.svalero.project.domain.Poema;
import com.svalero.project.domain.Review;
import com.svalero.project.domain.Usuario;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Optional;

public class ReviewDao {
    private Connection connection;

    public ReviewDao(Connection connection) {
        this.connection = connection;
    }

    public void add(int rating, String description, int idPoema, int idUsuario) throws SQLException {

        String sql = "INSERT INTO REVIEWS (id_poem, id_user, review_rating, review_content) VALUES (?, ?, ?, ?)";

        PreparedStatement statement = connection.prepareStatement(sql);
        statement.setInt(1, idPoema);
        statement.setInt(2, idUsuario);
        statement.setInt(3, rating);
        statement.setString(4, description);
        statement.executeUpdate();
    }


    public ArrayList<Review> findAll() throws SQLException {
        String sql = "SELECT * FROM REVIEWS ORDER BY review_rating";
        ArrayList<Review> reviews = new ArrayList<>();

        PreparedStatement statement = connection.prepareStatement(sql);
        ResultSet resultSet = statement.executeQuery();
        while (resultSet.next()) {
            Review review = fromResultSet(resultSet);
            reviews.add(review);
        }

        return reviews;
    }

    public ArrayList<Review> findAll(String searchText) throws SQLException {
        String sql = "SELECT * FROM REVIEWS WHERE INSTR(review_content, ?) ORDER BY user_name";
        ArrayList<Review> reviews = new ArrayList<>();

        PreparedStatement statement = connection.prepareStatement(sql);
        statement.setString(1, searchText);
        ResultSet resultSet = statement.executeQuery();
        while (resultSet.next()) {
            Review review = fromResultSet(resultSet);
            reviews.add(review);
        }

        return reviews;
    }

    /*
    public Optional<Review> findByX(String x) throws SQLException {
        String sql = "SELECT * FROM REVIEWS WHERE X = ?";
        Review review = null;

        PreparedStatement statement = connection.prepareStatement(sql);
        statement.setString(1, x);
        ResultSet resultSet = statement.executeQuery();
        if (resultSet.next()) {
            review = fromResultSet(resultSet);
        }

        return Optional.ofNullable(review);
    }
     */

    public Optional<Review> findById(int id) throws SQLException {
        String sql = "SELECT * FROM REVIEWS WHERE id_review = ?";
        Review review = null;

        PreparedStatement statement = connection.prepareStatement(sql);
        statement.setInt(1, id);
        ResultSet resultSet = statement.executeQuery();
        if (resultSet.next()) {
            review = fromResultSet(resultSet);
        }

        return Optional.ofNullable(review);
    }

    public Optional<Review> findById(int id_poema, int id_usuario) throws SQLException {
        String sql = "SELECT * FROM VALORACIONES WHERE id_poem = ? AND id_user = ?";
        Review review = null;

        PreparedStatement statement = connection.prepareStatement(sql);
        statement.setInt(1, id_poema);
        statement.setInt(2, id_usuario);
        ResultSet resultSet = statement.executeQuery();
        if (resultSet.next()) {
            review = fromResultSet(resultSet);
        }

        return Optional.ofNullable(review);
    }

    private Review fromResultSet(ResultSet resultSet) throws SQLException {
        Review review = new Review();
        review.setIdReview(resultSet.getInt("id_review"));
        PoemaDao poemaDao = new PoemaDao(connection);
        int idPoema = resultSet.getInt("id_poem");
        Poema poema = poemaDao.findById(idPoema).get();
        review.setPoema(poema);
        UsuarioDao usuarioDao = new UsuarioDao(connection);
        int idUsuario = resultSet.getInt("id_user");
        Usuario usuario = usuarioDao.findById(idUsuario).get();
        review.setUsuario(usuario);
        return review;
    }
}

