/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package view;

import controller.Converter;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Book;

/**
 *
 * @author Ismael1
 */
@WebServlet(name = "Resultados", urlPatterns = {"/resultados"})
public class Resultados extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Resultados</title>");  
            out.println("<link rel=\"stylesheet\" href=\"https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css\" integrity=\"sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T\" crossorigin=\"anonymous\">");
            out.println("<script src=\"https://code.jquery.com/jquery-3.3.1.slim.min.js\" integrity=\"sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo\" crossorigin=\"anonymous\"></script>\n" +
"<script src=\"https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js\" integrity=\"sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1\" crossorigin=\"anonymous\"></script>\n" +
"<script src=\"https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js\" integrity=\"sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM\" crossorigin=\"anonymous\"></script>");
            out.println("</head>");
            out.println("<body>");
            out.println("<nav class=\"navbar navbar-expand-lg navbar-light bg-light\">\n" +
"  <a class=\"navbar-brand\" href=\"#\">MiBiblioteca</a>\n" +
"  <button class=\"navbar-toggler\" type=\"button\" data-toggle=\"collapse\" data-target=\"#navbarSupportedContent\" aria-controls=\"navbarSupportedContent\" aria-expanded=\"false\" aria-label=\"Toggle navigation\">\n" +
"    <span class=\"navbar-toggler-icon\"></span>\n" +
"  </button>\n" +
"\n" +
"  <div class=\"collapse navbar-collapse\" id=\"navbarSupportedContent\">\n" +
"    <ul class=\"navbar-nav mr-auto\">\n" +
"      <li class=\"nav-item active\">\n" +
"        <a class=\"nav-link\" href=\"#\">Inicio <span class=\"sr-only\">(current)</span></a>\n" +
"      </li>\n" +
"      <li class=\"nav-item\">\n" +
"        <a class=\"nav-link\" href=\"buscar\">Buscar</a>\n" +
"      </li>\n" +
"      <li class=\"nav-item dropdown\">\n" +
"        <a class=\"nav-link dropdown-toggle\" href=\"#\" id=\"navbarDropdown\" role=\"button\" data-toggle=\"dropdown\" aria-haspopup=\"true\" aria-expanded=\"false\">\n" +
"          Dropdown\n" +
"        </a>\n" +
"        <div class=\"dropdown-menu\" aria-labelledby=\"navbarDropdown\">\n" +
"          <a class=\"dropdown-item\" href=\"#\">Action</a>\n" +
"          <a class=\"dropdown-item\" href=\"#\">Another action</a>\n" +
"          <div class=\"dropdown-divider\"></div>\n" +
"          <a class=\"dropdown-item\" href=\"#\">Something else here</a>\n" +
"        </div>\n" +
"      </li>\n" +
"      <li class=\"nav-item\">\n" +
"        <a class=\"nav-link disabled\" href=\"#\" tabindex=\"-1\" aria-disabled=\"true\">Disabled</a>\n" +
"      </li>\n" +
"    </ul>\n" +
"    <form class=\"form-inline my-2 my-lg-0\">\n" +
"      <input class=\"form-control mr-sm-2\" type=\"search\" placeholder=\"Search\" aria-label=\"Search\">\n" +
"      <button class=\"btn btn-outline-success my-2 my-sm-0\" type=\"submit\">Search</button>\n" +
"    </form>\n" +
"  </div>\n" +
"</nav>");
            out.println("<h1>Resultados: </h1>");
            List<Book> list = Converter.getBooks(request.getParameter("key"), request.getParameter("buscar"), 0,"");
            out.println("<div class=\"container\" style=\"font-size: 15px\">");
                out.println("<div class=\"row justify-content-center\">");
                    for (Book book : list) {
                            out.println("<div class=\"col-md-3 row justify-content-center\" style='margin-bottom: 50px'>");    
                            out.println("<div class=\"col-md-12 row text-truncate\">");
                                out.println("<h6 class=\"col-md-12\">Título: </h6>"+book.getTitle());
                                out.println("<h6 class=\"col-md-12\">Autor: </h6>"+book.getAuthor_name());
                            out.println("</div>"); 
                                    out.println("<div class=\"text-center\">\n" 
                                            + "<object data=\""+book.getCoverUrl()+"?default=false\" class=\"img-fluid rounded\" style='width: 210px;height:325px'>" +
                                    "  <img src=\"http://www.bookzart.com/desktop/images/default-book-cover.png\" class=\"img-fluid rounded\" alt=\"...\"  style='width: 210px;height:325px'>\n" +
                                                    "</object>"+
                                    "</div>");
                                   
                            
                            out.println("</div>");
                    }
                out.println("</div>");
            out.println("</div>");
            out.println("</body>");
            out.println("</html>");
        }
    }
    
    /*
    
    out.println("<div class=\"col-md-12 card row  justify-content-center\">");
                            out.println("<div class=\"col-md-6 row\">");
                                out.println("<h5 class=\"col-md-12\">Título: "+book.getTitle()+"</h5>");
                                out.println("<h5 class=\"col-md-12\">Autor: "+book.getAuthor_name()+"</h5>");
                            out.println("</div>");
                            out.println("<div class=\"col-md-6 row justify-content-center\">");                          
                                    out.println("<div class=\"text-center\">\n" +
                                    "  <img src=\""+book.getCoverUrl()+"\" class=\"img-fluid rounded\" alt=\"...\">\n" +
                                    "</div>");
                            
                            out.println("</div>");
                        out.println("</div>");
    */

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
