/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controle.inicio;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.carrinhodecompras.carrinhocompras;
import modelo.carrinhodecompras.carrinhocomprasNegocio;
import modelo.produto.Produto;
import modelo.produto.ProdutoNegocio;
/**
 *
 * @author amaaa
 */
public class InicioServlet extends HttpServlet {

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
        ProdutoNegocio produtoNegocio = new ProdutoNegocio();
        List<Produto> produtos = produtoNegocio.obterTodos();
        request.setAttribute("produtos", produtos);

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
        request.setAttribute("carrinhoCompras", carrinhoCompras);

        if (cookie == null) {
            cookie = new Cookie("pw1.cc", "");
            cookie.setMaxAge(Integer.MAX_VALUE);
            response.addCookie(cookie);
        }

        request.getRequestDispatcher("index.jsp").forward(request, response);
    }

}
