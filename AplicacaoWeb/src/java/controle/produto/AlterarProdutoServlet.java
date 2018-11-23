/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controle.produto;

import java.io.IOException;
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
public class AlterarProdutoServlet extends HttpServlet {

     protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // entrada
        int id= Integer.parseInt(request.getParameter("id"));
        String descricao = request.getParameter("descricao");
        double preco= Double.parseDouble(request.getParameter("preco"));
        int categoria_id= Integer.parseInt(request.getParameter("categoria_id"));
        // processamento
        ProdutoNegocio produtoNegocio = new ProdutoNegocio();
        boolean sucessoAlterar = produtoNegocio.alterar(id, descricao, preco, categoria_id);
        // saída
        if (sucessoAlterar) {
            request.setAttribute("mensagem", "Produto alterado com sucesso!");
        } else {
            request.setAttribute("mensagem", "Não foi possível alterar este produto!");
        }
        RequestDispatcher rd = request.getRequestDispatcher("ListarProdutoServlet");
        rd.forward(request, response);
    }
        
    
}
