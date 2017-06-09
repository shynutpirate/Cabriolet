<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.ArrayList" %>
//<%@ page import = "com.talentsprint.bean" %>

<html>
<head>
<title>JSTL</title>
</head>
<body>
<%  
// retrieve your list from the request, with casting 
ArrayList<RideHistory> list = (ArrayList<RideHistory>)request.getAttribute("rideList");

// print the information about every category of the list
for(RideHistory rd: list) {   

rd = list.get(1);
out.println(rd.getDriverId());
out.println( rd.getCustomerId());
out.println( rd.getSource());
out.println( rd.getDestination());
out.println( rd.getStatus());
out.println( rd.getAmount());
out.println( rd.getBookingTime());



}
%>
</body>
</html>
