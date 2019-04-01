<%-- 
    Document   : listarLibros
    Created on : 30-mar-2019, 22:10:56
    Author     : Ismael1
--%>

<%
    if (list == null || list.size() > 0) {
        int inicio = 0;
        int fin = list.size();
        if (request.getParameter("in") != null && request.getParameter("in").equals("biblioteca")) {
            if (list.size() < 10)
                fin = list.size();
            else if (request.getParameter("page") != null && Integer.parseInt(request.getParameter("page")) > 1) {
                int pagina = Integer.parseInt(request.getParameter("page"));

                fin = pagina*10;
                inicio = fin-10;
                if (list.size()-10 < 10) {
                    fin = list.size();
                }
            } else {
                fin = 10;
            }
        }
        
        
        for (int i = inicio; i<fin;i++) {
            Libros book = list.get(i);
            %>
                <div class="col-md-3 row justify-content-center" style='margin-bottom: 50px'>   
                    <div class="col-md-12 row text-truncate">
                        <h6 class="col-md-12">Título: </h6> <% out.println(book.getTitle());%>
                        <h6 class="col-md-12">Autor: </h6><% out.println(book.getAuthorName());%>
                        <%
                            if (!penalizado && isLoged && (request.getParameter("in") == null || ( request.getParameter("in").equals("biblioteca")))) {
                        %>
                            <form class="col-md-12 form-inline my-2 my-lg-0 text-center mx-auto" action="reservar.jsp" method="POST">
                                <input type="hidden" name="isbn" value="<% out.print(book.getIsbn().trim());%>">
                                <button class="btn btn-primary my-2 my-sm-0 text-center mb-md-3 mx-auto"  <% if (book.getStock() == 0){ out.print("disabled");} %> type="submit">Reservar</button>
                            </form>
                        <%
                            }
                        %>
                        <%
                            if ((request.getParameter("in") != null && request.getParameter("in").equals("general") && tipo == 2)) {
                        %>
                            <form class="col-md-12 form-inline my-2 my-lg-0 text-center mx-auto" action="comprar.jsp" method="POST">
                                <input type="hidden" name="isbn" value="<% out.print(book.getIsbn().trim());%>">
                                <button class="btn btn-primary my-2 my-sm-0 text-center mb-md-3 mx-auto" type="submit">Comprar</button>
                            </form>
                        <%
                            }
                        %>
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
