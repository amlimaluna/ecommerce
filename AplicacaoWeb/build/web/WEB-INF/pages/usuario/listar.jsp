<%-- 
    Document   : listar
    Created on : 23/09/2018, 10:25:15
    Author     : leoomoreira
--%>

<%@page import="java.util.List"%>
<%@page import="modelo.usuario.Usuario"%>
<%@include file="../cabecalho.jsp" %>
<center>
    <div id="titulo">Cadastro de Usuários:</div><br><br>
<% List<Usuario> resultado = (List<Usuario>) request.getAttribute("resultado"); %>
<% if (resultado != null && resultado.size() > 0) { %>
<table>
    <tr>
        <th>&nbsp;&nbsp;Login</th>
        <th>&nbsp;&nbsp;Nome</th>
        <th class="controles"></th>
    </tr>
    <% for (Usuario item : resultado) {%>
    <tr>
        <td>&nbsp;&nbsp;<%= item.getLogin()%></td>
        <td>&nbsp;&nbsp;<%= item.getNome()%></td>
        <td>
          &nbsp;&nbsp;  <a class="btn btn-warning" href="ObterUsuarioServlet?login=<%= item.getLogin()%>">Editar</a>&nbsp;<a class="btn btn-danger" href="ExcluirUsuarioServlet?login=<%= item.getLogin()%>">Excluir</a>&nbsp;&nbsp;</td>
        
    </tr>
    <% } %>
    </table></center> <br><br>
<% }%>
<%@include file="../rodape.jsp" %>