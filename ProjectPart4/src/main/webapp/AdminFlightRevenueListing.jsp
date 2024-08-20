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
		<title>Specific Flight Revenue Page</title>
	</head>
	<body>
		<%
		try{
			TravelSystem db = new TravelSystem();	
			Connection con = db.getConnection();
			Statement stmt = con.createStatement();
			
			String flightId = request.getParameter("flightnum");

			String query = "SELECT r.reservationId, SUM(totalfare) revenue FROM reservationList r, flightTicket t "
					+ "WHERE r.reservationId = " + flightId + " and r.reservationId = t.reservationId GROUP BY airlineId;";
					
			ResultSet rs = stmt.executeQuery(query);
			rs.next();
			String reservationId = rs.getString("reservationId");
			String revenue = rs.getString("revenue");
			out.println("<b>The flight " + reservationId
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