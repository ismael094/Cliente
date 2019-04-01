<%-- 
    Document   : nav
    Created on : 24-mar-2019, 12:58:13
    Author     : Ismael1
--%>

<%@page import="controller.Converter"%>
<%@page import="java.util.Date"%>
<%@page import="model.Reservas"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
  <a class="navbar-brand" href="#">MiBiblioteca</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
        <li class="nav-item active">
            <a class="nav-link" href="index.jsp">Inicio <span class="sr-only">(current)</span></a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="buscar.jsp">Buscar</a>
        </li>
        <%
            if (isLoged) {
        %>
            <li class="nav-item">
                <a class="nav-link" href="misreservas.jsp">Mis reservas</a>
            </li>
        <%
            } else {
                %>
                    <li class="nav-item">
                        <a class="nav-link" href="registro.jsp">Registrarse</a>
                    </li>
                <%
            }
        %>
    </ul>

    <%
        if (isLoged) {
            List<Reservas> reservasL = Converter.mispenalizaciones(user);
            for (Reservas reser : reservasL) {
                if ((new Date().compareTo(reser.getFechaEntrega())-1) < reser.getPenalizacion()) {
                    penalizado = true;
                    %>
                        <div class="navbar-text mr-md-3">
                            <span class="alert alert-danger" role="alert">
                                Penalizado hasta dentro de <% out.print(reser.getPenalizacion() - new Date().compareTo(reser.getFechaEntrega())+1);%> días
                            </span>
                        </div>
                    <% 
                        break;
                }
            }
        %>
        <span class="navbar-text mr-md-3">
            Bienvenido, <% out.print(user);%>
        </span>
        <form class="form-inline my-2 my-lg-0" action="logout.jsp" method="POST">
            <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Logout</button>
        </form>
        
    <%
        } else {
            if (error) {
                %>
                    <div class="navbar-text mr-md-3">
                        <span class="alert alert-danger" role="alert">
                            Usuario o contraseña incorrectas
                        </span>
                    </div>
                <%
            }
    %>
        
        <form class="form-inline my-2 my-lg-0" action="index.jsp" method="POST">
          <input class="form-control mr-sm-2" name="usuario" type="search" placeholder="Usuario" aria-label="Usuario">
          <input class="form-control mr-sm-2" name="pass" type="password" placeholder="Contraseña" aria-label="Contraseña">
          <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Login</button>
        </form>
    <%
        }
    %>
  </div>
</nav>
