<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>
<%@ page import ="com.talentsprint.bean.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<% 
		response.setContentType("text/html");
		String offline = request.getParameter("offline");
		String emailId = (String)session.getAttribute("emailId") ;
		DriverLogin dl = new DriverLogin();
		dl.updatingStatusOffline(offline, emailId);
		RequestDispatcher rd = request.getRequestDispatcher("/DriverOnline.html");
		rd.forward(request, response);		
%>
</body>
</html>