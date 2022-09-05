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
<html>
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
<script type="text/javascript">
    $(document).ready(function() {
        $("#form1").on("submit", function(event) {
            event.preventDefault();
            var formValue = $(this).serialize();
            $.post("editreview", formValue, function(data) {
                if ($.trim(data) == "/RavensNest/index.jsp") {
                    window.location.href = data;
                } else {
                    $("#result1").html(data);
                }
            });
        });
    });
</script>
<script type="text/javascript">
    $(document).ready(function() {
        $("#form2").on("submit", function(event) {
            event.preventDefault();
            var formValue = $(this).serialize();
            $.post("addreview", formValue, function(data) {
                if ($.trim(data) == "/RavensNest/index.jsp") {
                    window.location.href = data;
                } else {
                    $("#result2").html(data);
                }
            });
        });
    });
</script>
<%
    int idPoema = Integer.parseInt(request.getParameter("idpoema"));
    Database db = new Database();
    PoemaDao poemaDao = new PoemaDao(db.getConnection());
    Poema poema;
    Usuario currentUser = (Usuario) session.getAttribute("currentUser");
    if (currentUser == null) {
        response.sendRedirect("login.jsp");
    }
    try {
        poema = poemaDao.findById(idPoema).get();
%>
<div class="container" style="margin-top: 20px ! important">

    <div class="col-sm-6" style="width:50% ! important; padding-bottom:20px ! important;">
        <div class="card text-center">
            <div class="card-header">
                <p><%= poema.getTitulo()%></p>
            </div>
            <div class="card-body">
                <h5 class="card-title"><%= poema.getAutor().getNombreAutor()%> <%= poema.getAutor().getApellidoAutor()%></h5>
                <h6 class="card-text">Published: <p><%= poema.getFePublicacion()%></p></h6>
                <h6 class="card-text"><%= poema.getDescripcionPoema() %></h6>

            </div>
        </div>
    </div>

    <%
        ReviewDao reviewDao = new ReviewDao(db.getConnection());
        Review review = null;
        try {
            review = reviewDao.findById(idPoema, currentUser.getIdUsuario()).orElseThrow(new Supplier<Throwable>() {
                @Override
                public Throwable get() {
                    return new Exception();
                }
            });
    %>
</div>
<div class="container">
    <h2>Review</h2>
    <!-- Añadir aqui modify y delete -->
    <form id="form1">
        <div class="mb-2">
            <input name="review" type="text" class="form-control w-25" id="review" value="<% out.print(review.getRating()); %>">
            <input name="description" type="text" class="form-control w-25" id="description" value="<% out.print(review.getContenidoReview()); %>">
        </div>
        <input type="hidden" name="idusuario" value="<%=currentUser.getIdUsuario()%>">
        <input type="hidden" name="idpoema" value="<%=idPoema%>">
        <button type="submit" class="btn btn-warning">Modify Review</button>
    </form>
    <div id="result1"></div>
</div>
<%
} catch (Exception e) {
%>
<form id="form2">
    <div class="mb-2">
        <label for="newreview" class="form-label">Review:</label>
        <input name="newreview" type="text" class="form-control w-25" id="newreview" value="Rating">
        <input name="newdescription" type="text" class="form-control w-25" id="newdescription" value="Description">
    </div>
    <input type="hidden" name="idusuario" value="<%=currentUser.getIdUsuario()%>">
    <input type="hidden" name="idpoema" value="<%=idPoema%>">
    <button type="submit" class="btn btn-warning">Create Review</button>
</form>
<div id="result2"></div>
<%
    }
%>
</div>
</div>
</div>
<%
} catch (SQLException sqle) {
%>
<div class='alert alert-danger' role='alert'>Something went wrong, please try again in a few minutes.</div>
<%
    }
%>
</body>
</html>
