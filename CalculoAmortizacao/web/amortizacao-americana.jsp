<%-- 
    Document   : amortizacao-americana
    Created on : 12/04/2017, 22:42:33
    Author     : Eder
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
    <head>
         <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Amortização Americana</title>

    <!-- Bootstrap Core CSS -->
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Theme CSS -->
    <link href="css/freelancer.min.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic" rel="stylesheet" type="text/css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
    </head>
    <body>
        <%@include file="WEB-INF/jspf/menu.jspf"%>
        <header>
        <div class="container" id="maincontent" tabindex="-1">
            <div class="row">
                <div class="col-lg-12">
                    
                    <div class="intro-text">
                        <h1>Amortização Americana</h1>             
                    </div>
                </div>
            </div>
        </div> 
    </header>
        <section class="success" id="about">
        <div class="container">
            <div class="row">
        <%
            int mes=0;
            int c=0;
            double saldo=0;
            double juros=0;
            double prestacao =0;
            double prestacaofim =0;
             double total =0;
        try{
             mes = Integer.parseInt(request.getParameter("meses"));
             saldo = Double.parseDouble(request.getParameter("saldodevedor"));
             juros = Double.parseDouble(request.getParameter("juros"));
             prestacao = Double.parseDouble(request.getParameter("prestacao"));
             total = Double.parseDouble(request.getParameter("tot"));
           
        }catch(Exception e){}
        
        %>
        <form>
            Informe em quantas vezes irá pagar:<input type="number" name="meses"></br>
        Informe o valor do empréstimo: <input type="number" name="saldodevedor"></br>
        Informe a taxa de juros(%): <input type="number" name="juros"></br>
                </br>
        <input type="submit" value="Calcular Amortização"/>
        <input type="submit" value="Limpar"/>
        </form>
        </br>
        <!-- Daqui pra baixo a tabela é criada -->
        <table border="1">
           <tr>
                <th>Meses</th>
                <th>Saldo Devedor($)</th>
                <th>Amortização($)</th>
                <th>Juros(%)</th>
                <th>Prestação</th>
            </tr>
            
            <%for(int i=0;i<=mes;i++){%>
            
            <tr>
                <td align="center"><%if (i==0){%>
                <%=i=0%>
                <%}else{%>
                    <%= c+=1%><%= "º"%></td>
                <%}%>
                <td align="center"><%=saldo%></td>
                 <td align="center">-</td>
                 <td align="center"><%=prestacao = (saldo * juros)/100%></td>
                 <td align="center"><%=prestacao%></td>
            </tr>
            <%}%>
            <tr>
                <th>Total:
                    <td align="center">-</td>
                    <td align="center"><%=saldo%></td>
                    <td align="center"><%=prestacaofim = prestacao * mes%></td>
                    <td align="center"><%=total = saldo + prestacaofim%></td>
                    
                </th>
                
            </tr>
        </table>
                            </div>
            </div>
        </div>
    </section>
                    </footer>
        
    <!-- jQuery -->
    <script src="vendor/jquery/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="vendor/bootstrap/js/bootstrap.min.js"></script>

    <!-- Plugin JavaScript -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"></script>

    <!-- Contact Form JavaScript -->
    <script src="js/jqBootstrapValidation.js"></script>
    <script src="js/contact_me.js"></script>

    <!-- Theme JavaScript -->
    <script src="js/freelancer.min.js"></script> 
    </body>
</html>
               