/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controle.venda;

import java.io.IOException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import modelo.carrinhodecompras.carrinhocompras;
import modelo.carrinhodecompras.carrinhocomprasNegocio;
import modelo.venda.VendaDAO;
import modelo.venda.VendaNegocio;

/**
 *
 * @author amaaa
 */
public class FinalizarVendaServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        HttpSession session = request.getSession();
        String usuarioLogin = (String) session.getAttribute("login");

        String cookieValor = "";
        Cookie cookie = null;
        Cookie[] cookies = request.getCookies();
        for (int i = 0; cookies != null && i < cookies.length; i++) {
            Cookie c = cookies[i];
            if (c.getName().equals("pw1.cc")) {
                cookie = c;
                cookieValor = c.getValue();
                break;
            }
        }
        List<carrinhocompras> carrinhoCompras = carrinhocomprasNegocio.obterCarrinhoCompras(cookieValor);
        
        VendaNegocio vendaNegocio = new VendaNegocio ();
        boolean sucesso = false;
        try {
            int vendaId = vendaNegocio.obterId();
            sucesso = vendaNegocio.inserir(vendaId, usuarioLogin);
            for (int i = 0; i < carrinhoCompras.size(); i++) {
                carrinhocompras c = carrinhoCompras.get(i);
                vendaNegocio.inserirVendaProduto(vendaId, c.getProduto().getId(), c.getQuantidade());
            }
        } catch (Exception ex) {
            sucesso = false;
        }
        
        if (sucesso) {
            request.setAttribute("mensagem", "Compra finalizada com sucesso! Aproveite seus produtos e volte sempre.");
            cookie.setValue("");
            response.addCookie(cookie);
            request.getRequestDispatcher("InicioServlet").forward(request, response);
        } else {
            request.setAttribute("mensagem", "Não foi possível realizar esta compra.");
            request.getRequestDispatcher("InicioServlet").forward(request, response);
        }
    }

}
