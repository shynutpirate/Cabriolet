<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style>
.button {
    background-color: black; 
    border: none;
    color: white;
    padding: 25px 55px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 20px;
    margin: 190px 100px;
    cursor: pointer;
    transition: .5s ease;
}

</style>
</head>
<body>
<h1> Choose To Take a Ride</h1>
<form action = "RideController" method = "post">
<button class = "button" name = "Accept" value = "Accept"> Accept</button>
<button  class = " button" name = "Reject" value = "Reject">Reject </button>
</form>
</body>
</html>