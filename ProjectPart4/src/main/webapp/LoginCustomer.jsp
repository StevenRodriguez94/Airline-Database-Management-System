<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.ProjectPart4.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ page session="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Customer Login Page</title>
</head>
<body>
	<p>CUSTOMER LOGIN<p>
	<form action = "CustomerPage.jsp" method = "post">
		Customer Id:<br><input name = "user" required type = "text"/><br><br>
		Password:   <br><input name = "pass" required type = "password"/><br><br>
		<input type = "submit" value = "Login" style = "height:40px; width:60px"/>
	</form>
	
	<form action = "CustomerCreate.jsp" method = "post">
		<b><br>Create a customer account:</b><br><br>
		Customer Id:<br><input name = "user" required type = "text"/><br><br>
		Password:   <br><input name = "pass" required type = "text"/><br><br>
		Customer Name:   <br><input name = "name" required type = "text"/><br><br>
		Customer SSN:   <br><input name = "ssn" required type = "text"/><br><br>
		<input type = "submit" value = "Create" style = "height:40px; width:60px"/>
	</form>
	
	
</body>
</html>