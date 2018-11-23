/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo.carrinhodecompras;

import java.util.ArrayList;
import java.util.List;
import modelo.produto.ProdutoNegocio;
/**
 *
 * @author amaaa
 */
public final class carrinhocomprasNegocio {
    
        private static final String SEPARADOR_REGISTRO = "SEPREGISTER";
    private static final String SEPARADOR_CAMPOS = "SEPFIELD";

    private carrinhocomprasNegocio() {
        
    }
    
      public static String salvarProduto(String cookieValor, int produtoId, int quantidade) {
        if (cookieValor == null || cookieValor.trim().length() == 0) {
            return produtoId + SEPARADOR_CAMPOS + quantidade;
        }
        if (existeProduto(cookieValor, produtoId)) {
            if (!cookieValor.contains(SEPARADOR_REGISTRO)) { // só existe um produto
                cookieValor = produtoId + SEPARADOR_CAMPOS + quantidade;
            } else { // existe mais de um produto
                String[] produtos = cookieValor.split(SEPARADOR_REGISTRO);
                cookieValor = "";
                for (String p : produtos) {
                    String[] produto = p.split(SEPARADOR_CAMPOS);
                    if (cookieValor.trim().length() > 0) {
                        cookieValor = cookieValor + SEPARADOR_REGISTRO;
                    }
                    if (Integer.parseInt(produto[0]) == produtoId) {
                        cookieValor = cookieValor + (produtoId + SEPARADOR_CAMPOS + quantidade);
                    } else {
                        cookieValor = cookieValor + (Integer.parseInt(produto[0]) + SEPARADOR_CAMPOS + Integer.parseInt(produto[1]));
                    }
                }
            }
        } else {
            cookieValor = cookieValor + SEPARADOR_REGISTRO + (produtoId + SEPARADOR_CAMPOS + quantidade);
        }
        return cookieValor;
    }

      
      
        public static boolean existeProduto(String cookieValor, int produtoId) {
        if (cookieValor == null || cookieValor.trim().length() == 0) {
            return false;
        }
        String[] produtos = cookieValor.split(SEPARADOR_REGISTRO);
        if (produtos == null || produtos.length == 0) {
            produtos = new String[]{cookieValor};
        }
        for (String p : produtos) {
            String[] produto = p.split(SEPARADOR_CAMPOS);
            if (Integer.parseInt(produto[0]) == produtoId) {
                return true;
            }
        }
        return false;
    }
        
          public static String removerProduto(String cookieValor, int produtoId) {
        if (cookieValor == null || cookieValor.trim().length() == 0) {
            return "";
        }
        if (existeProduto(cookieValor, produtoId)) {
            if (!cookieValor.contains(SEPARADOR_REGISTRO)) { // só existe um produto
                cookieValor = "";
            } else { // existe mais de um produto
                String[] produtos = cookieValor.split(SEPARADOR_REGISTRO);
                cookieValor = "";
                for (String p : produtos) {
                    String[] produto = p.split(SEPARADOR_CAMPOS);
                    if (cookieValor.trim().length() > 0) {
                        cookieValor = cookieValor + SEPARADOR_REGISTRO;
                    }
                    if (Integer.parseInt(produto[0]) != produtoId) {
                        cookieValor = cookieValor + (Integer.parseInt(produto[0]) + SEPARADOR_CAMPOS + Integer.parseInt(produto[1]));
                    }
                }
            }
        }
        return cookieValor;
    }
          
          
            public static List<carrinhocompras> obterCarrinhoCompras(String cookieValor) {
        if (cookieValor == null || cookieValor.trim().length() == 0) {
            return new ArrayList<carrinhocompras>();
        }
        List<carrinhocompras> resultado = new ArrayList<carrinhocompras>();
        String[] produtos = cookieValor.split(SEPARADOR_REGISTRO);
        if (produtos == null || produtos.length == 0) {
            produtos = new String[]{cookieValor};
        }
        ProdutoNegocio produtoNegocio = new ProdutoNegocio();
        for (String p : produtos) {
            String[] produto = p.split(SEPARADOR_CAMPOS);
            carrinhocompras CarrinhoCompras = new carrinhocompras();
            CarrinhoCompras.setProduto(produtoNegocio.obterProduto(Integer.parseInt(produto[0])));
            CarrinhoCompras.setQuantidade(Integer.parseInt(produto[1]));
            resultado.add(CarrinhoCompras);
        }
        return resultado;
    }
    
}
