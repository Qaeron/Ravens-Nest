package com.svalero.project.servlet;

import com.svalero.project.dao.Database;
import com.svalero.project.dao.UsuarioDao;
import com.svalero.project.domain.Usuario;
import com.svalero.project.exception.EmailAlreadyExistException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

@WebServlet("/register")
public class AddUserServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        String nombre = request.getParameter("nombre");
        String apellido = request.getParameter("apellido");
        String email = request.getParameter("email");
        String contrasena = request.getParameter("contrasena");
        Usuario user = new Usuario(nombre, apellido, email, contrasena);

        Database database = new Database();
        UsuarioDao userDao = new UsuarioDao(database.getConnection());
        try {
            userDao.add(user);
            out.println("/RavensNest/login.jsp");
        } catch (EmailAlreadyExistException eaee) {
            out.println("<br><div class='alert alert-danger' role='alert'>Email already registered.</div>");
            eaee.printStackTrace();
        } catch (SQLException sqle) {
            out.println("<br><div class='alert alert-danger' role='alert'>Something wrong happened. Please check again in a few minutes.</div>");
            sqle.printStackTrace();
        }
    }
}
