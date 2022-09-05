<%@ page language="java"
         contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"

         import="com.svalero.project.domain.Usuario"
%>

<%
    Usuario currentUser = (Usuario) session.getAttribute("currentUser");
    if (currentUser == null) {
        response.sendRedirect("login.jsp");
    }
%>

<html lang="en">
<!--"estilos bootstrap"--><link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<link rel="stylesheet" href="css/general.css">
<script src="https://kit.fontawesome.com/cc976dc165.js" crossorigin="anonymous"></script>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Roboto:wght@100&display=swap" rel="stylesheet">

<body>
<section class="contenedor">
    <h2>Ravens' Nest</h2>

    <div class="card">
        <div class="card-header">
            Poems
        </div>
        <div class="card-body">
            <h5 class="card-title">Display all poems</h5>
            <p class="card-text">Search information of your favorite pieces here</p>
            <a href="poemas.jsp" class="btn btn-warning">See poems</a>
        </div>
    </div>

    <div class="card">
        <div class="card-header">
            Reviews
        </div>
        <div class="card-body">
            <h5 class="card-title">Display all reviews</h5>
            <p class="card-text">Come here to read all the thoughts of other nesters about the verses</p>
            <a href="reviews.jsp" class="btn btn-warning">See reviews</a>
        </div>
    </div>

    <div class="card">
        <div class="card-header">
            Nest of the Raven
        </div>
        <div class="card-body">
            <h5 class="card-title">User Private Zone</h5>
            <p class="card-text">Settings of your user account</p>
            <a href="zonausuario.jsp" class="btn btn-warning">Check your information</a>
        </div>
    </div>
</section>
</body>
</html>
