<%-- 
    Document   : alterar
    Created on : 29/09/2018, 20:19:13
    Author     : amaaa
--%>

<%@page import="modelo.categoria.Categoria"%>
<%@include file="../cabecalho.jsp" %>

<%            
            if(perfil.equals("funcionario")) { %> 
            <center>
<div id="titulo">Cadastro de Categorias:</div>
<% Categoria categoria = (Categoria) request.getAttribute("categoria"); %>
<% if (categoria != null) {%>
<div class="container">
<form class="form-horizontal" action="AlterarCategoriaServlet" method="post">
    <p><div class="campo"><input class="form-control" type="text" name="id" value="<%= categoria.getId()%>"  readonly="readonly"/></div></p>
    <p> <div class="campo"><input class="form-control" type="text" name="descricao" value="<%= categoria.getDescricao()%>" /></div></p>
    <br> <div class="controles"> <a class="btn btn-default" href="ListarCategoriaServlet" >Voltar</a> <button type="submit" class="btn btn-success" />Salvar</button> </div>
</form>
</div>
<% }%>

<% } %> <br><br> </center>
<%@include file="../rodape.jsp" %>