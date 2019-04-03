<%-- 
    Document   : devolver
    Created on : 30-mar-2019, 14:12:07
    Author     : Ismael1
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="head.jsp" %>
    <%
    try { 
        if (!isLoged || request.getParameter("id") == null) {
            response.sendRedirect("http://ws.docencia.ces.siani.es/a01/Cliente/index.jsp");
        }
	service = new mibiblio.MiBibliotecaWS_Service();
	int id = Integer.parseInt(request.getParameter("id"));
	// TODO process result here
	boolean result = service.getMiBibliotecaWSPort().devolver(id);
        response.sendRedirect("http://ws.docencia.ces.siani.es/a01/Cliente/misreservas.jsp"); 
    } catch (Exception ex) {
	// TODO handle custom exceptions here
    }
    %>

