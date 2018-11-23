
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String login = (String) session.getAttribute("login");
    if (login == null) {
        request.setAttribute("mensagem", "Você não possui um login válido");
        RequestDispatcher rd = request.getRequestDispatcher("/index.jsp");
        rd.forward(request, response);
    }
%>
<!DOCTYPE html>
<html lang="en">

    <head>


        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>SMD E-commerce</title>

        <!-- Bootstrap core CSS -->
        <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        

      <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
      <link href='https://fonts.googleapis.com/css?family=Roboto:100' rel='stylesheet' type='text/css'> 
      <!-- Custom styles for this template -->
        <link href="css/principal.css" rel="stylesheet">



    </head>

    <body>


        <!-- Navigation -->
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top" > 
            <div class="container">
                <a class="navbar-brand" href="InicioServlet"><img src="images/logoteste.png" width="200px"></a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarResponsive">

                    <% String perfil = (String) session.getAttribute("perfil");

                        if (login == null) { %> 
                    <ul class="navbar-nav ml-auto">

                        <li class="nav-item">
                            <a class="nav-link" href="login.jsp">Entrar

                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="novoUsuario.jsp">Registrar</a>
                        </li>

                    </ul>
                    <% }%> 

                    <% if (login != null && perfil.equals("usuario")) { %>

                    <ul class="navbar-nav ml-auto">

                        <li class="nav-item">
                            <a class="nav-link" href="VerUsuarioServlet">Meus Dados     
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="VerVendasUsuario">Minhas Compras</a>
                        </li>

                        <li class="nav-item">
                            <a class="nav-link" href="LogoutServlet">Sair</a>
                        </li>

                    </ul>              
                    <% } %>

                    <% if (login != null && perfil.equals("funcionario")) { %>

                    <ul class="navbar-nav ml-auto">

                        <li class="nav-item">
                            <a class="nav-link" href="VerFuncionarioServlet">Meus Dados     
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="ListarUsuarioServlet">Usuários</a>
                        </li>

                        <li class="nav-item">
                            <a class="nav-link" href="ListarFuncionarioServlet">Funcionários</a>
                        </li>

                        <li class="nav-item">
                            <a class="nav-link" href="ListarCategoriaServlet">Categorias</a>
                        </li>

                        <li class="nav-item">
                            <a class="nav-link" href="ListarProdutoServlet">Produtos</a>
                        </li>
                        
                        <li class="nav-item">
                         <a class="nav-link" href="VerVendasFuncionario">Vendas</a>
                       </li>
                       
                        <li class="nav-item">
                            <a class="nav-link" href="LogoutServlet">Sair</a>
                        </li>

                    </ul>       
                 

                </div>
            </div>

            <% }%>
               </nav>
               <br><br><br><br><br>
    <center>
                                                       <%
            String mensagem = (String) request.getAttribute("mensagem");
            if (mensagem != null) {
        %>
        <div id="msg"><b><%= mensagem%></b></div>
        <%
            }
        %>
            </center>
    <br>
