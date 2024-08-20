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
		<title>One Way Flights Page</title>
	</head>
	<body>
		<%
		try{
			TravelSystem db = new TravelSystem();	
			Connection con = db.getConnection();
			Statement stmt = con.createStatement();
			
			String date = request.getParameter("date");
						

			String query = "select r.reservationId from reservationList r, flightoperation o where r.flightKind = 'one-way' and flight1 = flightnum "
					+ "and flightDate = '" + date + "'";
			ResultSet rs = stmt.executeQuery(query);
			
			int count = 0;
			while(rs.next()){
				count++;
				String reservationId = rs.getString("reservationId");
				out.println("<b>Trip #" + reservationId + "<br></b>");
				
				out.println("<b>________________________________________</b><br>");
				
 				String query1 = "SELECT o.*, r.flightKind from reservationList r "
						+ "INNER JOIN flightoperation o ON r.flight1 = o.flightnum "
						+ "WHERE reservationId = " + reservationId;
 				Statement stmt1 = con.createStatement();
				ResultSet rs1 = stmt1.executeQuery(query1);
				rs1.next();
				
 				String query2 = "SELECT o.*, r.flightKind from reservationList r "
						+ "INNER JOIN flightoperation o ON r.flight2 = o.flightnum "
						+ "WHERE reservationId = " + reservationId;
 				Statement stmt2 = con.createStatement();
				ResultSet rs2 = stmt2.executeQuery(query2);
				
				String query3 = "SELECT o.*, r.flightKind from reservationList r "
						+ "INNER JOIN flightoperation o ON r.flight3 = o.flightnum "
						+ "WHERE reservationId = " + reservationId;
 				Statement stmt3 = con.createStatement();
				ResultSet rs3 = stmt3.executeQuery(query3);
				
 				String airlineId1 = rs1.getString("airlineId");
				String aircraftId1 = rs1.getString("aircraftId");
				String flightnum1 = rs1.getString("flightnum");
				String availableSeats1 = rs1.getString("availableSeats");
				String flightDate1 = rs1.getString("flightDate");
				String departTime1 = rs1.getString("departTime");
				String arrivalTime1 = rs1.getString("arrivalTime");
				String departAirportId1 = rs1.getString("departAirportId");
				String destinAirportId1 = rs1.getString("destinAirportId");
				String flightClass1 = rs1.getString("flightClass");
				String flightType1 = rs1.getString("flightType");
				String flightPrice1 = rs1.getString("flightPrice");
				String flightKind1 = rs1.getString("flightKind");

				out.println("<b><br>Airline Id: </b>" + airlineId1);
				out.println("<b><br>Aircraft Id: </b>" + aircraftId1);
				out.println("<b><br>Flight Id: </b>" + flightnum1);
				out.println("<b><br>Available Seats: </b>" + availableSeats1);
				out.println("<b><br>Flight Date: </b>" + flightDate1);
				out.println("<b><br>Depart Time: </b>" + departTime1);
				out.println("<b><br>Arrival Time: </b>" + arrivalTime1);
				out.println("<b><br>Departure Airport: </b>" + departAirportId1);
				out.println("<b><br>Destination Airport: </b>" + destinAirportId1);
				out.println("<b><br>Flight Class: </b>" + flightClass1);
				out.println("<b><br>Flight Type: </b>" + flightType1);
				out.println("<b><br>Flight Price: </b>" + flightPrice1);
				out.println("<b><br>Flight Kind: </b>" + flightKind1 + "<br><br>");

 				if(rs2.next()){
					String airlineId2 = rs2.getString("airlineId");
					String aircraftId2 = rs2.getString("aircraftId");
					String flightnum2 = rs2.getString("flightnum");
					String availableSeats2 = rs2.getString("availableSeats");
					String flightDate2 = rs2.getString("flightDate");
					String departTime2 = rs2.getString("departTime");
					String arrivalTime2 = rs2.getString("arrivalTime");
					String departAirportId2 = rs2.getString("departAirportId");
					String destinAirportId2 = rs2.getString("destinAirportId");
					String flightClass2 = rs2.getString("flightClass");
					String flightType2 = rs2.getString("flightType");
					String flightPrice2 = rs2.getString("flightPrice");
					String flightKind2 = rs2.getString("flightKind");
	
					out.println("<b><br>Airline Id: </b>" + airlineId2);
					out.println("<b><br>Aircraft Id: </b>" + aircraftId2);
					out.println("<b><br>Flight Id: </b>" + flightnum2);
					out.println("<b><br>Available Seats: </b>" + availableSeats2);
					out.println("<b><br>Flight Date: </b>" + flightDate2);
					out.println("<b><br>Depart Time: </b>" + departTime2);
					out.println("<b><br>Arrival Time: </b>" + arrivalTime2);
					out.println("<b><br>Departure Airport: </b>" + departAirportId2);
					out.println("<b><br>Destination Airport: </b>" + destinAirportId2);
					out.println("<b><br>Flight Class: </b>" + flightClass2);
					out.println("<b><br>Flight Type: </b>" + flightType2);
					out.println("<b><br>Flight Price: </b>" + flightPrice2);
					out.println("<b><br>Flight Kind: </b>" + flightKind2 + "<br><br>");
				}
 				
				if(rs3.next()){
					String airlineId3 = rs3.getString("airlineId");
					String aircraftId3 = rs3.getString("aircraftId");
					String flightnum3 = rs3.getString("flightnum");
					String availableSeats3 = rs3.getString("availableSeats");
					String flightDate3 = rs3.getString("flightDate");
					String departTime3 = rs3.getString("departTime");
					String arrivalTime3 = rs3.getString("arrivalTime");
					String departAirportId3 = rs3.getString("departAirportId");
					String destinAirportId3 = rs3.getString("destinAirportId");
					String flightClass3 = rs3.getString("flightClass");
					String flightType3 = rs3.getString("flightType");
					String flightPrice3 = rs3.getString("flightPrice");
					String flightKind3 = rs3.getString("flightKind");
	
					out.println("<b><br>Airline Id: </b>" + airlineId3);
					out.println("<b><br>Aircraft Id: </b>" + aircraftId3);
					out.println("<b><br>Flight Id: </b>" + flightnum3);
					out.println("<b><br>Available Seats: </b>" + availableSeats3);
					out.println("<b><br>Flight Date: </b>" + flightDate3);
					out.println("<b><br>Depart Time: </b>" + departTime3);
					out.println("<b><br>Arrival Time: </b>" + arrivalTime3);
					out.println("<b><br>Departure Airport: </b>" + departAirportId3);
					out.println("<b><br>Destination Airport: </b>" + destinAirportId3);
					out.println("<b><br>Flight Class: </b>" + flightClass3);
					out.println("<b><br>Flight Type: </b>" + flightType3);
					out.println("<b><br>Flight Price: </b>" + flightPrice3);
					out.println("<b><br>Flight Kind: </b>" + flightKind3 + "<br><br><br><br>");
				} 
	
			}
			if(count == 0){
				out.println("<b>There are no one-way flights available in " + date + "</b>");
			}

		} catch(Exception ex){
			throw new RuntimeException(ex);
		}
		%>
		
		<form action = "CustomerRegister.jsp" method = "post">
			<b><br>Enter the trip number to register to a flight:</b>
			<%  request.getSession().setAttribute("user", request.getSession().getAttribute("user").toString()); %>
			Trip #: <input name = "trip" required type = "text"/>&nbsp;
			<input type = "submit" value = "Register" style = "height:30px; width:60px"/>
		</form>
		
		<form method = "post">
			<b><input type = "button" value = "Return to previous page" onclick = "history.back()" style = "height:30px; width:200px"/></b>
		</form>
		
	</body>
</html>