package com.svalero.project.servlet;

import com.svalero.project.dao.Database;
import com.svalero.project.dao.ReviewDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.Date;

@WebServlet("/addreview")
public class AddReviewServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        int rating = Integer.parseInt(request.getParameter("newreview"));
        String descripcion = request.getParameter("newdescription");
        int idUsuario = Integer.parseInt(request.getParameter("idusuario"));
        int idPoema = Integer.parseInt(request.getParameter("idpoema"));

        Database database = new Database();
        ReviewDao reviewDao = new ReviewDao(database.getConnection());
        try {
            reviewDao.add(rating, descripcion, idPoema, idUsuario);
            out.println("/RavensNest/index.jsp");
        } catch (SQLException sqle) {
            out.println("<br><div class='alert alert-danger' role='alert'>Something wrong happened. Please check again in a few minutes.</div>");
            sqle.printStackTrace();
        }
    }
}
