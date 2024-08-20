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
			Statement stmt1 = con.createStatement();

			String keyword = request.getParameter("keyword");
			
			String answers = "select * from questions where answer like '%" + keyword + "%';";
			ResultSet rs1 = stmt1.executeQuery(answers);
			
			int count = 0;
   			while(rs1.next()){
   				count ++;
   				
   				String customerId = rs1.getString("customerId");
   				
   				Statement stmt = con.createStatement();
   	 			String userName = "select customerName from customer where customerId = '" + customerId + "';";
   				ResultSet rs = stmt.executeQuery(userName);
   				rs.next();
   				String customerName = rs.getString("customerName");
   				
				String question = rs1.getString("question");
				String answer = rs1.getString("answer");
				String repId = rs1.getString("repId");
				
				Statement stmt2 = con.createStatement();
 
 				String query = "select repName from customerRep where repId = '" + repId + "';";
				ResultSet rs2 = stmt2.executeQuery(query);
				rs2.next();
				String repName = rs2.getString("repName"); 
 				
				out.println("<b>Question: </b>" + question + "<br>");
				out.println("<b>--Asked by customer: </b>" + customerName + "<b>--</b><br><br>");
				if(answer == null){
					out.println("<b>Answer Pending...</b>");
				}
				else {
					out.println("<b>Answer: </b>" + answer + "<br><br><br>");
					out.println("<b>--Answered by customer representative: </b>" + repName + "<b>--</b><br><br>");
				}
			}
   			if(count == 0){
   				out.println("<b>No Answeres that contain the entered keyword have been provided!");
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