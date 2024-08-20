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
		<title>Specific Customer Revenue Page</title>
	</head>
	<body>
		<%
		try{
			TravelSystem db = new TravelSystem();	
			Connection con = db.getConnection();
			Statement stmt = con.createStatement();
			
			String customerId = request.getParameter("customerId");

			String query = "SELECT customerName, SUM(totalfare) revenue FROM customer c, flightTicket t "
					+ "WHERE c.customerId = t.customerId AND c.customerId = '" + customerId + "' GROUP BY c.customerId;";
					
			ResultSet rs = stmt.executeQuery(query);
			rs.next();
			String customerName = rs.getString("customerName");
			String revenue = rs.getString("revenue");
			out.println("<b>The customer " + customerName
					+ " has generated a total revenue of: " + revenue + ".</b>\n");
			
		} catch(Exception ex){
			throw new RuntimeException(ex);
		}
		%>
		
		<form method = "post">
			<b><input type = "button" value = "Return to previous page" onclick = "history.back()" style = "height:30px; width:200px"/></b>
		</form>
		
	</body>
</html>