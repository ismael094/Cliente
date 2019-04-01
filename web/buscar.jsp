<%-- 
    Document   : buscarTest
    Created on : 24-mar-2019, 13:08:47
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
        
        <div class='container'>
            <div class=' row justify-content-center'>
                <div class='col-md-6'>
                    <h1>Búsqueda de libros: </h1>
                    <form action='resultados.jsp' method='GET'>
                        <div class="form-group">
                            <label for="search">Valor de la búsqueda</label>
                            <input type="text" class="form-control" id= "name" name="q"  placeholder="Nombre, autor...">
                        </div>
                        
                        <div class="form-group">
                            <label for="key">Buscar por: </label>
                            <select id ='key' name='by' class="form-control">
                                <option value='title'>Título</option>
                                <option value='authorName'>Autor</option>
                                <option value='isbn'>ISBN</option>
                                <option value='subject'>Género</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="tipo">Buscar en </label>
                            <select id = 'tipo' name='in' class="form-control">
                                <option value='biblioteca'>Biblioteca</option>
                                <option value='general'>General</option>
                            </select>
                        </div>
                        <button type="submit" class="btn btn-primary">Buscar</button>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>
