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
			String query = "SELECT customerId FROM customer WHERE customerId = " + "'" + user + "'"
					+ "AND password = " + "'" + pass + "'";
			
			ResultSet rs = stmt.executeQuery(query);
			rs.next();
			String userName = rs.getString("customerId");
			out.println("<b>Hello: " + userName + "</b>\n");
			
		} catch(Exception ex){
			throw new RuntimeException(ex);
		}
		%>
		
		<form action = "CustomerOneWayFlight.jsp" method = "post">
			<b><br>Search all available flights that are one-way on a specific date:</b>
			Date: <input name = "date" required type = "text"/>&nbsp;
			<input type = "submit" value = "Search" style = "height:30px; width:60px"/>
		</form>
		
		<form action = "CustomerRoundTripFlight.jsp" method = "post">
			<b><br>Search all available flights that are round-trip on a specific date:</b>
			Date: <input name = "date" required type = "text"/>&nbsp;
			<input type = "submit" value = "Search" style = "height:30px; width:60px"/>
		</form>
		
		<form action = "CustomerThreeFlight.jsp" method = "post">
			<b><br>Search all available flights between today and up to three days after:</b>&nbsp;
			<input type = "submit" value = "Search" style = "height:30px; width:60px"/>
		</form>
		
		<form action = "CustomerResultingFlights.jsp" method = "post">
			<b><br>Search all available flights:</b>
			Sort By: <input name = "sort" required type = "text"/>&nbsp;
			<input type = "submit" value = "Search" style = "height:30px; width:60px"/>
		</form>
		
		<form action = "CustomerFlightFilter.jsp" method = "post">
			<b><br>Filter Flights by Different Criteria:</b>
			Search By Attribute: <input name = "filter" required type = "text"/>&nbsp;
			Search By Value: <input name = "data" required type = "text"/>&nbsp;
			    <%  request.getSession().setAttribute("user", request.getParameter("user")); %>
			<input type = "submit" value = "Search" style = "height:30px; width:60px"/>
		</form>
		
		<form action = "CustomerCancelReservation.jsp" method = "post">
			<b><br>Cancel Reservation for Customer:</b>
			Enter customer Id: <input name = "user" required type = "text"/>&nbsp;
			Enter reservation Id to cancel: <input name = "reservationId" required type = "text"/>&nbsp;
			<input type = "submit" value = "Search" style = "height:30px; width:60px"/>
		</form>
		
		<form action = "CustomerUpcomingReservations.jsp" method = "post">
			<b><br>All upcoming reservations:</b>
			Customer Id: <input name = "user" required type = "text"/>&nbsp;
			<input type = "submit" value = "Search" style = "height:30px; width:60px"/>
		</form>
		
		<form action = "CustomerPastReservations.jsp" method = "post">
			<b><br><br>All past reservations:</b>
			Customer Id: <input name = "user" required type = "text"/>&nbsp;
			<input type = "submit" value = "Search" style = "height:30px; width:60px"/>
		</form>
		
		<form action = "CustomerAskQuestions.jsp" method = "post">
			<b><br><br>Submit a Question; Eventually, A Customer Representative will give you an Answer:</b>
		    <%  request.getSession().setAttribute("user", request.getParameter("user")); %>
			Question: <input name = "question" required type = "text"/>&nbsp;
			<input type = "submit" value = "Submit" style = "height:30px; width:60px"/>
		</form>
		
		<form action = "CustomerCheckSelfQuestions.jsp" method = "post">
			<b><br><br>Check All posted questions and their respective answers: &nbsp;&nbsp;</b>
		    <%  request.getSession().setAttribute("user", request.getParameter("user")); %>
			<input type = "submit" value = "Search" style = "height:30px; width:60px"/>
		</form>
		
		<form action = "CustomerKeywordQuestionSearch.jsp" method = "post">
			<b><br><br>Search any posted question by a keyword:</b>
			Keyword: <input name = "keyword" required type = "text"/>&nbsp;
			<input type = "submit" value = "Search" style = "height:30px; width:60px"/>
		</form>
		
		<form action = "CustomerKeywordAnswerSearch.jsp" method = "post">
			<b><br><br>Search any posted answer by a keyword:</b>
			Keyword: <input name = "keyword" required type = "text"/>&nbsp;
			<input type = "submit" value = "Search" style = "height:30px; width:60px"/>
		</form>
		
		<form action = "LoginChoice.jsp" method = "post">
			<b> </b><input type = "submit" value = "Logout" style = "height:40px; width:60px"/>
		</form>
	</body>
</html>