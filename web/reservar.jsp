<%-- 
    Document   : reservar
    Created on : 29-mar-2019, 21:14:49
    Author     : Ismael1
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.DateFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="head.jsp" %>
        
    </head>
    <body>
        <%@include file="nav.jsp" %>
            <div class='container'>
            <div class=' row justify-content-center'>
                <div class='col-md-6'>
                    <h1>Búsqueda de libros: </h1>
                    <form action='confirmarReserva.jsp' method='GET'>
                        <div class="form-group">
                            <label for="exampleInputEmail1">Fecha entrega: </label>
                            <%
                                if (!isLoged || request.getParameter("isbn") == null) 
                                    response.sendRedirect("http://ws.docencia.ces.siani.es/a01/Cliente/index.jsp");
                                DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
                                DateFormat year = new SimpleDateFormat("yyyy");
                                DateFormat month = new SimpleDateFormat("MM");
                                DateFormat day = new SimpleDateFormat("dd");
                                Date date = new Date();
                                int monthNumber = Integer.parseInt(month.format(date));
                                String m = (monthNumber+1)+"";
                                if (monthNumber < 10) {
                                    m = "0"+m;
                                }
                            %>
                          <input type="date" name="fechaEntrega" class="form-control" min="<% out.print(dateFormat.format(date));%>" max="<% out.print(""+year.format(date)+"-"+m+"-30");%>" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
                          <small id="emailHelp" class="form-text text-muted">Sólo puedes reservar un libro durante 31 días.</small>
                          <input type="hidden" name="currentDate" value="<% out.print(dateFormat.format(date));%>">
                          <input type="hidden" name="isbn" value="<% out.print(request.getParameter("isbn"));%>">
                        </div>
                        <button type="submit" class="btn btn-primary">Submit</button>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>
