package com.svalero.project.servlet;

import com.svalero.project.dao.Database;
import com.svalero.project.dao.UsuarioDao;
import com.svalero.project.domain.Usuario;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;
import java.util.Optional;

import static java.lang.System.out;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");


        Database database = new Database();
        UsuarioDao userDao = new UsuarioDao(database.getConnection());
        try {
            Optional<Usuario> user = userDao.login(email, password);
            if (user.isPresent()) {
                HttpSession session = request.getSession(true);
                session.setAttribute("currentUser", user.get());
                out.println("Succesful login.");
                response.sendRedirect("index.jsp");
            } else {
                response.sendRedirect("loginincorrect.jsp");
            }
        } catch (SQLException sqle) {
            sqle.printStackTrace();
        }
    }
}
