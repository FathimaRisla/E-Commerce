
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/signup-style.css">
<title>ForgotPassword</title>
</head>
<body>
<div id='container'>
        <div class='signup'>
        <form action="ForgotPasswordAction.jsp" method="post">
         <input type="email" name="email" placeholder="Enter Email" required>
      <input type="number" name="mobilenumber" placeholder="Enter Mobile Number" required>
      <select name="securityQuestions">
      <option value="What was your first car?">What was your first car?</option>
      <option value="What is the name of your pet?">What is the name of your pet?</option>
      <option value="Which elementary school did you attend?">Which elementary school did you attend?</option>
      <option value="What is the name of the town you were born?">What is the name of the town you were born?</option>
      </select> 
      <input type="text" name="answer" placeholder="Enter Answer" required="required">
      <input type="password" name="newPassword" placeholder="Enter Your Password" required="required">
      <input type="submit" value="Save">
       </form>
       <h2><a href="login.jsp">Login</a></h2>
       </div>
        <div class='whyforgotPassword'>
      <%
      String msg=request.getParameter("msg");
      if("done".equals(msg))
      {%>
          <h1>Password Changed Successfully</h1>
      <%} %>
      <%if("invalid".equals(msg))
    	  {
    	  %>
    	  <h1>Something went Wrong!Try Again!</h1>
    	  <%} %>
    	  <h2>Online Shopping</h2>
    	  <p>The Online shopping System is the applicatiopn that allows the users to shop online eithout  going to the shop to buy them</p>
      </div>
</div>

</body>
</html>