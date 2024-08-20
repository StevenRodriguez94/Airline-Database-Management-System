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
		<title>Customer Rep Reply Info Page</title>
	</head>
	<body>
		<%
		try{
 			TravelSystem db = new TravelSystem();	
			Connection con = db.getConnection();
			Statement stmt = con.createStatement();
			Statement stmt1 = con.createStatement();

			String customerId = request.getParameter("customerId");
			String user = request.getSession().getAttribute("user").toString();
			
			String userName = "select customerName from customer where customerId = '" + customerId + "';";
			ResultSet rs = stmt.executeQuery(userName);
			rs.next();
			String customerName = rs.getString("customerName");
			
 			out.println("<b>All questions asked by: </b>" + customerName + ":<br><br>");
			
 			String answers = "select * from questions where customerId = '" + customerId + "';";
			ResultSet rs1 = stmt1.executeQuery(answers);
			
   			while(rs1.next()){
				String question = rs1.getString("question");
				String answer = rs1.getString("answer");
				String repId = rs1.getString("repId");
				String questionNum = rs1.getString("questionNumber");
				
				Statement stmt2 = con.createStatement();
 
  				String query = "select repName from customerRep where repId = '" + repId + "';";
				ResultSet rs2 = stmt2.executeQuery(query);
				String repName = null;
 				if(rs2.next())
					repName = rs2.getString("repName"); 
  				
 				out.println("<b>Question #" + questionNum + "</b><br>");
 				out.println("<b>_________________________________</b><br><br>");
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
		
		<form action = "CustomerRepAnswer.jsp" method = "post">
			<b><br>Reply to a specific customer's question<br><br></b>
		    <%  request.getSession().setAttribute("user", request.getSession().getAttribute("user").toString()); %>
			Question #:   <input name = "questionNum" required type = "text"/><br><br>
			Answer: <input name = "answer" required type = "text"/><br><br>
			<b><input type = "submit" value = "Reply" style = "height:30px; width:60px"/></b><br><br>
		</form>
	
		
		<form method = "post">
			<b><input type = "button" value = "Return to previous page" onclick = "history.back()" style = "height:30px; width:200px"/></b>
		</form>
		
	</body>
</html>