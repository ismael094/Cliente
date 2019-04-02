<%-- 
    Document   : misreservas
    Created on : 30-mar-2019, 10:30:19
    Author     : Ismael1
--%>

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
                    <h1 class="col-md-12 text-center m-3">Mis reservas: </h1>
                    
                    <%
                        if (!isLoged) 
                            response.sendRedirect("http://ws.docencia.ces.siani.es/a01/Cliente/index.jsp");
                        List<Reservas> list = Converter.misreservas(user);
                        if (list.size() > 0) {
                            for (Reservas reserva : list) {
                                SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                                Date date1 = new Date();
                                Date date2 = reserva.getFechaEntrega();
                                int compare = date2.compareTo(date1);
                                %>
                                    <div class="col-md-12 row text-truncate mt-md-3">
                                        <div class="text-center">
                                            <object data="http://covers.openlibrary.org/b/isbn/<% out.print(reserva.getIdLibro().getIsbn().trim());%>-L.jpg?default=false" class="img-fluid rounded" style='width: 210px;height:325px'>
                                                <img src="http://www.bookzart.com/desktop/images/default-book-cover.png" class="img-fluid rounded" style='width: 210px;height:325px'>
                                            </object>
                                        </div>
                                        <div class="col-md-4">
                                            <h5 class="col-md-5">Título: </h5> <% out.println(reserva.getIdLibro().getTitle());%>
                                            <h5 class="col-md-5">Autor: </h5><% out.println(reserva.getIdLibro().getAuthorName());%>
                                            <h5 class="col-md-5">Género:  </h5><% out.println(reserva.getIdLibro().getSubject());%>
                                            <h5 class="col-md-5">Editorial:  </h5><% out.println(reserva.getIdLibro().getPublisher());%>
                                            <h5 class="col-md-5">Año  </h5><% out.println(reserva.getIdLibro().getPublishYear());%>
                                            
                                            
                                        </div>
                                        <%
                                            
                                            if (reserva.getEstado().equals("E")) {
                                                %>
                                                    
                                                    <form class="col-md-4 form-inline my-2 my-lg-0 text-center mx-auto mt-md-3" action="devolver.jsp" method="POST">
                                                        <input type="hidden" name="id" value="<% out.print(reserva.getId());%>">
                                                        <button class="btn btn-<% if (compare < 0) { out.print("danger");} else { out.print("primary"); } %> my-2 my-sm-0 text-center mb-md-3 mx-auto" type="submit">Devolver</button>
                                                    </form>
                                                    <h5 class="col-md-4">Fecha de entrega: <% out.println(new SimpleDateFormat("dd-MM-yyyy").format(reserva.getFechaEntrega()));%></h5>
                                                <%
                                                    
                                            } else {
                                                %>
                                                    <h5 class="col-md-12">Entregado <% out.println(new SimpleDateFormat("dd-MM-yyyy").format(reserva.getFechaEntrega()));%></h5>
                                                
                                               <%
                                            }
                                        %>
                                    </div>
                                <%
                            }
                        } else {
                            %>
                            <div class="col-md-12 row text-truncate mt-md-3 text-center">
                                <h3 class=" col-md-12 text-center">No tienes ninguna reserva</h3>
                            </div>
                            <%
                        }
                    %>
                    
                </div>
            </div>
        </div>
    </body>
</html>

