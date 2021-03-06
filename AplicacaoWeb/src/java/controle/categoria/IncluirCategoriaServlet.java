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
public class IncluirCategoriaServlet extends HttpServlet {

    
     protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
     // entrada
       
        String descricao = request.getParameter("descricao");

        // processamento
        CategoriaNegocio categoriaNegocio = new CategoriaNegocio();
        boolean sucessoInserir = categoriaNegocio.inserir(descricao);
        
        // saída
        if (sucessoInserir) {
            request.setAttribute("mensagem", "Categoria inserida com sucesso");
            RequestDispatcher rd = request.getRequestDispatcher("ListarCategoriaServlet");
            rd.forward(request, response);
       
        } else {
            request.setAttribute("mensagem", "Não foi possível inserir esta categoria!");
            RequestDispatcher rd = request.getRequestDispatcher("WEB-INF/pages/categoria/novaCategoria.jsp");
            rd.forward(request, response);
        }
    }
     
}

