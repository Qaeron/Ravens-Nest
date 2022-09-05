<%@ page import="com.svalero.project.dao.Database" %>
<%@ page import="com.svalero.project.domain.Usuario" %>
<%@ page import="java.util.List" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="com.svalero.project.dao.UsuarioDao" %>
<%@ page import="com.svalero.project.dao.PoemaDao" %>
<%@ page import="com.svalero.project.domain.Poema" %>
<%@ page import="com.svalero.project.dao.AutorDao" %>
<%@ page import="com.svalero.project.domain.Autor" %>
<%@ page import="org.apache.commons.lang.StringUtils" %>
<%
    Usuario currentUser = (Usuario) session.getAttribute("currentUser");
    if (currentUser == null) {
        response.sendRedirect("login.jsp");
    }
%>

<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://kit.fontawesome.com/cc976dc165.js" crossorigin="anonymous"></script>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@100&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="css/general.css">
</head>
<body>
<div class="container">
    <h2>Watch the verses unravel before you (List of Poems)</h2>

    <div class="container-fluid" style="margin:0 auto; margin-bottom:30px ! important">
        <form class="d-flex" method="post" action="poemas.jsp">
            <input class="form-control me-2" name="searchtext" id="searchtext" type="search" placeholder="Search poems by title" aria-label="Search">
            <a class="btn btn-warning" type="submit">Search</a>
        </form>
    </div>
    <div class="row">

        <ul class="list-group">
            <%
                String searchText = request.getParameter("searchtext");
                searchText = StringUtils.lowerCase(searchText);
                Database database = new Database();
                PoemaDao poemaDao = new PoemaDao(database.getConnection());

                if (searchText == null) {
                    try {
                        List<Poema> poemas = poemaDao.findAll();
                        for (Poema poema: poemas) {
            %>
            <li class="list-group-item" style="width: 50% ! important">
                <a target="_blank" href="poema.jsp?idpoema=<%= poema.getIdPoema() %>"><%= poema.getTitulo() %> | </a>
                <p><%= poema.getAutor().getNombreAutor() %> <%= poema.getAutor().getApellidoAutor() %> | </p>
            </li>
            <%
                }
            } catch (SQLException sqle) {
            %>
            <div class="alert alert-danger" role="alert">
                Something went wrong, please try again in a few minutes.
            </div>
            <%
                }
            } else {
                // Acceder a la bbdd y recuperar todos los poemas filtrados por buscador
                try {
                    List<Poema> poemas = poemaDao.findAll(searchText);
                    for (Poema poema: poemas) {
            %>
            <li class="list-group-item" style="width: 50% ! important">
                <a target="_blank" href="poema.jsp?idpoema=<%= poema.getIdPoema() %>"></a>
                <p><%= poema.getAutor().getNombreAutor() %> <%= poema.getAutor().getApellidoAutor() %> | </p>
            </li>
            <%
                }
            } catch (SQLException sqle) {
            %>
            <div class="alert alert-danger" role="alert">
                Something went wrong, please try again in a few minutes.
            </div>
            <%
                    }
                }
            %>
        </ul>
    </div>
</div>
</body>
</html>