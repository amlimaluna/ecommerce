<%-- 
    Document   : listar
    Created on : 01/10/2018, 14:44:40
    Author     : amaaa
--%>

<%@page import="java.util.List"%>
<%@page import="modelo.produto.Produto"%>
<%@include file="../cabecalho.jsp" %>

<%            
            if(perfil.equals("funcionario")) { %> 
            <center>
<div id="titulo">Cadastro de Produtos:</div>
<br>
<a class="btn btn-primary" href="NovoProdutoServlet">Cadastrar novo Produto</a> <br><br><br>
<% List<Produto> resultado = (List<Produto>) request.getAttribute("resultado"); %>
<% if (resultado != null && resultado.size() > 0) { %>
<table>
    <tr>
        <th>&nbsp;&nbsp;Id</th>
        <th>&nbsp;&nbsp;Descrição</th>
        <th class="controles"></th>
    </tr>
    <% for (Produto item : resultado) {%>
    <tr>
        <td>&nbsp;&nbsp;<%= item.getId()%></td>
        <td>&nbsp;&nbsp;<%= item.getDescricao()%></td>
        <td>
             &nbsp;&nbsp;<a class="btn btn-warning" href="ObterProdutoServlet?id=<%= item.getId()%>">Editar</a>&nbsp;<a class="btn btn-danger" href="ExcluirProdutoServlet?id=<%= item.getId()%>">Excluir</a>&nbsp;&nbsp;</td>
      
    
    </tr>
    <% } %>
</table>
    
<% }%>
<% }%> <br><br> </center>
<%@include file="../rodape.jsp" %>