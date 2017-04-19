<%@page import="java.text.NumberFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tabela Price</title>

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">

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
                            <h1>Tabela Price</h1>
                        </div>
                    </div>
                </div>
            </div> 
        </header>

        <section class="success" id="about">
            <div class="container">
                <div class="row">
                    <%
                        double juros = 0;
                        double valor = 0;
                        int parcela = 0;
                        try {
                            juros = Double.parseDouble(request.getParameter("juros"));
                            juros = juros / 100;
                            parcela = Integer.parseInt(request.getParameter("parcela"));
                            valor = Double.parseDouble(request.getParameter("valor"));
                        } catch (Exception e) {
                        }
                    %>
                    <center>
                        <form style="margin-top: -10%">
                            Digite a taxa de juros em %: <input step="0.01" type="number" name="juros" style="color:black"/><br /><br />
                            Digite o numero de parcelas:<input type="number" name="parcela" style="color:black" /><br /><br />
                            Valor do Financiamento: <input type="number" name="valor" style="color:black" /><br /><br />

                            <br />
                            <input type="submit" value="Calcular" style="color:black">

                            <br />
                        </form>
                        <br />
                        <table border='1'>
                            <tr>
                                <th> Mês </th>
                                <th> Saldo Devedor </th>
                                <th> Amortização </th>
                                <th> Juros </th>
                                <th> Prestação </th>
                            </tr>
                            <%
                                double P = 0;
                                double J = 0;
                                double A = 0;
                                double AT = 0;
                                double JT = 0;
                                NumberFormat z = NumberFormat.getCurrencyInstance();
                                P = valor * ((Math.pow((juros + 1), parcela) * juros) / (Math.pow(juros + 1, parcela) - 1));
                                for (int k = 1; k <= parcela; k++) {
                                    J = valor * juros;
                                    A = P - J;
                                    valor = valor - A;
                                    JT = JT + J;
                                    AT = AT + A;
                                    if (valor < 0) {
                                        valor = 0;
                                    }

                            %>
                            <tr>
                                <td align="center"> <%if (k == 0) {%>
                                    <%=k = 0%>
                                    <%} else {%>
                                    <%=  k%><%= "º"%>    </td>
                                    <%}
                                        
                                    %>
                                <td align="center"> <%= z.format(valor)%> </td>
                                <td align="center">  <%= z.format(A)%> </td>
                                <td align="center"> <%= z.format(J)%>   </td>
                                <td align="center">  <%= z.format(P)%>    </td> 
                            </tr>                            
                            <%}%>
                            <tr>

                                <th>Total:
                                <td align="center"><%=z.format(valor)%></td>
                                <td align="center"><%=z.format(AT)%></td>
                                <td align="center"><%=z.format(JT)%></td>
                                <td align="center"><%=z.format(P*12)%></td>

                                </th>

                            </tr>
                        </table>
                    </center>
                </div>
            </div>
        </div>
    </section>


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
