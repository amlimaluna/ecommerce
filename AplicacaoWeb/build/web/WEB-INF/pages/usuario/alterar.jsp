<%-- 
    Document   : alterar
    Created on : 23/09/2018, 10:30:56
    Author     : leoomoreira
--%>

<%@page import="modelo.usuario.Usuario"%>
<%@include file="../cabecalho.jsp" %>
<center>
<div id="titulo">Cadastro de Usuários</div>
<% Usuario usuario = (Usuario) request.getAttribute("usuario"); %>
<% if (usuario != null) {%>

 <div class="container">
     <form class="form-horizontal" action="AlterarUsuarioServlet" method="post">
         <p> <div class="campo"><input class="form-control" type="text" name="nome" value="<%= usuario.getNome()%>" /></div> </p>
     <p> <div class="campo"><input class="form-control" type="text" name="login" value="<%= usuario.getLogin()%>" readonly="readonly" /></div></p>
<p> <div class="campo"><input class="form-control" type="password" name="senha" value="<%= usuario.getSenha()%>" /></div></p>
         <p> <div class="controles"> <a class="btn btn-default" href="ListarUsuarioServlet" >Voltar</a> <button class="btn btn-success" type="submit" />Salvar</button>
    </form>
 </div>
<% }%>
</center>
<br><br>
<%@include file="../rodape.jsp" %>