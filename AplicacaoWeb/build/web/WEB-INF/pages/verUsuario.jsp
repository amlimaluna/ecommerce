<%-- 
    Document   : verUsuario
    Created on : 19/09/2018, 14:50:53
    Author     : leoomoreira
--%>
<%@include file="cabecalho.jsp" %>
<center>
    <div id="titulo">Seus Dados:</div><br><br>
<jsp:useBean id="usuario" class="modelo.usuario.Usuario" scope="request" />



    <div class="container">    
                <div class="jumbotron">
                  <div class="row">
                      <div class="col-md-4 col-xs-12 col-sm-6 col-lg-4">
                          <img src="https://www.svgimages.com/svg-image/s5/man-passportsize-silhouette-icon-256x256.png" alt="stack photo" class="img">
                      </div>
                      <div class="col-md-8 col-xs-12 col-sm-6 col-lg-8">
                          <div class="container" style="border-bottom:1px solid black">
                             <h2>
                           <jsp:getProperty name="usuario" property="nome" /></h2>
                          </div>
                            <hr>
                          <ul class="container details">
                              <li><p><i class="fa fa-phone"></i> +91 90000 00000</p></li>
                            <li><p><i class="fa fa-address-card-o"></i> <jsp:getProperty name="usuario" property="login" /></p></li>
                            <li><p><i class="fa fa-map-marker"></i> Fortaleza, Ce</p></li>
                            <li><p><i class="fa fa-lock"></i> <jsp:getProperty name="usuario" property="senha" /></p></p></a>
                          </ul>
                      </div>
                  </div>
                </div>


                 
        
            
    
                       
 <br><br>
</center>

<%@include file="rodape.jsp" %>

