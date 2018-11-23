<%-- 
    Document   : index
    Created on : 12/09/2018, 15:28:30
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
          <link rel="stylesheet" href="css/estilo.css">
         <link href='https://fonts.googleapis.com/css?family=Roboto:100' rel='stylesheet' type='text/css'>
        <title>SMD e-commerce - Login</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
        
       
<div class="main">
        

     <div class="container">
         
                
    <div class="middle"> 
            
             <div id="login">
             
             <fieldset class="clearfix">
                    <center>
                        <h1>faça seu login:</h1><br>
                        
                                        <%
            String mensagem = (String) request.getAttribute("mensagem");
            if (mensagem != null) {
        %>
        <div id="msg"><b><%= mensagem%></b></div>
        <%
            }
        %>
             <form action="LoginServlet" method="post">
            <br>
            <p> <span class="fa fa-user"></span><input type="text" name="login" class="campo" Placeholder="Login" required/></p> <br>
            <p> <span class="fa fa-lock"></span> <input type="password" name="senha" class="campo"  Placeholder="Senha" required/></p>
            <div id="perfil">  <input type="radio" name="perfil" value="usuario">Usuário
                <input type="radio" name="perfil" value="funcionario">Funcionário</div> <br><br>
            <div><input type="submit" class="campo" value="Entrar" /></div>
           </fieldset>
             <div class="clearfix"></div>
 
             </form>
        <br><br>
        <div><a href="novoUsuario.jsp" style="font-size: 15px; ">NÃO TEM CONTA? <br><b>RESGISTRE-SE AGORA!</b></a></div>

        
         </div>
                <div class="logo"> <img src="images/smd.png" width=500px" style="margin-top: 50px;" >

                <div class="clearfix"></div>
                </div>
            </div>
        </center>
</div>
     </div>

    </body>
</html>
