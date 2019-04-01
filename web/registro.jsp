<%-- 
    Document   : buscarTest
    Created on : 24-mar-2019, 13:08:47
    Author     : Ismael1
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="head.jsp" %>
        <title>JSP Page</title>
    </head>
    <body>
        <%@include file="nav.jsp" %>
        
        
        
        <div class='container'>
            <div class=' row justify-content-center'>
                <div class='col-md-6'>
                    <h1>Registro: </h1>
                    <form action='registro.jsp' method='POST'>
                        <div class="form-group">
                            <label for="nombre">Nombre</label>
                            <input type="text" class="form-control" id="nombre" name="nombre"  placeholder="Jose María..." required>
                        </div>
                        
                        <div class="form-group">
                            <label for="usuario">Nombre de usuario</label>
                            <input type="text" class="form-control" id="usuario" name="usuarioR"  placeholder="alex" required>
                        </div>
                        
                        <div class="form-group">
                            <label for="direccion">Dirección</label>
                            <input type="text" class="form-control" id="direccion" name="direccion" required>
                        </div>
                        
                        <div class="form-group">
                            <label for="dni">DNI</label>
                            <input type="text" class="form-control" id="dni" name="dni" required>
                        </div>
                        
                        <div class="form-group">
                            <label for="pass">Contraseña</label>
                            <input type="password" class="form-control" id="pass" name="pass" required>
                        </div>
                        
                        <%  
                            
                            if (request.getParameter("usuarioR") != null && request.getParameter("pass") != null) {
                                try {
                                    boolean hasRegister = service.getMiBibliotecaWSPort().registro(request.getParameter("usuarioR"), 
                                            request.getParameter("pass"), request.getParameter("nombre"), 
                                            request.getParameter("direccion"), Integer.parseInt(request.getParameter("dni")));
                                    if (!hasRegister) {
                                       %>
                                            <div class="form-group">
                                                <span class="alert alert-danger" role="alert">
                                                    Nombre de usuario repetido
                                                </span>
                                            </div>
                                        <% 
                                    } else {
                                       %>
                                            <div class="form-group">
                                                <span class="alert alert-success" role="alert">
                                                    Se ha registrado correctamente
                                                </span>
                                            </div>
                                        <% 
                                    }
                                } catch (Exception ex) {
                                    // TODO handle custom exceptions here
                                }
                            }
                        %>
                        <button type="submit" class="btn btn-primary">Registrarse</button>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>
