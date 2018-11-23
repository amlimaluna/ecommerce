/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo.categoria;

import java.util.List;
/**
 *
 * @author amaaa
 */
public class CategoriaNegocio {
    
        public boolean inserir(String descricao) {
        CategoriaDAO dao = new CategoriaDAO();
        return dao.inserir(descricao);
    }

    public boolean alterar(int id, String descricao) {
        CategoriaDAO dao = new CategoriaDAO();
        return dao.alterar(id, descricao);
    }

    public boolean excluir(int id) {
        CategoriaDAO dao = new CategoriaDAO();
        return dao.excluir(id);
    }
    
    /**
     * Método utilizado para recuperar um usuário por meio de um login
     *
     * @param login
     * @return
     */
    public Categoria obterCategoria (int id) {
        CategoriaDAO dao = new CategoriaDAO();
        return dao.obterCategoria(id);
    }

    public List<Categoria> obterTodos() {
        CategoriaDAO dao = new CategoriaDAO();
        return dao.obterTodos();
    }

    
}
