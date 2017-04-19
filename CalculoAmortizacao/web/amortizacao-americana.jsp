<%-- 
    Document   : amortizacao-americana
    Created on : 12/04/2017, 22:42:33
    Author     : Eder
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Amortização Americana</title>
    </head>
    <body>
        <h1>Calculadora de Amortização Americana</h1>
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
    </body>
</html>
               