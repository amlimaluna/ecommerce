/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo.produto;

/**
 *
 * @author amaaa
 */
public class Produto {
    
    private int id;
    private String descricao;
    private double preco;
    private int categoria_id;
    
        public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id=id;
    }
    
    public String getDescricao() {
        return descricao;
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }
    
        public double getPreco() {
        return preco;
    }

    public void setPreco(double preco) {
        this.preco=preco;
    }
    
        public int getCategoriaId() {
        return categoria_id;
    }

    public void setCategoriaId(int categoria_id) {
        this.categoria_id=categoria_id;
    }
}
