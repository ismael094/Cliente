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
                    String p = request.getParameter("page");
                    if (p == null)
                        p = 0+"";
                    List<Book> list = Converter.getBooks(request.getParameter("by"), request.getParameter("q"),Integer.parseInt(p),request.getParameter("in"));
                    if (list.size() > 0) {
                        for (Book book : list) {
                            %>
                                <div class="col-md-3 row justify-content-center" style='margin-bottom: 50px'>   
                                    <div class="col-md-12 row text-truncate">
                                        <h6 class="col-md-12">Título: </h6> <% out.println(book.getTitle());%>
                                        <h6 class="col-md-12">Autor: </h6><% out.println(book.getAuthor_name());%>
                                    </div>
                                    <div class="text-center">
                                        <object data="http://covers.openlibrary.org/b/isbn/<% out.print(book.getIsbn().trim());%>-L.jpg?default=false" class="img-fluid rounded" style='width: 210px;height:325px'>
                                            <img src="http://www.bookzart.com/desktop/images/default-book-cover.png" class="img-fluid rounded" style='width: 210px;height:325px'>
                                        </object>
                                    </div>
                                </div>
                            <%
                        }
                    } else {
                        %>
                            <div class="col-md-3 row justify-content-center" style='margin-bottom: 50px'>   
                                <div class="col-md-12 row text-truncate">
                                    No se han encontrado resultados para su búsqueda

                                </div>
                                <div class="text-center">
                                    <object data="" class="img-fluid rounded" style='width: 210px;height:325px'>
                                        <img src="http://www.bookzart.com/desktop/images/default-book-cover.png" class="img-fluid rounded" style='width: 210px;height:325px'>
                                    </object>
                                </div>
                            </div>
                        <%
                    }
                %>
                
            </div>
            <div class="row justify-content-center">
                <nav aria-label="Page navigation example" class="col-md-3 text-center">
                    <ul class="pagination text-center">
                      <li class="page-item">
                        <a class="page-link" href="#" aria-label="Previous">
                          <span aria-hidden="true">&laquo;</span>
                        </a>
                      </li>
                      <li class="page-item"><a class="page-link" href="<% out.println("resultados.jsp?q="+request.getParameter("q").replace(' ', '+')+"&by="+request.getParameter("by")+"&in="+request.getParameter("in")+"&page=1");%>">1</a></li>
                      <li class="page-item"><a class="page-link" href="<% out.println("resultados.jsp?q="+request.getParameter("q").replace(' ', '+')+"&by="+request.getParameter("by")+"&in="+request.getParameter("in")+"&page=2");%>">2</a></li>
                      <li class="page-item"><a class="page-link" href="<% out.println("resultados.jsp?q="+request.getParameter("q").replace(' ', '+')+"&by="+request.getParameter("by")+"&in="+request.getParameter("in")+"&page=3");%>">3</a></li>
                      <li class="page-item"><a class="page-link" href="<% out.println("resultados.jsp?q="+request.getParameter("q").replace(' ', '+')+"&by="+request.getParameter("by")+"&in="+request.getParameter("in")+"&page=4");%>">4</a></li>
                      <li class="page-item"><a class="page-link" href="<% out.println("resultados.jsp?q="+request.getParameter("q").replace(' ', '+')+"&by="+request.getParameter("by")+"&in="+request.getParameter("in")+"&page=5");%>">5</a></li>
                      
                      <li class="page-item">
                        <a class="page-link" href="#" aria-label="Next">
                          <span aria-hidden="true">&raquo;</span>
                        </a>
                      </li>
                    </ul>
                  </nav>
            </div>
        </div>
    </body>
</html>
