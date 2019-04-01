<%-- 
    Document   : confirmarReserva
    Created on : 29-mar-2019, 22:04:26
    Author     : Ismael1
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="head.jsp" %>
        
    </head>
    <body>
        <%@include file="nav.jsp" %>
        <%
            try {
                if (!isLoged && penalizado) 
                    response.sendRedirect("index.jsp");
                mibiblio.MiBibliotecaWS_Service service5 = new mibiblio.MiBibliotecaWS_Service();
                mibiblio.MiBibliotecaWS port5 = service5.getMiBibliotecaWSPort();
                 // TODO initialize WS operation arguments here
                java.lang.String isbn = request.getParameter("isbn");
                java.lang.String fechaInicio = request.getParameter("currentDate");
                java.lang.String fechaEntrega = request.getParameter("fechaEntrega");
                // TODO process result here
                boolean result = port.reservar(user, isbn, fechaInicio, fechaEntrega);
                if (result) {
                    %>
                        <div class="alert alert-success text-center" role="alert">
                            Se ha emitido la reserva correctamente
                        </div>
                    <%
                } else {
                    %>
                        <div class="alert alert-danger text-center" role="alert">
                            Ha ocurrido un error, lo sentimos
                        </div>
                    <%
                }
            } catch (Exception ex) {
                // TODO handle custom exceptions here
            }
        %>
    </body>
</html>

