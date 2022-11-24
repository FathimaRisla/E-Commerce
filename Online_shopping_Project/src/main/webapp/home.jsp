<%@page import="java.sql.ResultSet"%>
<%@page import="com.mysql.cj.protocol.Resultset"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="packag.ConnectionProvider" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Home</title>
<style >
h3
{
   color:yellow;
   text-align:center;
}
</style>
</head>
<body>
   <div style="color:white; text-align:center; font-size:30px;">Home<i class="fa fa-institution"></i></div>
   
   <h3 class="alert">Product added successfully!!</h3>
   <h3 class="alert">Product already exist in your cart! Quantity increased!</h3>
   <h3 class="alert">Password change successfully!!</h3>

<table>
<tbody>
<thead>
    <tr>
        <th scope="col">ID</th>
        <th scope="col">Name</th>
        <th scope="col">Category</th>
        <th scope="col"><i class="fa fa-inr"></i></th>
        <th scope="col">Add to cart<i class="fas fa-cart-plus"></i></th>
     </tr>
</thead>

<%
try
{
	 Connection con=ConnectionProvider.getCon();
	 Statement stmt=con.createStatement();
	 ResultSet rs=stmt.executeQuery("select * from product where active='yes'");
	 while(rs.next())
	 {
%> 

      <tr>
      <td><%=rs.getString(1) %></td>
      <td><%=rs.getString(2) %></td>
      <td><%=rs.getString(3) %></td>
      <td><i class="fa fa-inr"><%=rs.getString(4) %></i></td>
      <td><a href="addtoCartAction.jsp">Add to Cart<i class='fas fa-cart-plus'></i></a></td>
      </tr>
      <%
      
	 }
}
catch(Exception e)
{
	out.println(e);
}
%>
</tbody>
</table>
</body>
</html>