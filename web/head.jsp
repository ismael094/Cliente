<%-- 
    Document   : head
    Created on : 24-mar-2019, 12:59:49
    Author     : Ismael1
--%>

<%@page import="org.json.JSONObject"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
<title>MiBiblioteca</title>
<%
    
    mibiblio.MiBibliotecaWS_Service service = new mibiblio.MiBibliotecaWS_Service();
    mibiblio.MiBibliotecaWS port = service.getMiBibliotecaWSPort();
     // TODO initialize WS operation arguments here
    java.lang.String usuario = request.getParameter("usuario");
    java.lang.String pass = request.getParameter("pass");
    boolean error = false;
    String user  = "";
    int tipo = 0;
    boolean isLoged = false;
    boolean penalizado = false;
    if (usuario != null && pass != null ) {
        boolean result = port.login(usuario, pass);
        if (result) {
            int t = service.getMiBibliotecaWSPort().gettipo(usuario);
            String data = "{ 'nombre' : '"+usuario+"', 'tipo' : "+t+" }";
            Cookie loginCookie = new Cookie("user",data);
            isLoged = true;
            user = usuario;
            loginCookie.setMaxAge(30*60);
            response.addCookie(loginCookie);
        } else {
            error = true;
        }
    } else {
        Cookie[] cookies = request.getCookies();
    
        for (Cookie c : cookies) {
            if (c.getName().equals("user")) {
                isLoged = true;
                JSONObject obj = new JSONObject(c.getValue());
                user = obj.getString("nombre");
                tipo = obj.getInt("tipo");
                c.setMaxAge(30*60);
                response.addCookie(c);
                break;
            }
        }  
    }
    
    
%>