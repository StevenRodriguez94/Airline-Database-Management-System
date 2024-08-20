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
		<title>Max Customer Revenue Page</title>
	</head>
	<body>
		<%
		try{
			TravelSystem db = new TravelSystem();	
			Connection con = db.getConnection();
			Statement stmt = con.createStatement();

			String query = "SELECT customerId, customerName, max(total) maxfare FROM ( "
					+ "select f.customerId, c.customerName, sum(totalfare) total "
					+ "from flightticket f, customer c where c.customerId = f.customerId "
				    + "group by f.customerId, c.customerName) j group by customerId, customerName;";
			
			ResultSet rs = stmt.executeQuery(query);
			rs.next();
			String customerName = rs.getString("customerName");
			String revenue = rs.getString("maxfare");
			out.println("<b>The customer that has generated the most amount of revenue is: " + customerName
					+ ".\n\n This customer has generated a total revenue of: " + revenue + ".</b>\n");
			
		} catch(Exception ex){
			throw new RuntimeException(ex);
		}
		%>
		
		<form method = "post">
			<b><input type = "button" value = "Return to previous page" onclick = "history.back()" style = "height:30px; width:200px"/></b>
		</form>
		
	</body>
</html>