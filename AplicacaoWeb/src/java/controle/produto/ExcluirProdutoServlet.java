/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controle.produto;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.produto.ProdutoNegocio;


/**
 *
 * @author amaaa
 */
public class ExcluirProdutoServlet extends HttpServlet {
    
     protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
        int id= Integer.parseInt(request.getParameter("id"));
        
        ProdutoNegocio produtoNegocio = new ProdutoNegocio();

        //excluir produto do venda_produto
        
        boolean sucessoExcluir = produtoNegocio.excluir(id);
        
        if (sucessoExcluir) {
            request.setAttribute("mensagem", "Produto excluído com sucesso");
        } else {
            request.setAttribute("mensagem", "Não foi possível excluir este produto");
        }
        RequestDispatcher rd = request.getRequestDispatcher("ListarProdutoServlet");
        rd.forward(request, response);
    }

}
