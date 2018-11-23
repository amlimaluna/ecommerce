/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controle.venda;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.venda.VendaNegocio;
import modelo.venda.Venda;

/**
 *
 * @author amaaa
 */
public class VerVendasFuncionario extends HttpServlet {

            protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        VendaNegocio vendaNegocio = new VendaNegocio();
        List<Venda> resultado = vendaNegocio.obterTodas();
        request.setAttribute("resultado", resultado);
        RequestDispatcher rd = request.getRequestDispatcher("WEB-INF/pages/vendas/listar.jsp");
        rd.forward(request, response);
    }
}
