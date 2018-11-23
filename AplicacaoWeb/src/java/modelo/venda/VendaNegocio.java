/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo.venda;

import java.util.List;
import modelo.venda_produto.VendaProduto;
/**
 *
 * @author amaaa
 */
public class VendaNegocio {
    
        public List<Venda> obterTodas() {
        VendaDAO dao = new VendaDAO();
        return dao.obterTodas();
    }
        
                public List<Venda> obterPorUsuario(String usuario_login) {
        VendaDAO dao = new VendaDAO();
        return dao.obterPorUsuario(usuario_login);
    }
    
    public boolean inserir(int id, String usuario_login) {
        VendaDAO dao = new VendaDAO();
        return dao.inserir(id, usuario_login);
    }
    
    public int obterId() {
    VendaDAO dao = new VendaDAO();
    return dao.obterId();
    }
    
    public boolean inserirVendaProduto(int vendaId, int produtoId, int quantidade) {
        VendaDAO dao = new VendaDAO();
        return dao.inserirVendaProduto(vendaId, produtoId, quantidade);
    }
    public List<VendaProduto> obterVendasProdutos(int vendaId) {
        VendaDAO dao = new VendaDAO();
        return dao.obterVendasProdutos(vendaId);
    }
    
    public boolean excluir(int vendaId) {
        VendaDAO dao = new VendaDAO();
        return dao.excluir(vendaId);
    }
    
    public boolean excluirVendaProduto(int vendaId) {
        VendaDAO dao = new VendaDAO();
        return dao.excluirVendaProduto(vendaId);
    }
        
    
 
}
