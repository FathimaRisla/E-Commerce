<%@page import="packag.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%@ include file="header.jsp"%>
<%@ include file="footer.jsp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Home</title>
</head>
<body>
<div style="color:white;text-align:center;font-size:30px;">Home<i class="fa fa-institution"></i></div>
<table>
<thead>
<tr>
<th scope="col">ID</th>
<th scope="col">Name</th>
<th scope="col">Category</th>
<th scope="col"><i class="fa fa-inn"></i></th>
<th scope="col">Add To Cart<i class='fas fa-cart-plus'></i></th>
</tr>
</thead>

<tbody>
<%
   int z=0;
    try
    {
    	String search=request.getParameter("search");
    	Connection con=ConnectionProvider.getCon();
    	Statement stmt=con.createStatement();
    	ResultSet rs=stmt.executeQuery("select * from product where name like'%"+search+"%' or category like'%"+search+"%'and active='yes'");
    	 while(rs.next())
    	 {
    %> 

          <tr>
          <td><%=rs.getString(1) %></td>
          <td><%=rs.getString(2) %></td>
          <td><%=rs.getString(3) %></td>
          <td><i class="fa fa-inr"><%=rs.getString(4) %></i></td>
          <td><a href="myCart.jsp">Add to Cart<i class='fas fa-cart-plus'></i></a></td>
          </tr>
          <%
    	 }
    }
    catch(Exception e)
    {
    	System.out.println(e);
    }
    %>
    </tbody>
 </table>
    <%if(z==0)
    {%>
    	<h1 style="color:white;text-align=center;">Nothing to Show</h1>
    <%}%>
    	<br>
    	<br>
    	<br>
</body>
</html>