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
            int mes1=0;
            int c =0;
            double saldodevedor=0;
            double juros=0;
            double prestacao=0;
             try{
                 mes1 = Integer.parseInt(request.getParameter("mes"));
                 c = Integer.parseInt(request.getParameter("c"));
                 saldodevedor = Double.parseDouble(request.getParameter("saldodevedor"));
                 juros = Double.parseDouble(request.getParameter("juros"));
                 prestacao = Double.parseDouble(request.getParameter("prest"));
             }catch(Exception e){}
        %>
        <form>
        Informe a quantidade de vezes que deseja parcelar: <input type="number" name="mes"/></br>
        Informe o valor do empréstimo:<input type="number" name="saldodevedor"/></br>
        Informe a Taxa de juros (%): <input type="number" name="juros"/></br>
        </br>
        <input type="submit" value="Calcular">
        </form>
        <table border='1'>
            <tr>
                <th> Mês </th>
                <th> Saldo Devedor </th>
                <th> Amortização </th>
                <th> Juros </th>
                <th> Prestação </th>
            </tr>
            <%for(int i=0;i<=mes1; i++){%>
                
            <tr>
                <td align="center"> <%if(i == 0){%>
                    <%=i=0%>
                <%}else{%>
                    <%=  c= c+1%><%= "º"%>    </td>
                <%}%>
               <td align="center">   <%=saldodevedor%> </td>
                <td align="center"> - </td>
                <td align="center">  <%=juros%>   </td>
                <td align="center">  <%=prestacao%>    </td> 
            </tr>
            <%}%>
            <tr>
                <th>Total: </th>
                <th>      </th>
                <th>      </th>
                <th>      </th>
                <th>      </th>
            </tr>
        </table>           
    </body>
</html>
               