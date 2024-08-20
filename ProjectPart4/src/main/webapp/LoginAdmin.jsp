<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.ProjectPart4.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ page session="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Login Page</title>
</head>
<body>
	<p>ADMIN LOGIN<p>
	<form action = "AdminPage.jsp" method = "post">
		Admin Id:<br><input name = "user" required type = "text"/><br><br>
		Password:   <br><input name = "pass" required type = "password"/><br><br>
		<input type = "submit" value = "Login" style = "height:40px; width:60px"/>
	</form>
	
</body>
</html>