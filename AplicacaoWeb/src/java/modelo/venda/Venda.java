/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo.venda;

import java.util.ArrayList;
import java.util.List;
import modelo.venda_produto.VendaProduto;

/**
 *
 * @author amaaa
 */
public class Venda {
    
    private int id;
    private String usuario_login;
    private List<VendaProduto> produtos;

    public Venda() {
        produtos = new ArrayList<VendaProduto>();
    }
    

    public List<VendaProduto> getProdutos() {
        return produtos;
    }

    public void setProdutos(List<VendaProduto> produtos) {
        this.produtos = produtos;
    }
    
    
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id=id;
    }
    
    public String getUsuarioLogin() {
        return usuario_login;
    }

    public void setUsuarioLogin(String usuario_login) {
        this.usuario_login=usuario_login;
    }
}
