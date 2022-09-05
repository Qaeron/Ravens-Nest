<%@ page import="com.svalero.project.domain.Usuario" %>
<%@ page language="java"
         contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"
%>



<%
  Usuario currentUser = (Usuario) session.getAttribute("currentUser");
  if (currentUser == null) {
    response.sendRedirect("login.jsp");
  }
%>

<html lang="en">
<head>
  <title>Your Profile</title>
  <meta charset="UTF-8">
  <!--"estilos bootstrap"-->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
  <script src="https://kit.fontawesome.com/cc976dc165.js" crossorigin="anonymous"></script>
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@100&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="css/general.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>

<body>
<header>
  <!--ajax para procesar el formulario y enviarlo al servlet-->
  <script type="text/javascript">
    $(document).ready(function() {
      $("form").on("submit", function(event) {
        event.preventDefault();
        var formValue = $(this).serialize();
        $.post("edituser", formValue, function(data) {
          $("#result").html(data);
        });
      });
    });
  </script>
</header>

<!-- Traemos los datos del usuario y permitimos modificarlos-->
<main class="contenedor"><br>
  <form>
    <fieldset>
      <legend>Change your data here</legend>
      <div class="mb-3">
        <label for="nombre" class="form-label">Name</label>
        <input type="text" name="nombre" id="nombre" class="form-control" value="<%= currentUser.getNombre() %>">
      </div>
      <div class="mb-3">
        <label for="apellido" class="form-label">Surname</label>
        <input type="text" name="apellido" id="apellido" class="form-control" value="<%= currentUser.getApellido() %>">
      </div>
      <div class="mb-3">
        <label for="email" class="form-label">Email</label>
        <input type="text" name="email" id="email" class="form-control" value="<%= currentUser.getEmail() %>">
      </div>
      <div class="mb-3">
        <label for="contrasena" class="form-label">Password</label>
        <input type="password" name="contrasena" id="contrasena" class="form-control" value="<%= currentUser.getContrasena() %>">
      </div>
    </fieldset>
    <button type="submit" class="btn btn-warning">Guardar</button>
    <a href="zonausuario.jsp" class="btn btn-link">Cancelar</a>
  </form>
  <div id="result"></div>
</main>
