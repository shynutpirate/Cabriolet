<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Ride History</title>
<meta name="viewport" content="initial-scale=1.0, user-scalable=no">
<meta charset="utf-8">
<link rel="stylesheet" type="text/css" href="../CSS/RideHistory.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Allerta+Stencil">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="../JS/RideHistory.js"></script>
<script>
	function confirmGo(m, u) {
		if (confirm(m)) {
			window.location = u;
		}
	}
</script>
</head>

<body>
<header>
		<div id="mySidenav" class="sidenav">
			<a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
			<br> <a href="DiverProfile.jsp"><span class="glyphicon glyphicon-user"
				style="font-size: 30px; color: white;"></span>&ensp; Your Account</a> <a></a>
			<a href="homePage.jsp"><span class="glyphicon glyphicon-star-empty"
				style="font-size: 30px; color: white;"></span>&ensp; Your Ride</a> <a></a>
			<a href="#"><span class="glyphicon glyphicon-credit-card"
				style="font-size: 30px; color: white;"></span>&ensp; Payment</a> <a></a>
			<a href="RideHistory.jsp"><span class="glyphicon glyphicon-list"
				style="font-size: 30px; color: white;"></span>&ensp; Rides History</a> <a></a>
			<a href="WelcomePage.html"><span class="glyphicon glyphicon-off"
				style="font-size: 30px; color: white;"></span>&ensp; Log Out</a>
		</div>

		<div id="main">
			<span style="font-size: 40px; cursor: pointer" onclick="openNav()">&#9776;</span>
		</div>

		<div id="title" style="cursor: pointer" onclick="HomePage.jsp">
			<span class="glyphicon glyphicon-map-marker"></span>Cabriolet
		</div>
		<hr>
	</header>
	<sql:setDataSource var="dbsource" driver="com.mysql.jdbc.Driver"
		url="jdbc:mysql://localhost/cabriolet" user="srividya" password="srividyaswamy" />

	<sql:query dataSource="${dbsource}" var="result">
            SELECT * from ride where driverId = <%= session.getAttribute("phonenumber") %> order by bookingTime desc;
        </sql:query>
	<center>
		<form>
			<table class="table-responsive table-striped table-bordered" border="" width="60%"> 
				<thead class="thead">
					<tr height = "10%">
						<th>Customer Id</th>
						<th>Source</th>
						<th>Destination</th>
						<th>Status</th>
						<th>Amount</th>
						<th>Booking Time</th>
					</tr>
				</thead>
				<c:forEach var="row" items="${result.rows}">
					<tr>
						<td><c:out value="${row.customerId}" /></td>
						<td width="30%"><c:out value="${row.source}" /></td>
						<td><c:out value="${row.destination}" /></td>
						<td width = "15%"><c:out value="${row.status}" /></td>
						<td><c:out value="${row.amount}" /></td>
						<td width="20%"><c:out value="${row.bookingTime}" /></td>
					</tr>
				</c:forEach>
			</table>
		</form>
	</center>
</body>
</html>


