<%-- 
    Document   : index
    Created on : 24-mar-2019, 13:02:02
    Author     : Ismael1
--%>

<%@page import="model.Libros"%>
<%@page import="java.util.List"%>
<%@page import="controller.Converter"%>
<%@page import="model.Book"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="head.jsp" %>
        <title>JSP Page</title>
    </head>
    <body>
        <%@include file="nav.jsp" %>
        <div class="container" style="font-size: 15px">
            <div class="row justify-content-center">
                <h1 class="col-md-12 text-center m-3">Novedades </h1>
                <%
                    List<Libros> list = Converter.getNovedades() ;
                    
                %>
                 <%@include file="listarLibros.jsp" %>
                
                
            </div>
            
        </div>
    </body>
</html>
