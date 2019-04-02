<%-- 
    Document   : logout
    Created on : 29-mar-2019, 20:59:16
    Author     : Ismael1
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Cookie[] cookies = request.getCookies();
    for (Cookie c : cookies) {
        if (c.getName().equals("user")) {
            c.setMaxAge(0);
            response.addCookie(c);
            break;
        }
    }
    response.sendRedirect("http://ws.docencia.ces.siani.es/a01/Cliente/index.jsp");   
%>