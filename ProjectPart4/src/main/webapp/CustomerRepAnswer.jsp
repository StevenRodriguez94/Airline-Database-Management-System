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
		<title>Customer Rep Answer</title>
	</head>
	<body>
		<%
		try{
 			TravelSystem db = new TravelSystem();	
			Connection con = db.getConnection();
			Statement stmt = con.createStatement();
			Statement stmt2 = con.createStatement();

			String questionNum = request.getParameter("questionNum");
			String answerText = request.getParameter("answer");
			String user = request.getSession().getAttribute("user").toString();
			
			out.println("<b>Hello " + user + "</b><br><br><br>");
 			String answer = "update questions set answer = '" + answerText + "' where questionNumber = " + questionNum;
			int rs = stmt.executeUpdate(answer);
			
			String answer2 = "update questions set repId = '" + user + "' where questionNumber = " + questionNum;
			int rs2 = stmt2.executeUpdate(answer);

			out.println("<b>Your answer has been successfully submitted!</b>");
			

		} catch(Exception ex){
			throw new RuntimeException(ex);
		}
		%>
		
		<form method = "post">
			<b><br>Go back to main Customer Representative Page<br><br></b>
			<b><input type = "button" value = "Go Back" onclick = "history.go(-2)" style = "height:30px; width:200px"/></b>
		</form>
		
	</body>
</html>