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
		<title>Filtered Flights Page</title>
	</head>
	<body>
		<%
		try{
			TravelSystem db = new TravelSystem();	
			Connection con = db.getConnection();
			Statement stmt = con.createStatement();
			Statement stmt1 = con.createStatement();
			Statement stmt2 = con.createStatement();
			Statement stmt3 = con.createStatement();
			Statement stmt4 = con.createStatement();
			Statement stmt5 = con.createStatement();
			Statement stmt6 = con.createStatement();
			Statement stmt7 = con.createStatement();
			Statement stmt8 = con.createStatement();
			Statement stmt9 = con.createStatement();
			Statement stmt10 = con.createStatement();

			
			String query;
			String trip = request.getParameter("trip");
			String user = request.getSession().getAttribute("user").toString();

			out.println(user);
			
			query = "SELECT MAX(ticketnum) + 1 num from flightTicket;";
			ResultSet rs = stmt.executeQuery(query);
			rs.next();
			String ticketNum = rs.getString("num"); 
			
 			String query1 = "SELECT tripPrice from reservationList where reservationId = " + trip + ";";
			ResultSet rs1 = stmt1.executeQuery(query1);
			rs1.next();
			String fare = rs1.getString("tripPrice");
			
			String query2 = "SELECT flightClass from flightoperation, reservationList where flight1 = flightnum and "
					+ "reservationId = " + trip;
			ResultSet rs2 = stmt2.executeQuery(query2);
			rs2.next();
			
			int bookingfee;
			
			if(rs2.getString("flightClass").equals("economy")){
				bookingfee = 15;
			}
			else if(rs2.getString("flightClass").equals("business")){
				bookingfee = 20;
			}
			else
				bookingfee = 25;
			
			int fare1 = Integer.parseInt(fare);
			int totalfare = bookingfee + fare1;
			
			//Update available seats for first flight
			String seats = "SELECT availableSeats - 1 seats from flightoperation, reservationList where flightnum = flight1 and reservationId = " + trip;
			ResultSet rrss = stmt5.executeQuery(seats);
			rrss.next();
			String numSeats = rrss.getString("seats");
			
			String update = "update flightoperation o join reservationList r on flight1 = flightnum set availableSeats = " + numSeats
					+ " where reservationId = " + trip;
			int rrsss = stmt6.executeUpdate(update);
			
			//Update available seats for second flight
			String seats2 = "SELECT availableSeats - 1 seats from flightoperation, reservationList where flightnum = flight2 and reservationId = " + trip;
			ResultSet rrss2 = stmt7.executeQuery(seats2);
			rrss2.next();
			String numSeats2 = rrss2.getString("seats");
			
			String update2 = "update flightoperation o join reservationList r on flight2 = flightnum set availableSeats = " + numSeats2
					+ " where reservationId = " + trip;
			int rrsss2 = stmt8.executeUpdate(update2);
			
			
			//Update available seats for third flight
			String seats3 = "SELECT availableSeats - 1 seats from flightoperation, reservationList where flightnum = flight3 and reservationId = " + trip;
			ResultSet rrss3 = stmt9.executeQuery(seats3);
			rrss3.next();
			String numSeats3 = rrss3.getString("seats");
			
			String update3 = "update flightoperation o join reservationList r on flight3 = flightnum set availableSeats = " + numSeats3
					+ " where reservationId = " + trip;
			int rrsss3 = stmt10.executeUpdate(update3);
			
			String insert = "INSERT INTO flightTicket VALUES(" + ticketNum + ", '"
					+ user + "', " + totalfare + ", " + bookingfee + ", CURDATE(), CURTIME(), " 
			+ "(SELECT availableSeats + 1 from flightoperation, reservationList where flightnum = flight1 and reservationId = " + trip + "), "
			+ trip + ");";
			
			int rs3 = stmt3.executeUpdate(insert);
			
			String updatedTicket = "SELECT * FROM flightTicket where customerId = " + user;
			ResultSet uT = stmt4.executeQuery(updatedTicket);
			uT.next();
			

		} catch(Exception ex){
			out.println("successfully registered!");
		}
		%>
		
		<form method = "post">
			<b><input type = "button" value = "Return to main customer page" onclick = "history.go(-2)" style = "height:30px; width:200px"/></b>
		</form>
		
	</body>
</html>