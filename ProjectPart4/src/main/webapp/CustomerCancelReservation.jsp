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
		<title>Cancel Reservation Page</title>
	</head>
	<body>
		<%
		try{
			TravelSystem db = new TravelSystem();	
			Connection con = db.getConnection();
			Statement stmt = con.createStatement();
			Statement stmt2 = con.createStatement();
			Statement stmt3 = con.createStatement();
			Statement stmt4 = con.createStatement();
			Statement stmt5 = con.createStatement();

			String query;
			String user = request.getParameter("user");
			String reservationId = request.getParameter("customerId");
			
			query = "select f.ticketnum from flightTicket f, reservationList r where f.customerId = '" + user + "' "
					+ "and f.reservationId = r.reservationId and reservationId = " + reservationId;
			ResultSet rs = stmt.executeQuery(query);
			rs.next();
			String ticketnum = rs.getString("ticketnum");
			
			String query2 = "delete from flightTicket where ticketnum = " + ticketnum;
			int rs2 = stmt2.executeUpdate(query2);
			
			String query3 = "SELECT availableSeats + 1 seats from flightoperation, reservationList where flightnum = flight1 "
					+ "and reservationId = " + reservationId;
			ResultSet rs3 = stmt3.executeQuery(query3);
			rs3.next();
			String seats = rs3.getString("seats");
			
			String update = "update flightoperation set availableSeats = " + seats + " where flightnum = flight1 and "
					+ "reservationId = " + reservationId;
			int rs4 = stmt4.executeUpdate(update);

			
			String flightClass = "select o.* from flightoperation o, reservationList r where flightClass = 'economy' and flightnum = flight1 "
					+ "and reservationId = " + reservationId;
			ResultSet rs5 = stmt5.executeQuery(flightClass);
			rs5.next();
			if(rs5.getString("flightClass").equals("economy")){
				out.println("Reservation Id #" + reservationId + " has been successfully canceled.<br> Cancelation Fee = $25.");
			}
			else
				out.println("Reservation Id #" + reservationId + " has been successfully canceled.");

		} catch(Exception ex){
			throw new RuntimeException(ex);
		}
		%>
		
		<form method = "post">
			<b><input type = "button" value = "Return to previous page" onclick = "history.back()" style = "height:30px; width:200px"/></b>
		</form>
		
	</body>
</html>