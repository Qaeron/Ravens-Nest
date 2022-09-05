<%@ page import="com.svalero.project.domain.Usuario" %>
<%@ page import="com.svalero.project.dao.Database" %>
<%@ page import="com.svalero.project.dao.UsuarioDao" %>
<%@ page import="java.util.Optional" %>
<%@ page import="java.sql.SQLException" %>
<%@ page language="java"
         contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"
%>

<html lang="en">
<head>
  <title>Create New User</title>
  <!--"estilos bootstrap"--><link rel="canonical" href="https://getbootstrap.com/docs/5.1/examples/sign-in/">
  <link href="css/login.css" rel="stylesheet">
  <!--"estilos bootstrap"--><link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
  <meta name="theme-color" content="#7952b3">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>

<body class="text-center">
<script type="text/javascript">
  $(document).ready(function() {
    $("form").on("submit", function(event) {
      event.preventDefault();
      var formValue = $(this).serialize();
      $.post("register", formValue, function(data) {
        if ($.trim(data) == "/RavensNest/login.jsp") {
          window.location.href = data;
        } else {
          $("#result").html(data);
        }
      });
    });
  });
</script>

<main class="container">
  <main class="form-signin">
    <form>
      <h1 class="h3 mb-3 fw-normal">New Account</h1>
      <br>
      <div class="form-floating">
        <input type="text" name="nombre" class="form-control" id="floatingInput" placeholder="Name">
        <label for="floatingInput">Name</label>
      </div>
      <br>
      <div class="form-floating">
        <input type="text" name="apellido" class="form-control" id="floatingInput" placeholder="Surname">
        <label for="floatingInput">Surname</label>
      </div>
      <br>
      <div class="form-floating">
        <input type="text" name="email" class="form-control" id="floatingInput" placeholder="Email">
        <label for="floatingInput">Email</label>
      </div>
      <br>
      <div class="form-floating">
        <input type="text" name="contrasena" class="form-control" id="floatingInput" placeholder="Password">
        <label for="floatingInput">Password</label>
      </div>
      <br>
      <button type="submit" class="w-100 btn btn-lg btn-warning">Create New User</button>
      <a type="button" class="btn btn-link" href="login.jsp" role="button">Sign In</a>
    </form>
    <div id="result"></div>
  </main>
</main>
</body>
