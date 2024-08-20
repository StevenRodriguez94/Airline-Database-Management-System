<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.ProjectPart4.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*, java.time.LocalDateTime, java.time.format.DateTimeFormatter"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ page session="false"%>
<%@ page errorPage = "/error.jsp"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Process Reservations Page</title>
	</head>
	<body>
		<%!
			//declaration tag
			public static void customerRepCreateReservation(String customerId, String seatNum, String flightNum) {
				try{
					TravelSystem db = new TravelSystem();	
					Connection con = db.getConnection();
					Statement stmt = con.createStatement();
									
					String getFlight = "SELECT * FROM flightoperation WHERE flightnum =" + "'" + flightNum + "'";
				
					ResultSet flightInfo = stmt.executeQuery(getFlight);
					flightInfo.next();
					
		            String flightPrice = flightInfo.getString("flightPrice");
		            String arrivalTime = flightInfo.getString("arrivalTime");
		     
					
					Random rand = new Random();
					
					int reservationId = rand.nextInt(30000);
					
					PreparedStatement insertReservationList = con.prepareStatement("INSERT INTO reservationList (reservationId, flight1, flightKind, tripPrice, numStops, arrivalTime, totalFlightDuration) VALUES (?, ?, ?, ?, ?, ?, ?)");
					
					int flight1 = Integer.parseInt(flightNum);
					String flightKind = "one-way";
					int tripPrice = Integer.parseInt(flightPrice);
					int numStops = 1;
					
					// Set parameters
					insertReservationList.setInt(1, reservationId);
					insertReservationList.setInt(2, flight1);
					insertReservationList.setString(3, flightKind);
					insertReservationList.setInt(4, tripPrice);
					insertReservationList.setInt(5, numStops);
					insertReservationList.setString(6, arrivalTime);
					insertReservationList.setInt(7, 1);

					// Execute the statement
					insertReservationList.executeUpdate();
					
					PreparedStatement insertFlightTicket = con.prepareStatement("INSERT INTO flightticket (ticketnum, customerId, totalfare, bookingfee, purchaseDate, purchaseTime, seatNum, reservationId) VALUES (?, ?, ?, ?, ?, ?, ?, ?)");
					
					int ticketnum = rand.nextInt(30000);
					int bookingfee = 15;
					int totalfare = tripPrice + bookingfee;
					int seatNumInt = Integer.parseInt(seatNum);;
					
					LocalDateTime currentDateTime = LocalDateTime.now();
					String purchaseDate = currentDateTime.format(DateTimeFormatter.ofPattern("yyyy-MM-dd"));
				    String purchaseTime = currentDateTime.format(DateTimeFormatter.ofPattern("HH:mm:ss"));

					
					// Set parameters
					insertFlightTicket.setInt(1, ticketnum);
					insertFlightTicket.setString(2, customerId);
					insertFlightTicket.setInt(3, totalfare);
					insertFlightTicket.setInt(4, bookingfee);
					insertFlightTicket.setString(5, purchaseDate);
					insertFlightTicket.setString(6, purchaseTime);
					insertFlightTicket.setInt(7, seatNumInt);
					insertFlightTicket.setInt(8, reservationId);

					// Execute the statement
					insertFlightTicket.executeUpdate();
					
				
				} catch(Exception ex){
					throw new RuntimeException(ex);
				}
        		
    		}
		
		public static void customerRepEditReservation(String customerId, String seatNum, String flightNum, String reservationId) {
			try{
				TravelSystem db = new TravelSystem();	
				Connection con = db.getConnection();
				Statement stmt = con.createStatement();
								
				String getFlight = "SELECT * FROM flightoperation WHERE flightnum =" + "'" + flightNum + "'";
			
				ResultSet flightInfo = stmt.executeQuery(getFlight);
				flightInfo.next();
				
	            String flightPrice = flightInfo.getString("flightPrice");
	            String arrivalTime = flightInfo.getString("arrivalTime");
				
				PreparedStatement updateReservationList = con.prepareStatement("UPDATE reservationList SET flight1 = ?, flightKind = ?, tripPrice = ?, numStops = ?, arrivalTime = ?, totalFlightDuration = ? WHERE reservationId = ?");
				
				int flight1 = Integer.parseInt(flightNum);
				String flightKind = "one-way";
				int tripPrice = Integer.parseInt(flightPrice);
				int numStops = 1;
				
				// Set parameters
				updateReservationList.setInt(1, flight1);
				updateReservationList.setString(2, flightKind);
				updateReservationList.setInt(3, tripPrice);
				updateReservationList.setInt(4, numStops);
				updateReservationList.setString(5, arrivalTime);
				updateReservationList.setInt(6, 1);
				updateReservationList.setInt(7, Integer.parseInt(reservationId));

				// Execute the statement
				updateReservationList.executeUpdate();
				
				PreparedStatement updateFlightTicket = con.prepareStatement("UPDATE flightticket SET totalfare = ?, seatNum = ? WHERE reservationId = ?");

				int bookingfee = 15;
				int totalfare = tripPrice + bookingfee;
				int seatNumInt = Integer.parseInt(seatNum);;
				
				
				// Set parameters
				updateFlightTicket.setInt(1, totalfare);
				updateFlightTicket.setInt(2, seatNumInt);
				updateFlightTicket.setInt(3, Integer.parseInt(reservationId));


				// Execute the statement
				updateFlightTicket.executeUpdate();
				
			
			} catch(Exception ex){
				throw new RuntimeException(ex);
			}
    		
		}
		%>
		
		<%
			//scriplet tag
			
			String formName = request.getParameter("formName");
		
			if(formName.equals("customerRepCreateRes")) {
				String customerId = request.getParameter("customerId");
				String seatNum = request.getParameter("seatNum");
				String flightNum = request.getParameter("selectedFlight");
				
				customerRepCreateReservation(customerId, seatNum, flightNum);
			} else if(formName.equals("customerRepEditRes")) {
				String customerId = request.getParameter("customerId");
				String seatNum = request.getParameter("seatNum");
				String flightNum = request.getParameter("selectedFlight");
				String reservationId = request.getParameter("reservationId");
				
				customerRepEditReservation(customerId, seatNum, flightNum, reservationId);
			}
			
		
		%>
		
		
		<h2>Form Processed</h2>
		
		
	</body>
</html>