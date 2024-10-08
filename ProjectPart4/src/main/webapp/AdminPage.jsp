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
		<title>RequestExample</title>
	</head>
	<body>
		<%
		try{
			TravelSystem db = new TravelSystem();	
			Connection con = db.getConnection();
			Statement stmt = con.createStatement();

			String user = request.getParameter("user");
			String pass = request.getParameter("pass");
			String query = "SELECT adminId FROM admin WHERE adminId = " + "'" + user + "'"
					+ "AND adminPassword = " + "'" + pass + "'";
			
			ResultSet rs = stmt.executeQuery(query);
			rs.next();
			String userName = rs.getString("adminId");
			out.print("<b>Hello: " + userName + "</b>");

		} catch(Exception ex){
			throw new RuntimeException(ex);
		}
		%>
		
		<form action = "LoginChoice.jsp" method = "post">
			&nbsp;<input type = "submit" value = "Logout" style = "height:30px; width:60px"/>
		</form>
		
		<form action = "AdminEditCustomerInfo.jsp" method = "post">
			<b><br>Add or Edit information from a Customer<br><br></b>
			Customer Id:   <input name = "customerId" required type = "text"/><br><br>
			Attribute to be edited:     <input name = "customerCol" required type = "text"/><br><br>
			New Information to be added or edited: <input name = "customerNewInfo" required type = "text"/><br><br>
			<b><input type = "submit" value = "Update" style = "height:30px; width:60px"/></b><br><br>
		</form>
		
		<form action = "AdminDeleteCustomerInfo.jsp" method = "post">
			<b><br>Delete information from a Customer<br><br></b>
			Customer Id:   <input name = "customerId" required type = "text"/><br><br>
			Attribute to be deleted:     <input name = "customerCol" required type = "text"/><br><br>
			<b><input type = "submit" value = "Delete" style = "height:30px; width:60px"/></b><br><br>
		</form>
		
		<form action = "AdminEditCustomerRepInfo.jsp" method = "post">
			<b><br>Add or Edit information from a Customer Representative<br><br></b>
			Customer Rep Id:   <input name = "customerRepId" required type = "text"/><br><br>
			Attribute to be edited:     <input name = "customerRepCol" required type = "text"/><br><br>
			New Information to be added or edited: <input name = "customerRepNewInfo" required type = "text"/><br><br>
			<b><input type = "submit" value = "Update" style = "height:30px; width:60px"/></b><br><br>
		</form>
		
		<form action = "AdminDeleteCustomerRepInfo.jsp" method = "post">
			<b><br>Delete information from a Customer Representative<br><br></b>
			Customer Rep Id:   <input name = "customerRepId" required type = "text"/><br><br>
			Attribute to be deleted:     <input name = "customerRepCol" required type = "text"/><br><br>
			<b><input type = "submit" value = "Delete" style = "height:30px; width:60px"/></b><br><br>
		</form>
		
		<form action = "AdminMonthSales.jsp" method = "post">
			<b><br>Obtain a sales report for a particular month<br><br></b>
			Month: <input name = "monthlyReport" required type = "text"/>&nbsp;
			<b><input type = "submit" value = "Search" style = "height:30px; width:60px"/></b>
		</form>
		
		<form action = "AdminFlightReservationList.jsp" method = "post">
			<b><br>Produce a list of reservations by flight number or by customer name<br><br></b>
			Flight Id:&nbsp;<input name = "flightnum" required type = "text"/>
			<b>&nbsp;<input type = "submit" value = "Search" style = "height:30px; width:60px"/></b><br><br>
		</form>
		<form action = "AdminCustomerReservationList.jsp" method = "post">
			Customer Name:&nbsp;<input name = "customerName" required type = "text"/>
			<b>&nbsp;<input type = "submit" value = "Search" style = "height:30px; width:60px"/></b><br>
		</form>
		
		<form action = "AdminFlightRevenueListing.jsp" method = "post">
			<b><br>Produce a summary listing of revenue generated by a particular flight, airline or customer<br><br></b>
			Search for a particular flight using its Id:<br><br><input name = "flightnum" required type = "text"/>
			<b><input type = "submit" value = "Search" style = "height:30px; width:60px"/></b><br><br><br>
		</form>
		<form action = "AdminAirlineRevenueListing.jsp" method = "post">
			Search for a particular airline using its Id:<br><br><input name = "airlineId" required type = "text"/>
			<b><input type = "submit" value = "Search" style = "height:30px; width:60px"/></b><br><br><br>
		</form>
		<form action = "AdminCustomerRevenueListing.jsp" method = "post">
			Search for a particular customer using their Id:<br><br><input name = "customerId" required type = "text"/>
			<b><input type = "submit" value = "Search" style = "height:30px; width:60px"/></b><br><br><br>
		</form>
		
		<form action = "AdminCustomerRevenue.jsp" method = "post">
			<b><br>Determine which customer generated most total revenue</b>
			<b>&nbsp;<input type = "submit" value = "Search" style = "height:30px; width:60px"/></b>
		</form>
		
		<form action = "AdminMostActiveFlights.jsp" method = "post">
			<b><br>Produce a list of most active flights</b>
			<b><input type = "submit" value = "Search" style = "height:30px; width:60px"/></b>
		</form>

	</body>
</html>