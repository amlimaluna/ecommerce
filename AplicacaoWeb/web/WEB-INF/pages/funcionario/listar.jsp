<%-- 
    Document   : listar
    Created on : 28/09/2018, 22:21:24
    Author     : amaaa
--%>

<%@page import="java.util.List"%>
<%@page import="modelo.funcionario.Funcionario"%>
<%@include file="../cabecalho.jsp" %>

<%            
            if(perfil.equals("funcionario")) { %> 
            <center>
<div id="titulo">Cadastro de Funcionários:</div>
<br>
<a class="btn btn-primary" href="NovoFuncionarioServlet">Cadastrar novo funcionario</a> <br><br><br>
<% List<Funcionario> resultado = (List<Funcionario>) request.getAttribute("resultado"); %>
<% if (resultado != null && resultado.size() > 0) { %>
<table>
    <tr>
        <th>&nbsp;&nbsp;Login</th>
        <th>&nbsp;&nbsp;Nome</th>
        <th class="controles"></th>
    </tr>
    <% for (Funcionario item : resultado) {%>
    <tr>
        <td>&nbsp;&nbsp;<%= item.getLogin()%></td>
        <td>&nbsp;&nbsp;<%= item.getNome()%></td>
        <td>
           &nbsp;&nbsp;<a class="btn btn-warning"  href="ObterFuncionarioServlet?login=<%= item.getLogin()%>">Editar</a>&nbsp;<a class="btn btn-danger"  href="ExcluirFuncionarioServlet?login=<%= item.getLogin()%>">Excluir</a>&nbsp;&nbsp;</td>
        
    </tr>
    <% } %>
</table> </center>
<% }%>
<br><br>
<% }%>
<%@include file="../rodape.jsp" %>