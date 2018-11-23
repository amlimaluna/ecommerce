<%@page import="modelo.carrinhodecompras.carrinhocompras"%>
<%@page import="java.util.List"%>
<%@page import="modelo.produto.Produto"%>

<html lang="en">

    <head>


        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>SMD E-commerce</title>

        <!-- Bootstrap core CSS -->
        <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

        <!-- Custom styles for this template -->
        <link href="css/home.css" rel="stylesheet">

    </head>

    <body>


        <!-- Navigation -->
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top" > 
            <div class="container">
                <a class="navbar-brand" href="#"><img src="images/logoteste.png" width="200px"></a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarResponsive">

                    <% String perfil = (String) session.getAttribute("perfil");
                        String login = (String) session.getAttribute("login");
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

                    <% } %>


                </div>
            </div>
        </nav>


        <!-- Page Content -->
        <div class="container" style="margin-top:100px;">


            <%
                if (request.getAttribute("mensagem") != null) {
            %>
            <div class="mensagem"><%= request.getAttribute("mensagem").toString()%></div>
            <br><br>
            <%
                }
            %>


            <div class="row">

                <%
                    List<Produto> produtos = (List<Produto>) request.getAttribute("produtos");
                    for (Produto p : produtos) {
                %>

                <div class="col-lg-4 col-md-6 mb-4">

                    <div class="card h-100">
                        <a href="#"><img class="card-img-top" src="http://placehold.it/700x400" alt=""></a>
                        <div class="card-body">
                            <h4 class="card-title">
                                <a href="#"><%= p.getDescricao()%></a>
                            </h4>
                            <h5>R$<%= p.getPreco()%></h5>
                            <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Amet numquam aspernatur!</p>
                            <form action="AdicionarCarrinhoComprasServlet">
                                <input type="hidden" name="produtoId" value="<%= p.getId()%>" />
                                Quantidade: <br><input class="form-control" id="exampleFormControlSelect1" style="width:100px; float:left;" type="number" name="quantidade" step="1" value="1" /> <input type="submit" class="btn btn-info" value="Adicionar" style="float:right;" />
                            </form>
                        </div>
                        <div class="card-footer">
                            <small class="text-muted">&#9733; &#9733; &#9733; &#9733; &#9734;</small>
                        </div>
                    </div>
                </div>
                <%
                    }
                %>


                <!-- /.container -->
            </div>

            <!-- /.row -->
            <br style="clear: both;"/>
            <div id="carrinho">
                <h2 style="text-transform: uppercase;"> <img src="images/carrinho.png" width="100px">Seu Carrinho de Compras: </h2>
                <br>
                 
                
                <%
                    List<carrinhocompras> carrinhoCompras = (List<carrinhocompras>) request.getAttribute("carrinhoCompras");
                    if (carrinhoCompras==null || carrinhoCompras.size()==0) {
                    %>  
                Seu carrinho de compras está vazio.
            <%
                    }
                    
                    if (carrinhoCompras != null && carrinhoCompras.size() > 0) {
                %>
 

                   
                    <%
                        double total = 0;
                        for (carrinhocompras cci : carrinhoCompras) {
                    %>

                    <h3><%= cci.getProduto().getDescricao()%></h3>
                    <h5>Preço <%= cci.getProduto().getPreco()%></h5>
                    <form action="AdicionarCarrinhoComprasServlet">
                        <input type="hidden" name="produtoId" value="<%= cci.getProduto().getId()%>" />
                        Unidade(s): <input type="number" class="form-control" style="width:100px" id="exampleFormControlSelect1" name="quantidade" step="1" value="<%= cci.getQuantidade()%>" /> 
                        <input type="submit" class="btn btn-info" value="Adicionar ou Atualizar" style="float:right; margin-right: 70%; margin-top: -38px; " />
                        <br><span>( Subtotal: <%= (cci.getProduto().getPreco() * cci.getQuantidade())%> )</span>
                    </form> <a href="RemoverCarrinhoComprasServlet?produtoId=<%= cci.getProduto().getId()%>"><img src="images/delete.png" width="20px" style="float:right"></a>
                 <br>

                <%
                        total += (cci.getQuantidade() * cci.getProduto().getPreco());
                    }
                %>
                <br><br>
                <h2><u><strong>Total: <%= String.valueOf(total)%></strong></u></h2>
                <%
                    }
                %>
                <% if (session.getAttribute("login") != null && session.getAttribute("perfil") != null && session.getAttribute("perfil").toString().equals("usuario")) {
                        if (carrinhoCompras.size()>0) {
                %>
                <br> <br> <br> <a href="FinalizarVendaServlet"> <button type="button" class="btn btn-primary">Finalizar Compra </button> </a>
                <%       }
                } else if (session.getAttribute("login") != null && session.getAttribute("perfil") != null && session.getAttribute("perfil").toString().equals("funcionario")) { %>
                <div> Você está logado como funcionário, para fazer compras precisa ser um usuário! </div>
                <% } else { %><br>
                <div><i>Você não está identificado</i></div>
                <% }%>
        
            </div> 
                <br><br><br>
            <!-- /.row -->


            <!-- Footer -->
            <footer class="py-5 bg-dark" style="width: 120%; margin-left: -10%;">
     
                    <p class="m-0 text-center text-white">SMD e-commerce &copy; 2018 &ensp; | &ensp; Developed by Amanda Lima</p>

            </footer>

            <!-- Bootstrap core JavaScript -->
            <script src="vendor/jquery/jquery.min.js"></script>
            <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    </body>
</html>