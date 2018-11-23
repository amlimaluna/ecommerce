<%-- 
    Document   : novoProduto
    Created on : 01/10/2018, 19:05:45
    Author     : amaaa
--%>
<%@include file="../cabecalho.jsp" %>
<%@page import="java.util.List"%>
<%@page import="modelo.categoria.Categoria"%>

<%            
            if(perfil.equals("funcionario")) { %> 
            <center> 
                <div class="container">
<div id="titulo">Adicionar produto:</div>


<form class="form-horizontal" action="IncluirProdutoServlet" id="incluirproduto">
    <p> <input class="form-control" type="text" name="descricao" placeholder="Descrição" /> </p> <br>
    <p> <input class="form-control" type="text" name="preco" placeholder="Preço" /> </p> <br>
    
    <% List<Categoria> resultado = (List<Categoria>) request.getAttribute("resultado"); %>
        <% if (resultado != null && resultado.size() > 0) { %>
        <select name="categoria_id" id="appearance-select" form="incluirproduto">
            <% for (Categoria item : resultado) {%>
                <option value="<%= item.getId()%>"> &nbsp; <%= item.getDescricao()%> </option>
       
    <% } %>
    </select>
   
    <br> <br><div><a class="btn btn-default" href="ListarProdutoServlet" >Voltar</a> <button type="submit" class="btn btn-success" /> Adicionar </button></div>  
</form>
 <% }%>
</div>
 <% } %> <br><br> </center>
<%@include file="../rodape.jsp" %>
