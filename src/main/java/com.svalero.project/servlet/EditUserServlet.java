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
import java.io.PrintWriter;
import java.sql.SQLException;

@WebServlet("/edituser")
public class EditUserServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        //Comprobar login usuario
        Usuario currentUser = (Usuario) request.getSession().getAttribute("currentUser");
        if (currentUser == null) {
            response.sendRedirect("login.jsp");
        }

        String nombre = request.getParameter("nombre");
        String apellido = request.getParameter("apellido");
        String email = request.getParameter("email");
        String contrasena = request.getParameter("contrasena");
        int idUsuario = currentUser.getIdUsuario();

        Usuario user = new Usuario(nombre, apellido, email, contrasena);

        Database database = new Database();
        UsuarioDao userDao = new UsuarioDao(database.getConnection());
        try {
            userDao.modify(idUsuario, user);

            //Volvemos a asignar el currentuser con los datos de usuario modificados
            HttpSession session = request.getSession(true);
            session.setAttribute("currentUser", userDao.login(nombre, contrasena).get());
            out.println("<br><div class='alert alert-success' role='alert'>User data edited succesfully.</div>");
        } catch (SQLException sqle) {
            out.println("<br><div class='alert alert-danger' role='alert'>Something went wrong. Please try again in a few minutes.</div>");
        }
    }
}
