<%-- 
    Document   : comprar
    Created on : 30-mar-2019, 17:05:55
    Author     : Ismael1
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="head.jsp" %>
        
    </head>
    <body>
        <%@include file="nav.jsp" %>
        <%
            if (tipo != 2)
                response.sendRedirect("http://ws.docencia.ces.siani.es/a01/Cliente/index.jsp");
            if (request.getParameter("cantidad") != null) {
                service = new mibiblio.MiBibliotecaWS_Service();
                boolean compra = service.getMiBibliotecaWSPort().comprar(request.getParameter("isbn"),Integer.parseInt(request.getParameter("cantidad")));  
                if (compra) {
                    %>
                    <div class="alert alert-success text-center" role="alert">
                        Se ha emitido la compra correctamente
                    </div>
                    <%
                } else {
                    %>
                        <div class="alert alert-danger text-center" role="alert">
                            El proveedor ha rechazado la operación
                        </div>
                    <%
                }
                
            } else {
            %>
                <div class='container'>
                    <div class=' row justify-content-center'>
                        <div class='col-md-6'>
                            <h1>Introducir cantidad: </h1>
                            <form action='comprar.jsp' method='GET'>
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Cantidad: </label>
                                  <input type="number" name="cantidad" class="form-control" min=0 id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Cantidad">
                                  <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                                  <input type="hidden" name="isbn" value="<% out.print(request.getParameter("isbn"));%>">
                                </div>
                                <button type="submit" class="btn btn-primary">Submit</button>
                                <div class="alert alert-danger text-center" role="alert">
                                    Sólo se permiten cantidades menores a 30
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            <%
            }
            
        %>
            
    </body>
</html>
