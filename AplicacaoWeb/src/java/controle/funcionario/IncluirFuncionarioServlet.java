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
 * @author amaaa
 */
public class IncluirFuncionarioServlet extends HttpServlet {

         protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
        // entrada
        String nome = request.getParameter("nome");
        String login = request.getParameter("login");
        String senha = request.getParameter("senha");
        double salario= Double.parseDouble(request.getParameter("salario"));
        // processamento
        FuncionarioNegocio funcionarioNegocio = new FuncionarioNegocio();
        boolean sucessoInserir = funcionarioNegocio.inserir(nome, login, senha, salario);
        
        // saída
        if (sucessoInserir) {
            request.setAttribute("tipo","success");
            request.setAttribute("mensagem", "Funcionário inserido com sucesso");
            RequestDispatcher rd = request.getRequestDispatcher("ListarFuncionarioServlet");
            rd.forward(request, response);
        } else {
            request.setAttribute("tipo","danger");
            request.setAttribute("mensagem", "Não foi possível inserir este funcionario");
            RequestDispatcher rd = request.getRequestDispatcher("WEB-INF/pages/funcionario/novoFuncionario.jsp");
            rd.forward(request, response);
        }
    }
    

}
