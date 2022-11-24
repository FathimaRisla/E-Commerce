<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="packag.ConnectionProvider" %>



<%

String email=request.getParameter("email");
String mobileNumber=request.getParameter("mobileNumber");
String securityQuestion=request.getParameter("securityQuestion");
String answer=request.getParameter("answer");
String newPassword=request.getParameter("newPassword");
int check=0;

try
{
	Connection con=ConnectionProvider.getCon();
	
     Statement stmt=con.prepareStatement("insert into users values(?,?,?,?,?,?,?,?,?,?)");
     ResultSet rs=stmt.executeQuery("select * from users where email ='"+email+"' and mobileNumber='"+mobileNumber+"'and securityQuestion='"+securityQuestion+"' and answer='"+answer+"'");
     while(rs.next())
     {
    	 check=1;
    	 stmt.executeUpdate("update users set password='"+newPassword+"'");
    	 response.sendRedirect("forgotPassword.jsp?msg=done");
     }
     if(check==0)
     {
    	 response.sendRedirect("forgotPassword.jsp?msg=invalid");
     }
}
catch(Exception e)
{
	out.print(e);
	response.sendRedirect("signup.jsp?msg-valid");
}

%>