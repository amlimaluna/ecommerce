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
public class ExcluirFuncionarioServlet extends HttpServlet {
    
    protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String login = request.getParameter("login");
        FuncionarioNegocio funcionarioNegocio = new FuncionarioNegocio();
        boolean sucessoExcluir = funcionarioNegocio.excluir(login);
        if (sucessoExcluir) {
            request.setAttribute("mensagem", "Funcionário excluído com sucesso");
        } else {
            request.setAttribute("mensagem", "Não foi possível excluir este funcionário");
        }
        RequestDispatcher rd = request.getRequestDispatcher("ListarFuncionarioServlet");
        rd.forward(request, response);
    }
    
}
