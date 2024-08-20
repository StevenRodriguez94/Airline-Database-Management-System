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
		<title>Specific Monthly Sales Page</title>
	</head>
	<body>
		<%
		try{
			TravelSystem db = new TravelSystem();	
			Connection con = db.getConnection();
			Statement stmt = con.createStatement();
			
			String monthlyReport = request.getParameter("monthlyReport");

			String query = "select r.airlineId, a.airlineName, sum(totalfare) revenue "
					+ "from flightTicket t, reservationList r, airline a, flightoperation o "
					+ "where t.reservationId = r.reservationId "
					+ "and r.airlineId = a.airlineId "
					+ "and monthname(flightDate) = '" + monthlyReport + "' "
					+ "and flight1 = flightnum "
					+ "group by a.airlineId;";
					
			ResultSet rs = stmt.executeQuery(query);
			boolean hasRevenue = false;
			while(rs.next()){
				hasRevenue = true;
				String airlineId = rs.getString("airlineId");
				String airlineName = rs.getString("airlineName");
				String revenue = rs.getString("revenue");
				out.println("<b>In the month of " + monthlyReport + ", (" + airlineId + ") " + airlineName
						+ " has generated a total revenue of: " + revenue + ".</b><br><br>");
			}
			if(!hasRevenue){
				out.println("No revenue has been generated in " + monthlyReport + ".");
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