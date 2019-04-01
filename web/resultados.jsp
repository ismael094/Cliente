<%-- 
    Document   : resultados
    Created on : 24-mar-2019, 13:14:49
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
                <h1 class="col-md-12 text-center m-3">Resultados: </h1>
                <%
                    String p = request.getParameter("page");
                    if (p == null)
                        p = 0+"";
                    List<Libros> list = Converter.getBooks(request.getParameter("by"), request.getParameter("q"),Integer.parseInt(p),request.getParameter("in"));
                %>
                <%@include file="listarLibros.jsp" %>
                
            </div>
            <%
                if (Converter.num > 10) {
                    %>
                        <div class="row justify-content-center">
                            <nav aria-label="Page navigation example" class="col-md-3 text-center">
                                <ul class="pagination text-center">
                                    <li class="page-item">
                                        <a class="page-link" href="<% out.println("resultados.jsp?q="+request.getParameter("q").replace(' ', '+')+"&by="+request.getParameter("by")+"&in="+request.getParameter("in")+"&page=1");%>" aria-label="Previous">
                                          <span aria-hidden="true">&laquo;</span>
                                        </a>
                                    </li>
                                    <%
                                        if (Converter.num > 40) {
                                            Converter.num = 40;
                                        }
                                        for (int i = 0;i<(Converter.num/10)+1;i++) {
                                            %>
                                                <li class="page-item"><a class="page-link" href="<% out.println("resultados.jsp?q="+request.getParameter("q").replace(' ', '+')+"&by="+request.getParameter("by")+"&in="+request.getParameter("in")+"&page="+(i+1));%>"><% out.print(i+1);%></a></li>
                                            <%
                                           }
                                    %>
                                    <li class="page-item">
                                        <a class="page-link" href="<% out.println("resultados.jsp?q="+request.getParameter("q").replace(' ', '+')+"&by="+request.getParameter("by")+"&in="+request.getParameter("in")+"&page="+((Converter.num/10)+1));%>" aria-label="Next">
                                          <span aria-hidden="true">&raquo;</span>
                                        </a>
                                    </li>
                                </ul>
                              </nav>
                        </div>
                    <%
                }
            %>
                      
        </div>
    </body>
</html>
