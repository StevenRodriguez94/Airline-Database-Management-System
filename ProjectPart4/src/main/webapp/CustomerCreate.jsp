<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.ProjectPart4.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ page session="false"%>
<%@ page errorPage = "/error.jsp"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>RequestExample</title>
	</head>
	<body>
		<%
		try{
			TravelSystem db = new TravelSystem();	
			Connection con = db.getConnection();
			Statement stmt = con.createStatement();

			String user = request.getParameter("user");
			String pass = request.getParameter("pass");
			String name = request.getParameter("name");
			String ssn = request.getParameter("ssn");
			
			String insert = "insert into customer values ('" + user + "', '" + pass + "', '" + name + "', '" + ssn + "')";
			
			int rs = stmt.executeUpdate(insert);
			out.println("<b>Hello: " + name + "</b>\n");
			
		} catch(Exception ex){
			throw new RuntimeException(ex);
		}
		%>
		
		<form method = "post">
			<b><input type = "button" value = "Return to Login" onclick = "history.back()" style = "height:30px; width:200px"/></b>
		</form>
	</body>
</html>