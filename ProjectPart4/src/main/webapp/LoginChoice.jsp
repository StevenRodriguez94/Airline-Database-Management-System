<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.ProjectPart4.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ page session="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login Choice Page</title>
</head>
<body>
	<p>Choose how to login as!<p>
	<form action = "LoginCustomer.jsp" method = "post">
		<input type = "submit" value = "Login as a Customer" style = "height:40px; width:300px"/>
	</form> 
	<form action = "LoginAdmin.jsp" method = "post">
		<input type = "submit" value = "Login as an Admin" style = "height:40px; width:300px"/>
	</form>
	<form action = "LoginCustomerRep.jsp" method = "post">
		<input type = "submit" value = "Login as a Customer Representative" style = "height:40px; width:300px"/>
	</form>
	
	<%
	HttpSession session1 = request.getSession();//getting session
    String msg;
    if(session1.getAttribute("msg")!=null && session1 != null){
       msg= (String)session1.getAttribute("msg");
       out.println("<p style='color:red;'> "+msg+"</p>");
       session1.invalidate();
    }
    %>
</body>
</html>