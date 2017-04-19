<%@page import="java.text.NumberFormat"%>
<%@page import="java.text.DecimalFormat"%>
<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>Amortização Constante</title>

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
                            <h1>Amortização Constante</h1>             
                        </div>
                    </div>
                </div>
            </div> 
        </header>
        <section class="success" id="about">
            <div class="container">
                <div class="row">

                    <%
                        DecimalFormat df = new DecimalFormat("00.00");

                        int mes = 0;
                        double saldo = 0;
                        double juros = 0;
                        double A = 0;
                        try {
                            mes = Integer.parseInt(request.getParameter("meses"));
                            saldo = Double.parseDouble(request.getParameter("saldodevedor"));
                            juros = Double.parseDouble(request.getParameter("juros"));
                        } catch (Exception e) {
                        }

                    %>
                    <form>
                        Número de parcelas:<input type="text" name="meses" style="color:black"></br>
                        Valor do empréstimo: <input type="text" name="saldodevedor" style="color:black"></br>
                        Taxa de juros(%): <input type="text" name="juros" style="color:black"></br>
                        </br>
                        <input type="submit" value="Calcular Amortização" style="color:black"/>
                    </form>
                    </br>

                    <table border="1">
                        <tr>
                            <th>Meses</th>
                            <th>Saldo Devedor($)</th>
                            <th>Amortização($)</th>
                            <th>Juros($)</th>
                            <th>Prestação(R$)</th>
                        </tr>

                        <%
                            double S = saldo;
                            double J = 0;
                            double P = 0;
                            NumberFormat z = NumberFormat.getCurrencyInstance();
                            for (int i = 1; i <= mes; i++) {%>
                                juros = juros / 100;
                                A = saldo / mes;
                                J = saldo * juros;
                                S = S - A;
                                P = J + A;
                            
                        <tr>
                            <td align="center"><%= i%><%= "º"%></td>
                            <td align="center"><%= z.format(S)%></td>
                            <td align="center"><%= z.format(A)%></td>
                            <td align="center"><%= z.format(J)%></td>
                            <td align="center"><%= z.format(P)%></td>
                        </tr>
                        <%}%>                        
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
