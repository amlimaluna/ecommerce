<%-- 
    Document   : novaCategoria
    Created on : 01/10/2018, 15:32:02
    Author     : amaaa
--%>
<%@include file="../cabecalho.jsp" %>
<%            
            if(perfil.equals("funcionario")) { %> 
            <center>
            <div class="container">
           <div id="titulo">Cadastre uma nova categoria:</div> <br>
        <form class="form-horizontal" action="NovaCategoriaServlet" method="post">
            <p> <input class="form-control" type="text" name="descricao" placeholder="Descrição da categoria" /> </p> <br>

            <div> <a class="btn btn-default" href="ListarCategoriaServlet" >Voltar</a> <button type="submit" class="btn btn-success" /> Adicionar </button> </div>           
        </form>
 </div>
                <% } %> <br><br> </center>

<%@include file="../rodape.jsp" %>
