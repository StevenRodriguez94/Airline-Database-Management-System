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
		<title>Check if Question(s) have been Answered Page</title>
	</head>
	<body>
		<%
		try{
 			TravelSystem db = new TravelSystem();	
			Connection con = db.getConnection();
			Statement stmt = con.createStatement();
			Statement stmt1 = con.createStatement();

			String user = request.getSession().getAttribute("user").toString();
			
			String userName = "select customerName from customer where customerId = '" + user + "';";
			ResultSet rs = stmt.executeQuery(userName);
			rs.next();
			String customerName = rs.getString("customerName");
			
 			out.println("<b>All questions asked by: </b>" + customerName + "<br><br>");
			
 			String answers = "select * from questions where customerId = '" + user + "';";
			ResultSet rs1 = stmt1.executeQuery(answers);
			
   			while(rs1.next()){
				String question = rs1.getString("question");
				String answer = rs1.getString("answer");
				String repId = rs1.getString("repId");
				
				Statement stmt2 = con.createStatement();
 
  				String query = "select repName from customerRep where repId = '" + repId + "';";
				ResultSet rs2 = stmt2.executeQuery(query);
				String repName = null;
 				if(rs2.next())
					repName = rs2.getString("repName"); 
  				
 				out.println("<b>Question: </b>" + question + "<br>");
				out.println("<b>--Asked by customer: </b>" + customerName + "<b>--</b><br><br>");
  				if(answer == null){
					out.println("<b>Waiting for an answer...</b><br><br>");
				}
				else {
					out.println("<b>Answer: </b>" + answer + "<br>");
					out.println("<b>--Answered by customer representative: </b>" + repName + "<b>--</b><br><br>");
				}  
			}
			

		} catch(Exception ex){
			throw new RuntimeException(ex);
		}
		%>
		
		<form method = "post">
			<b><input type = "button" value = "Return to previous page" onclick = "history.back()" style = "height:30px; width:200px"/></b>
		</form>
		
	</body>
</html>