/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controle.funcionario;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.funcionario.FuncionarioNegocio;
/**
 *
 * @author aluno
 */
public class AlterarFuncionarioServlet extends HttpServlet {
    
    
       protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // entrada
        String nome = request.getParameter("nome");
        String login = request.getParameter("login");
        String senha = request.getParameter("senha");
        double salario= Double.parseDouble(request.getParameter("salario"));
        
        // processamento
        FuncionarioNegocio funcionarioNegocio = new FuncionarioNegocio();
        boolean sucessoAlterar = funcionarioNegocio.alterar(nome, login, senha, salario);
        // saída
        if (sucessoAlterar) {
            request.setAttribute("mensagem", "Funcionário alterado com sucesso!");
        } else {
            request.setAttribute("mensagem", "Não foi possível alterar este funcionário!");
        }
        RequestDispatcher rd = request.getRequestDispatcher("ListarFuncionarioServlet");
        rd.forward(request, response);
    }

    
}
