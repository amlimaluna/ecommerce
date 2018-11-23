/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controle.categoria;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.categoria.CategoriaNegocio;
import modelo.categoria.Categoria;

/**
 *
 * @author amaaa
 */
public class ObterCategoriaServlet extends HttpServlet {

        protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        int id= Integer.parseInt(request.getParameter("id"));
        
        CategoriaNegocio categoriaNegocio = new CategoriaNegocio();
        Categoria categoria = categoriaNegocio.obterCategoria(id);
        request.setAttribute("categoria", categoria);
        RequestDispatcher rd = request.getRequestDispatcher("WEB-INF/pages/categoria/alterar.jsp");
        rd.forward(request, response);
    }
}
