<%-- 
    Document   : resultados
    Created on : 24-mar-2019, 13:14:49
    Author     : Ismael1
--%>

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
                <h1 class="col-md-12 text-center m-3">Resultados: </h1>
                
                <%
                    List<Book> list = Converter.getBooks(request.getParameter("key"), request.getParameter("buscar"));
                    for (Book book : list) {
                        %>
                            <div class="col-md-3 row justify-content-center" style='margin-bottom: 50px'>   
                                <div class="col-md-12 row text-truncate">
                                    <h6 class="col-md-12">Título: </h6> <% out.println(book.getTitle());%>
                                    <h6 class="col-md-12">Autor: </h6><% out.println(book.getAuthor_name());%>
                                </div>
                                <div class="text-center">
                                    <object data="<% out.println(book.getCoverUrl().trim());%>?default=false" class="img-fluid rounded" style='width: 210px;height:325px'>
                                        <img src="http://www.bookzart.com/desktop/images/default-book-cover.png" class="img-fluid rounded" style='width: 210px;height:325px'>
                                    </object>
                                </div>
                            </div>
                        <%
                    }
                %>
            </div>
        </div>
    </body>
</html>
