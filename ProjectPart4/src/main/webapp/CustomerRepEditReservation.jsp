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
		<title>Upcoming Reservations Page</title>
	</head>
	<body>
		<%!
			//declaration tag
			public static ResultSet getFlightList() {
				try{
					TravelSystem db = new TravelSystem();	
					Connection con = db.getConnection();
					Statement stmt = con.createStatement();
		
					String query = "SELECT * FROM flightoperation";
					
					ResultSet result = stmt.executeQuery(query);
					
					
					return result;
				
				} catch(Exception ex){
					throw new RuntimeException(ex);
				}
        		
    		}
		
		public static Object[] getReservationInfo(String reservationId) {
			try{
				TravelSystem db = new TravelSystem();	
				Connection con = db.getConnection();
				Statement stmt = con.createStatement();
	
				String getRes = "SELECT * FROM reservationList WHERE reservationId =" + "'" + reservationId + "'";
				
				ResultSet resInfo = stmt.executeQuery(getRes);
				resInfo.next();
				
				int originFlightNum = resInfo.getInt("flight1");
				
				String getFlightTicket = "SELECT * FROM flightticket WHERE reservationId =" + "'" + reservationId + "'";
				
				ResultSet flightTicketInfo = stmt.executeQuery(getFlightTicket);
				flightTicketInfo.next();
				
				String customerId = flightTicketInfo.getString("customerId");
				int seatNumber = flightTicketInfo.getInt("seatNum");
				
				Object[] result = { originFlightNum, seatNumber, customerId };
				
				return result;
				
				
			
			} catch(Exception ex){
				throw new RuntimeException(ex);
			}
    		
		}	
		
		%>
		
		<%
			//scriplet tag
			String reservationId = request.getParameter("resId");
			Object[] reservationInfo = getReservationInfo(reservationId);
			
			String customerId = (String) reservationInfo[2];
			
			
			ResultSet flightList = getFlightList();
		
			ResultSetMetaData metaData = flightList.getMetaData();
		    int columnCount = metaData.getColumnCount();
			
		
		%>
		
		
		<h2>Edit Reservation Form for Reservation ID: <%= reservationId %> </h2>
		<form action="processReservationForms.jsp" method= "post">
			<input type="hidden" name="formName" value="customerRepEditRes">
			<input type="hidden" name="reservationId" value="<%= reservationId %>">
			<input type="hidden" name="customerId" value="<%= customerId %>">
			
		
			<h3>Select flight:</h3>
			
			<table border="1">
			    <thead>
			        <tr>
			            <% for (int i = 1; i <= columnCount; i++) { %>
			                <th><%= metaData.getColumnName(i) %></th>
			            <% } %>
			            <th>Select</th>
			        </tr>
			    </thead>
			    <tbody>
			        <% while (flightList.next()) { %>
			            <tr>
			                <% for (int i = 1; i <= columnCount; i++) { %>
			                    <td><%= flightList.getString(i) %></td>
			                <% } %>
			                <td>
			                    <input type="checkbox" name="selectedFlight" value="<%= flightList.getInt("flightnum") %>" checked=<%= flightList.getInt("flightnum") == (Integer) reservationInfo[0] %>>
			                </td>
			            </tr>
			        <% } %>
			    </tbody>
			</table>
			
			</br>
			
			<div>
			Seat Number: <input name = "seatNum" required type="text" value=<%= reservationInfo[1] %>>
			</div>
			
			
			</br>
			<input type = "submit" value = "Submit" style = "height:30px; width:60px"/>
			
			
		</form>
		
	</body>
</html>