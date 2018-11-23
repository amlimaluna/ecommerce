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

/**
 *
 * @author amaaa
 */
public class ExcluirCategoriaServlet extends HttpServlet {

      protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
        int id= Integer.parseInt(request.getParameter("id"));
        
        CategoriaNegocio categoriaNegocio = new CategoriaNegocio();
        boolean sucessoExcluir = categoriaNegocio.excluir(id);
        if (sucessoExcluir) {
            request.setAttribute("mensagem", "Categoria excluída com sucesso");
        } else {
            request.setAttribute("mensagem", "Não foi possível excluir esta categoria");
        }
        RequestDispatcher rd = request.getRequestDispatcher("ListarCategoriaServlet");
        rd.forward(request, response);
    }
}
