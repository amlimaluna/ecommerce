<%-- 
    Document   : novoUsuario
    Created on : 17/09/2018, 14:37:17
    Author     : leoomoreira
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
 
         <link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
        <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
        <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <link rel="stylesheet" href="css/estilo.css">
        <link href='https://fonts.googleapis.com/css?family=Roboto:100' rel='stylesheet' type='text/css'>
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SMD e-commerce - Cadastro</title>
    </head>
    <body>
          
        <div class="main">
            <div class="container">
                <div class="middle">
                    <div id="login">
                    <fieldset class="clearfix">
            <center>
                <h1>Cadastro:</h1> <br>
        <form action="IncluirUsuarioServlet" method="post">
            <p> <span class="fa fa-address-card-o"></span> <input type="text" name="nome" class="campo" placeholder="Nome" /> </p> <br>
            <p> <span class="fa fa-user"></span> <input type="text" name="login" class="campo"  placeholder="Login" /> </p> <br>
            <p> <span class="fa fa-lock"></span> <input type="password" name="senha" class="campo"  placeholder="Senha" /> </p> <br>
            <div> <input type="submit" class="campo"  value="Salvar" /></div>
            </fieldset>
                    <div class="clearfix"></div>
                    
</form>
                <br><br>
                <div><a href="index.jsp" style="font-size: 15px;"><b>< VOLTAR</b></a></div>
        
                </div>
                    
                   <div class="logo"> <img src="images/smd.png" width=500px" style="margin-top: 50px;">

                <div class="clearfix"></div>
                </div>
            </div>
            </center> </div>
        </div>
        <%
            String mensagem = (String) request.getAttribute("mensagem");
            if (mensagem != null) {
        %>
        <div><b><%= mensagem%></b></div>
        <%
            }
        %>
    </body>
</html>
