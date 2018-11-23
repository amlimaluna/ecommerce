<%@include file="../cabecalho.jsp" %>
<%            
            if(perfil.equals("funcionario")) { %> 
            <center>
<div class="container">
           <div id="titulo">Adicione um novo funcionário:</div> <br>
        <form action="IncluirFuncionarioServlet" method="post">
            <p> <input class="form-control" type="text" name="nome" placeholder="Nome" /> </p> <br>
            <p> <input class="form-control" type="text" name="login" placeholder="Login" /> </p> <br>
            <p> <input class="form-control" type="password" name="senha" placeholder="Senha" /> </p> <br>
            <p> <input class="form-control" type="double" name="salario" placeholder="Salário" /> </p> <br>
            <div> <a class="btn btn-default" href="ListarFuncionarioServlet" >Voltar</a> <button type="submit" class="btn btn-success" />Adicionar</button></div>           
        </form>
           
 </div>
                <% } %> <br><br> </center>
<%@include file="../rodape.jsp" %>