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
public class IncluirProdutoServlet extends HttpServlet {

    protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
        String descricao = request.getParameter("descricao");
        double preco= Double.parseDouble(request.getParameter("preco"));
        int categoria_id= Integer.parseInt(request.getParameter("categoria_id"));
        
        // processamento
        ProdutoNegocio produtoNegocio = new ProdutoNegocio();
        boolean sucessoInserir = produtoNegocio.inserir(descricao, preco, categoria_id);
        // saída
        
        if (sucessoInserir) {
            request.setAttribute("mensagem", "Produto inserido com sucesso!");
            RequestDispatcher rd = request.getRequestDispatcher("ListarProdutoServlet");
            rd.forward(request, response);
        } else {
            request.setAttribute("mensagem", "Não foi possível inserir este produto.");
            RequestDispatcher rd = request.getRequestDispatcher("WEB-INF/pages/produto/novoProduto.jsp");
            rd.forward(request, response);
        
    }
    }
}