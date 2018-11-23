<%-- 
    Document   : listar
    Created on : 19/11/2018, 15:14:11
    Author     : amaaa
--%>

<%@page import="modelo.venda_produto.VendaProduto"%>
<%@page import="java.util.List"%>
<%@page import="modelo.venda.Venda"%>
<%@include file="../cabecalho.jsp" %>

      
<center>            <%            
            if(perfil.equals("funcionario")) { %> 
<div id="titulo">Cadastro de Vendas:</div> <% } %>

     <%            
            if(perfil.equals("usuario")) { %> 
<div id="titulo">Minhas Compras:</div> <% } %>

<br><br>

<% List<Venda> resultado = (List<Venda>) request.getAttribute("resultado"); %>
<% if (resultado != null && resultado.size() > 0) { %>
<table>
    <tr>
         <% for (Venda item : resultado) {%>
         
        <th>&nbsp;&nbsp;Id</th>
        <th>&nbsp;&nbsp;Cliente</th>
         <th>&nbsp;&nbsp;Produtos</th>
        <th>&nbsp;&nbsp;Quantidade</th>
        <th></th>
    </tr>

    <tr> 
       
        <td>&nbsp;&nbsp;<%= item.getId()%></td>
        <% double quantidade = 0; 
        String produtos= "";
        for (VendaProduto vp : item.getProdutos()) {
            quantidade += vp.getQuantidade();
            produtos = produtos + vp.getProduto().getDescricao() + ",<br> ";
        }
                    
        
        %>
        <td>&nbsp;&nbsp;<%= item.getUsuarioLogin() %></td>
        <td>&nbsp;&nbsp;<%= produtos %> </td>
        <td>&nbsp;&nbsp;<%= quantidade %></td>
               
                  
                    
            <%            
            if(perfil.equals("funcionario")) { %> 
              <td>&nbsp;<a class="btn btn-danger" href="ExcluirVendaServlet?id=<%= item.getId()%>">Excluir</a>&nbsp;&nbsp;</td>
         <% } %>
    
    </tr>
    <% }%> 
</table> <br><br></center>
    

<% }%>
<%@include file="../rodape.jsp" %>