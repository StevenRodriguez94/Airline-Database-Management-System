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
		<title>Add Edit Customer Info Page</title>
	</head>
	<body>
		<%
		try{
 			TravelSystem db = new TravelSystem();	
			Connection con = db.getConnection();
			Statement stmt = con.createStatement();
			Statement stmt1 = con.createStatement();

			String question = request.getParameter("question");
			String user = request.getSession().getAttribute("user").toString();
			
			String questionNumber = "select max(questionNumber) + 1 questionNum from questions;";
			ResultSet rs = stmt1.executeQuery(questionNumber);
			rs.next();
			String questionNum = rs.getString("questionNum");
			
 			String insert = "insert into questions (question, customerId, questionNumber) values ('" 
 			+ question + "', '" + user + "', " + questionNum + ")";
			int up = stmt.executeUpdate(insert);
			
			out.println("Your Question has been posted; a customer representative will answer it in the near future!");

		} catch(Exception ex){
			throw new RuntimeException(ex);
		}
		%>
		
		<form method = "post">
			<b><input type = "button" value = "Return to previous page" onclick = "history.back()" style = "height:30px; width:200px"/></b>
		</form>
		
	</body>
</html>