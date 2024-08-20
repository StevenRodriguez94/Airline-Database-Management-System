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
		
		%>
		
		<%
			//scriplet tag
			String customerId = request.getParameter("customerId");
			ResultSet flightList = getFlightList();
		
			ResultSetMetaData metaData = flightList.getMetaData();
		    int columnCount = metaData.getColumnCount();
			
		
		%>
		
		
		<h2>Create Reservation Form for <%= customerId %> </h2>
		<form action="processReservationForms.jsp" method= "post">
			<input type="hidden" name="formName" value="customerRepCreateRes">
		
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
			                    <input type="checkbox" name="selectedFlight" value="<%= flightList.getInt("flightnum") %>">
			                </td>
			            </tr>
			        <% } %>
			    </tbody>
			</table>
			
			</br>
			
			<div>
			Seat Number: <input name = "seatNum" required type="text"/>
			</div>
			
			<input type="hidden" name="customerId" value="<%= customerId %>">
			
			</br>
			<input type = "submit" value = "Submit" style = "height:30px; width:60px"/>
			
			
		</form>
		
	</body>
</html>