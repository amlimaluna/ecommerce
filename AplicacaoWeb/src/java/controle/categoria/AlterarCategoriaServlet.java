/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controle.categoria;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.categoria.CategoriaNegocio;

/**
 *
 * @author amaaa
 */
public class AlterarCategoriaServlet extends HttpServlet {


    protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // entrada
        int id= Integer.parseInt(request.getParameter("id"));
        String descricao = request.getParameter("descricao");
        
        // processamento
        CategoriaNegocio categoriaNegocio = new CategoriaNegocio();
        boolean sucessoAlterar = categoriaNegocio.alterar(id, descricao);
        // saída
        if (sucessoAlterar) {
            request.setAttribute("mensagem", "Categoria alterada com sucesso!");
        } else {
            request.setAttribute("mensagem", "Não foi possível alterar esta categoria");
        }
        RequestDispatcher rd = request.getRequestDispatcher("ListarCategoriaServlet");
        rd.forward(request, response);
    }
        
 }