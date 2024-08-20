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
		<title>Add Edit Customer Info Page</title>
	</head>
	<body>
		<%
		try{
 			TravelSystem db = new TravelSystem();	
			Connection con = db.getConnection();
			Statement stmt = con.createStatement();
			
			String customerRepId = request.getParameter("customerRepId");
			String customerRepCol = request.getParameter("customerRepCol");
			String customerRepNewInfo = request.getParameter("customerRepNewInfo");
			
 			String update = "UPDATE customerRep "
 					+ "SET " + customerRepCol + " = '" + customerRepNewInfo + "' WHERE repId = '" + customerRepId + "'";
				
			int up = stmt.executeUpdate(update);
			String query = "SELECT * FROM customerRep WHERE repId = '" + customerRepId + "'";
			ResultSet rs = stmt.executeQuery(query);
			rs.next();
			
			String repId = rs.getString("repId");
			String repname = rs.getString("repName");
 			String reppassword = rs.getString("repPassword");
			String repdob = rs.getString("repDoB");
			String repaddress = rs.getString("repAddress");
			String repphonenum = rs.getString("repPhoneNum");
			String repgender = rs.getString("repGender");
			
			out.println("<b>Updated information for customer representative: </b>" + repname);
			
			out.println("<b><br><br>Customer Representative Id: </b>" + repId + ".<br>");
 			out.println("<b>Customer Representative Name: </b>" + repname + ".<br>");
			out.println("<b>Customer Representative Password: </b>" + reppassword + ".<br>");
			out.println("<b>Customer Representative Date of Birth: </b>" + repdob + ".<br>"); 
			out.println("<b>Customer Representative Address: </b>" + repaddress + ".<br>");
 			out.println("<b>Customer Representative Phone Number: </b>" + repphonenum + ".<br>");
			out.println("<b>Customer Representative Gender: </b>" + repgender + ".<br>");


		} catch(Exception ex){
			throw new RuntimeException(ex);
		}
		%>
		
		<form method = "post">
			<b><input type = "button" value = "Return to previous page" onclick = "history.back()" style = "height:30px; width:200px"/></b>
		</form>
		
	</body>
</html>