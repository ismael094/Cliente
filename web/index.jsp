<%-- 
    Document   : index
    Created on : 24-mar-2019, 13:02:02
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
        <%out.print(getServletContext().getAttribute("attribute"));%>
    </body>
</html>
