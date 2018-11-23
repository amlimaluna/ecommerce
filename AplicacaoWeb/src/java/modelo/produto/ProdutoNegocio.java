/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo.produto;

import java.util.List;
import modelo.venda.VendaDAO;
/**
 *
 * @author amaaa
 */
public class ProdutoNegocio {
    
         public boolean inserir(String descricao, double preco, int categoria_id) {
        ProdutoDAO dao = new ProdutoDAO();
        return dao.inserir(descricao, preco, categoria_id);
    }

    public boolean alterar(int id, String descricao, double preco, int categoria_id) {
        ProdutoDAO dao = new ProdutoDAO();
        return dao.alterar(id, descricao, preco, categoria_id);
    }

    public boolean excluir(int id) {
        VendaDAO vendaDAO = new VendaDAO();
        vendaDAO.excluirProdutoDaVendaProduto(id);
        ProdutoDAO dao = new ProdutoDAO();
        return dao.excluir(id);
    }
    
    public Produto obterProduto (int id) {
        ProdutoDAO dao = new ProdutoDAO();
        return dao.obterProduto(id);
    }

    public List<Produto> obterTodos() {
        ProdutoDAO dao = new ProdutoDAO();
        return dao.obterTodos();
    }
    
    
}
