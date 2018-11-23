/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controle.produto;


import java.io.IOException;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.categoria.Categoria;
import modelo.produto.ProdutoNegocio;
import modelo.categoria.CategoriaNegocio;

/**
 *
 * @author amaaa
 */
public class NovoProdutoServlet extends HttpServlet {

        protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // entrada
 
        CategoriaNegocio categoriaNegocio = new CategoriaNegocio();
        List<Categoria> resultado = categoriaNegocio.obterTodos();
        request.setAttribute("resultado", resultado);
        RequestDispatcher rd = request.getRequestDispatcher("WEB-INF/pages/produto/novoProduto.jsp");
        rd.forward(request, response);
        
    }

    
}
