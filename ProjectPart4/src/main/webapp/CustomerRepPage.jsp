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
			String query = "SELECT repId FROM customerRep WHERE repId = " + "'" + user + "'"
					+ "AND repPassword = " + "'" + pass + "';";
			
			ResultSet rs = stmt.executeQuery(query);
			rs.next();
			String userName = rs.getString("repId");
			out.println("<b>Hello Customer Representative: " + userName + "</b>\n");
			
		} catch(Exception ex){
			throw new RuntimeException(ex);
		}
		%>
		
		<form action = "CustomerRepCreateReservation.jsp" method = "post">
			
			<h3>Create reservation for Customer</h3>
			
			<span>
			Enter Customer ID: <input name = "customerId" required type = "text"/>
			</span>
			
			<input type = "submit" value = "Continue" style = "height:30px; width:70px"/>
		</form>
		
		
		<form action = "CustomerRepEditReservation.jsp" method = "post">
			
			<h3>Edit reservation for Customer</h3>
			
			<span>
			Enter Reservation ID: <input name = "resId" required type = "text"/>
			</span>
			
			<input type = "submit" value = "Continue" style = "height:30px; width:70px"/>
		</form>
		
		<form action = "CustomerReply.jsp" method = "post">
			<b><br>Enter the customerId to reply to a customer's question:</b>
			<%  request.getSession().setAttribute("user", request.getParameter("user")); %>
			Customer Id: <input name = "customerId" required type = "text"/>&nbsp;
			<input type = "submit" value = "Reply" style = "height:30px; width:60px"/>
		</form>
		
		
		
		<form action = "LoginChoice.jsp" method = "post">
			<b> </b><input type = "submit" value = "Logout" style = "height:40px; width:60px"/>
		</form>
	</body>
</html>