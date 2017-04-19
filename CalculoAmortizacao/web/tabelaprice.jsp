<%@page import="java.text.NumberFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tabela Price</title>
    </head>
    <body>
        <h1>Tabela Price</h1>
        <%
            double juros=0;
            double valor =0;
            int parcela=0;
            try{
                 juros = Double.parseDouble(request.getParameter("juros"));
                 juros = juros/100;
                 parcela = Integer.parseInt(request.getParameter("parcela"));
                 valor = Double.parseDouble(request.getParameter("valor"));
            }catch(Exception e){
            }
        %>
        <form>
            Digite a taxa de juros em %: <input step="0.01" type="number" name="juros"/></br>
        Digite o numero de parcelas:<input type="number" name="parcela"/></br>
        Valor do Financiamento: <input type="number" name="valor"/></br>
        
        <br />
        <input type="submit" value="Calcular">
        
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
                P = valor * ((Math.pow((juros + 1), parcela)*juros) / (Math.pow(juros + 1,parcela) - 1));
                for(int k=1;k<=parcela; k++){
                   J = valor * juros;
                   A = P - J;
                   valor = valor - A;
                   if(valor < 0) valor = 0;
                   
                %>
            <tr>
                <td align="center"> <%if(k == 0){%>
                    <%=k=0%>
                <%}else{%>
                    <%=  k%><%= "º"%>    </td>
                <%}
                NumberFormat z = NumberFormat.getCurrencyInstance();
                %>
               <td align="center"> <%= z.format(valor)%> </td>
               <td align="center">  <%= z.format(A) %> </td>
                <td align="center"> <%= z.format(J)%>   </td>
                <td align="center">  <%= z.format(P) %>    </td> 
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
               