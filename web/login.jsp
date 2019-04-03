<%-- 
    Document   : login
    Created on : 29-mar-2019, 20:39:56
    Author     : Ismael1
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
    </body>
</html>
    <%-- start web service invocation --%><hr/>
    <%
    try {
	mibiblio.MiBibliotecaWS_Service service = new mibiblio.MiBibliotecaWS_Service();
	mibiblio.MiBibliotecaWS port = service.getMiBibliotecaWSPort();
	 // TODO initialize WS operation arguments here
	java.lang.String usuario = request.getParameter("usuario");
	java.lang.String pass = request.getParameter("pass");
	// TODO process result here
	boolean result = port.login(usuario, pass);
        if (result) {
            Cookie loginCookie = new Cookie("user",usuario);
            //setting cookie to expiry in 30 mins
            loginCookie.setMaxAge(30*60);
            response.addCookie(loginCookie);
        }
    } catch (Exception ex) { 
        ;
    }
    response.sendRedirect("http://ws.docencia.ces.siani.es/a01/Cliente/index.jsp");   
    %>
    <%-- end web service invocation --%><hr/>
