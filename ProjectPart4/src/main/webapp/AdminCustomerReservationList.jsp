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
		<title>Customer Reservation List</title>
	</head>
	<body>
		<%
		try{
			TravelSystem db = new TravelSystem();	
			Connection con = db.getConnection();
			Statement stmt = con.createStatement();

			String customerName = request.getParameter("customerName");
			
			String query = "SELECT t.* FROM flightTicket t, customer c "
					+ "WHERE c.customerId = t.customerId AND customerName = '" + customerName + "'";
			
			ResultSet rs = stmt.executeQuery(query);
			//int count = 0;
			while(rs.next()){
				//count++;
				//out.println("<b> Ticket #" + count + "</b><br>");
				String ticketnum = rs.getString("ticketnum");
				out.println("<b>Ticket Number: </b>" + ticketnum + "<br>");
				String flightnum = rs.getString("reservationId");
				out.println("<b>Flight Id: </b>" + flightnum + "<br>");
				String customerId = rs.getString("customerId");
				out.println("<b>Customer Id: </b>" + customerId + "<br>");
				String totalfare = rs.getString("totalfare");
				out.println("<b>Total Fare: $</b>" + totalfare + "<br>");
				String bookingfee = rs.getString("bookingfee");
				out.println("<b>Booking Fee: $</b>" + bookingfee + "<br>");
				String purchaseDate = rs.getString("purchaseDate");
				out.println("<b>Purchase Date: </b>" + purchaseDate + "<br>");
				String purchaseTime = rs.getString("purchaseTime");
				out.println("<b>Purchase Time: </b>" + purchaseTime + "<br>");
				String seatNum = rs.getString("seatNum");
				out.println("<b>Seat Number: </b>" + seatNum + "<br>");
				out.println("<b>_________________________________________</b><br><br>");
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