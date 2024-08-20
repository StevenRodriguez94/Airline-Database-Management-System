<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page session="false"%>
<!DOCTYPE html>
<%@ page isErrorPage = "true" %>

<html>
   <head>
      <title>Show Error Page</title>
   </head>
   <body>
   	  <% 
      String msg = "Wrong username or password.";
      request.getSession().setAttribute("msg", msg);
      request.getRequestDispatcher("/LoginChoice.jsp").forward(request,response);
	  %>
   </body>
</html>