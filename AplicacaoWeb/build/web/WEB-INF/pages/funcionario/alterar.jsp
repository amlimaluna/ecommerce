<%-- 
    Document   : alterar
    Created on : 28/09/2018, 21:43:21
    Author     : amaaa
--%>

<%@page import="modelo.funcionario.Funcionario"%>
<%@include file="../cabecalho.jsp" %>
<center>
<%            
            if(perfil.equals("funcionario")) { %> 
<div id="titulo">Cadastro de Funcionários:</div>
<% Funcionario funcionario = (Funcionario) request.getAttribute("funcionario"); %>
<% if (funcionario != null) {%>

    <div class="container">
<form class="form-horizontal" action="AlterarFuncionarioServlet" method="post">

<p><div class="campo"><input class="form-control" type="text" name="nome" value="<%= funcionario.getNome()%>" /></div> </p>

<p><div class="campo"><input class="form-control" type="text" name="login" value="<%= funcionario.getLogin()%>" readonly="readonly" /></div> </p>
 
<p><div class="campo"><input class="form-control" type="password" name="senha" value="<%= funcionario.getSenha()%>" /></div> </p>
 
<p> <div class="campo"><input class="form-control" type="text" name="salario" value="<%= funcionario.getSalario()%>" /></div> </p>
<div class="controles"> <a class="btn btn-default" href="ListarFuncionarioServlet" >Voltar</a> <button class="btn btn-success" type="submit"/>Salvar</button></div>
</form>
    </div> <br><br>
<% }%>
<% } %> </center>
<%@include file="../rodape.jsp" %>