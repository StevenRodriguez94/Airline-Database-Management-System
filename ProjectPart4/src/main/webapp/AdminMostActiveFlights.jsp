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

			String query = "SELECT r.reservationId, count(*) total FROM flightTicket t, reservationList r "
					+ "WHERE r.reservationId = t.reservationId GROUP BY r.reservationId "
					+ "HAVING total >= (SELECT AVG(ticketnum) from flightTicket);";
			
			ResultSet rs = stmt.executeQuery(query);
			out.println("<b>These are the most active flights, Along with their amount of tickets sold: </b><br>");
			
			//Prints out all active flights
			while(rs.next()){
				String reservationId = rs.getString("reservationId");
				String ticketAmount = rs.getString("total");
				out.println("<br><b>Flight Id: </b>" + reservationId
						+ ".<br><b>Amount of Tickets Sold: </b>" + ticketAmount + ".<br>");
			}
		} catch(Exception ex){
			throw new RuntimeException(ex);
		}
		%>
		
		<form method = "post">
			<b><br><input type = "button" value = "Return to previous page" onclick = "history.back()" style = "height:30px; width:200px"/></b>
		</form>
		
	</body>
</html>