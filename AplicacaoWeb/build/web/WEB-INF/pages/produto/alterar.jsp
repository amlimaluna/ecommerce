<%-- 
    Document   : alterar
    Created on : 01/10/2018, 14:48:23
    Author     : amaaa
--%>

<%@page import="modelo.produto.Produto"%>
<%@include file="../cabecalho.jsp" %>

<%            
            if(perfil.equals("funcionario")) { %> 
            <center>
<div id="titulo">Altere seu produto:</div>
<% Produto produto = (Produto) request.getAttribute("produto"); %>
<% if (produto != null) {%>
<div class="container">
    <form class="form-horizontal" action="AlterarProdutoServlet" method="post">

        <p><div class="campo"><input class="form-control" type="text" name="id" value="<%= produto.getId()%>"  readonly="readonly"/></div></p>
    
         <p><div class="campo"><input class="form-control" type="text" name="descricao" value="<%= produto.getDescricao()%>" /></div></p>

         <p><div class="campo"><input class="form-control" type="text" name="preco" value="<%= produto.getPreco()%>" /></div></p>

         <p><div class="campo"><input class="form-control" type="number" name="categoria_id" value="<%= produto.getCategoriaId()%>" /></div></p>


<div class="controles"> <a class="btn btn-default" href="ListarProdutoServlet" >Voltar</a> <button class="btn btn-success" type="submit" />Salvar</button></div>
    </form>
</div>
<%}%>
<% }%> <br><br> </center>
<%@include file="../rodape.jsp" %>