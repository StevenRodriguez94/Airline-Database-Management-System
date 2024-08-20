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
		<title>Delete Customer Rep Info Page</title>
	</head>
	<body>
		<%
		try{
 			TravelSystem db = new TravelSystem();	
			Connection con = db.getConnection();
			Statement stmt = con.createStatement();
			
			String customerId = request.getParameter("customerId");
			String customerCol = request.getParameter("customerCol");
			
 			String update = "UPDATE customer "
 					+ "SET " + customerCol + " = null WHERE customerId = '" + customerId + "'";
				
			int up = stmt.executeUpdate(update);
			String query = "SELECT * FROM customer WHERE customerId = '" + customerId + "'";
			ResultSet rs = stmt.executeQuery(query);
			rs.next();
			
			String customerid = rs.getString("customerId");
			String customername = rs.getString("customerName");
 			String customerpassword = rs.getString("password");
			String customerssn = rs.getString("customerSSN");
			
			out.println("<b>Updated information for customer: </b>" + customername);
			
			out.println("<b><br><br>Customer Id: </b>" + customerid + ".<br>");
 			out.println("<b>Customer Name: </b>" + customername + ".<br>");
			out.println("<b>Customer Password: </b>" + customerpassword + ".<br>");
			out.println("<b>Customer SSN: </b>" + customerssn + ".<br>"); 


		} catch(Exception ex){
			throw new RuntimeException(ex);
		}
		%>
		
		<form method = "post">
			<b><input type = "button" value = "Return to previous page" onclick = "history.back()" style = "height:30px; width:200px"/></b>
		</form>
		
	</body>
</html>