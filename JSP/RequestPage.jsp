<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"> 
<title>Insert title here</title>
<style>
.button {
    background-color: black; 
    border: none;
    color: white;
    padding: 12px 50px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 20px;
    margin: 30px 250px;
    cursor: pointer;
    transition: .5s ease;
}
.button1 {
    background-color: black; 
    border: none;
    color: white;
    padding: 12px 15px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 20px;
    margin: 50px 200px;
    cursor: pointer;
    transition: .5s ease;
}
#title {
    background-color:black;
    color:white;
    font-family: "Allerta Stencil", Sans-serif;
    font-size: 50px;
    text-align: center;
    padding:1px;
    float: center;
}
#icon {
    background-color:black;
    color:white;
    font-family: "Allerta Stencil", Sans-serif;
    font-size: 50px;
    text-align: right;
    padding:1px;
    float: center;
}
html, body {
	height: 100%;
	margin: 0;
	padding: 0;
}

h {
	font-size: 40px;
	font-family: Times New Roman;
	text-align: center !important;
	color: black !important;
}

p {
	font-size: 30px;
	font-family: Ubuntu;
	text-align: center !important;
	color: black !important;
}

h1 {
	font-size: 25px !important;
	margin-top: 20px !important;
 	margin-bottom: 20px !important;
}

.submit {
	font-size: 1.1em;
	width: 200px;
	background-color: #424242 !important;
	color: white !important;
	float: right;
}

.glyphicon {  
	margin-bottom: 10px;
	margin-right: 10px;
}

p1{
	font-size: 20px !important;
}
.sidenav {
	height: 100%;
	width: 0;
	position: fixed;
	z-index: 1;
	top: 0;
	right: 0;
	background-color: #111;
	overflow-x: hidden;
	transition: 0.5s;
	padding-top: 60px;
	text-align: left;
}

.sidenav a {
	padding: 8px 8px 8px 32px;
	text-decoration: none;
	font-size: 25px;
	color: #818181;
	display: block;
	transition: 0.3s;
}

.sidenav a:hover, .offcanvas a:focus {
	color: #f1f1f1;
}

.sidenav .closebtn {
	position: absolute;
	top: 0;
	right: 25px;
	font-size: 36px;
	margin-left: 50px;
}

#main {
	transition: margin-right .5s;
	padding: 16px;
	float: right;
	color: white;
}

#title {
	font-family: "Allerta Stencil", Sans-serif;
	font-size: 50px;
	text-align: center;
	float: center;
	padding: 16px;
	background-color: #424242;
	color: white;
}

@media screen and (max-height: 450px) {
	.sidenav {
		padding-top: 15px;
	}
	.sidenav a {
		font-size: 18px;
	}
}

.input-group-addon img {
	height: 50px;
	margin-right: -5px;
	margin-bottom: -10px;
	vertical-align: text-bottom; /* align the text */
}

.heading {
	font-size: 50px;
	font-family: "Allerta Stencil", Sans-serif;
	text-align: center;
	background-color: #424242;
	color: white;
}


hr {
	margin-top: 0px !important;
	margin-bottom: 2px !important;
	border: 0;
	border-top: 2px solid black !important;
}

.thead{
	color: white;
	background-color: black;
	border-color: #9e9e9e;
}

.table-responsive{
	border-color: black;


</style>
</head>
<body>

<div id="title" style="cursor: pointer" onclick="HomePage.jsp">
			<span class="glyphicon glyphicon-map-marker"></span>Cabriolet
		</div>
<center>
		<h>Do You Want To Take This Ride? </h>
		<p>Here are your Rider's details:</p>
	</center>
<div class="row">
			<div class="col-md-6 col-md-offset-3">
				<div class="well well-sm">
					<div class="row">
						<div class="col-sm-6 col-md-4">
							<img src="http://placehold.it/380x500" alt=""
								class="img-rounded img-responsive" />
						</div>
						<div class="col-sm-6 col-md-8">
						<p1> <i class="glyphicon glyphicon-user"></i>Name : <%= session.getAttribute("cName") %><br>
								<i class="glyphicon glyphicon-phone"></i>   Phone Number :<%= session.getAttribute("phoneNumber") %>
								 <br>
								<i class="glyphicon glyphicon-marker"> </i> Source : <%= session.getAttribute("source") %> <br>
								<i class="glyphicon glyphicon-marker"></i> Destination : <%= session.getAttribute("destination") %><br>
								
								</p1>
					</div>
					</div>
				</div>
			</div>
		</div>

<!-- <br>
<h1> <center> Want to take This Ride?</h1>
<br>
     Name : <%= session.getAttribute("cName")%>
     <br>
     Phone Number :<%= session.getAttribute("phoneNumber") %>
     <br>
     Source : <%= session.getAttribute("source") %>
     <br>
     Destination : <%= session.getAttribute("destination") %>
     <br>
</center>  -->  
<form action = "../RideController" method = "post">
<button class = "button" name = "Accept" value = "Accept"> Accept</button>
<button  class = "button" name = "Reject" value = "Reject">Reject </button>
</form>
</body>
</html>