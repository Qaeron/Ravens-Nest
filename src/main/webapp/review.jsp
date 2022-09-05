<%@ page import="java.util.Optional" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="com.svalero.project.dao.Database" %>
<%@ page import="com.svalero.project.domain.Autor" %>
<%@ page import="com.svalero.project.dao.AutorDao" %>
<%@ page import="com.svalero.project.domain.Poema" %>
<%@ page import="com.svalero.project.dao.PoemaDao" %>
<%@ page import="com.svalero.project.domain.Usuario" %>
<%@ page import="com.svalero.project.dao.UsuarioDao" %>
<%@ page import="com.svalero.project.domain.Review" %>
<%@ page import="com.svalero.project.dao.ReviewDao" %>
<%@ page import="java.util.function.Supplier" %>
<head>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://kit.fontawesome.com/cc976dc165.js" crossorigin="anonymous"></script>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@100&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="css/general.css">
</head>
<body>
<%
    int reviewId = Integer.parseInt(request.getParameter("idreview"));
    Database db = new Database();
    ReviewDao reviewDao = new ReviewDao(db.getConnection());
    Review review;
    Usuario currentUser = (Usuario) session.getAttribute("currentUser");
    if (currentUser == null) {
        response.sendRedirect("login.jsp");
    }
    try {
        review = reviewDao.findById(reviewId).get();
%>
<div class="container" style="margin-top: 20px ! important">
    <div class="col-sm-6" style="width:50% ! important; padding-bottom:20px ! important;">
        <div class="card text-center">
            <div class="card-header">
                <p><%= review.getPoema().getTitulo()%> reviewed by <%= review.getUsuario().getNombre()%></p>
            </div>
            <div class="card-body">
                <h5 class="card-title"><%= review.getRating()%></h5>
                <h6 class="card-text"><%= review.getContenidoReview() %></h6>
            </div>
        </div>
    </div>
    <%
    } catch (Exception e) {
    }
    %>
</div>
</body>
</html>