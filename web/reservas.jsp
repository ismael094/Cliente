<%-- 
    Document   : misreservas
    Created on : 30-mar-2019, 10:30:19
    Author     : Ismael1
--%>

<%@page import="model.ComprasModel"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="controller.Converter"%>
<%@page import="java.util.List"%>
<%@page import="model.Reservas"%>
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
                <div class='col-md-8 row justify-content-center'>
                    <h1 class="col-md-12 text-center m-3">Reservas activas: </h1>
                    
                    <%
                        if (tipo != 2) 
                            response.sendRedirect("http://ws.docencia.ces.siani.es/a01/Cliente/index.jsp");
                        List<Reservas> list = Converter.reservasActivas();
                        if (list.size() > 0) {
                            %>
                            <table class="table table-hover">
                                <thead>
                                    <tr>
                                        <th scope="col">Título</th>
                                        <th scope="col">Isbn</th>
                                        <th scope="col">Año</th>
                                        <th scope="col">Editorial</th>
                                        <th scope="col">Stock</th>
                                        <th scope="col">Usuario</th>
                                        <th scope="col">Fecha de Entrega</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%
                                        for (Reservas reserva : list) {
                                            %>
                                                <tr> 
                                                    <td><% out.println(reserva.getIdLibro().getTitle());%></td>
                                                    <td><% out.println(reserva.getIdLibro().getIsbn());%></td>
                                                    <td><% out.println(reserva.getIdLibro().getPublishYear());%></td>
                                                    <td><% out.println(reserva.getIdLibro().getPublisher());%></td>
                                                    <td><% out.println(reserva.getIdLibro().getStock());%></td>
                                                    <td><% out.println(reserva.getUsuario().getUsuario());%></td>
                                                    <td><% out.println(reserva.getFechaEntrega());%></td>
                                                </tr>
                                            <%
                                        }
                                    %>
                                </tbody>
                            </table>
                            <%
                        }
                    %>
                </div>
            </div>
        </div>
    </body>
</html>
