<%-- 
    Document   : listar
    Created on : 29/09/2018, 20:19:22
    Author     : amaaa
--%>
<%@page import="java.util.List"%>
<%@page import="modelo.categoria.Categoria"%>
<%@include file="../cabecalho.jsp" %>
<%            
 
            if(perfil.equals("funcionario")) { %> 
            <center>
<div id="titulo">Cadastro de Categorias:</div>
<br>
<a class="btn btn-primary" href="NovaCategoriaServlet">Cadastrar nova categoria</a><br>
    <br> <br>
<% List<Categoria> resultado = (List<Categoria>) request.getAttribute("resultado"); %>
<% if (resultado != null && resultado.size() > 0) { %>
<table>
    <tr>
        <th>&nbsp;&nbsp;Id</th>
        <th>&nbsp;&nbsp;Descrição</th>
        <th class="controles"></th>
    </tr>
    <% for (Categoria item : resultado) {%>
    <tr>
        <td>&nbsp;&nbsp;<%= item.getId()%></td>
        <td>&nbsp;&nbsp;<%= item.getDescricao()%></td>
        <td>&nbsp;&nbsp;<a class="btn btn-warning"  href="ObterCategoriaServlet?id=<%= item.getId()%>">Editar</a>&nbsp;<a class="btn btn-danger"  href="ExcluirCategoriaServlet?id=<%= item.getId()%>">Excluir</a>&nbsp;&nbsp;</td>
       </tr>
    <% } %>
</table> <br><br>

<% }%>


<% } %> </center>
<%@include file="../rodape.jsp" %>