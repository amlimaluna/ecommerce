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
import modelo.funcionario.Funcionario;
import modelo.funcionario.FuncionarioNegocio;

/**
 *
 * @author aluno
 */
public class ObterFuncionarioServlet extends HttpServlet {
   
      protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String login = request.getParameter("login");
        FuncionarioNegocio funcionarioNegocio = new FuncionarioNegocio();
        Funcionario funcionario = funcionarioNegocio.obterFuncionario(login);
        request.setAttribute("funcionario", funcionario);
        RequestDispatcher rd = request.getRequestDispatcher("WEB-INF/pages/funcionario/alterar.jsp");
        rd.forward(request, response);
    }
}
