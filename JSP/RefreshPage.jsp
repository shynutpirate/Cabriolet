<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Refresh</title>
<style>
body,h1 {font-family: "Raleway", sans-serif}
body, html {height: 100%}
.bgimg {
    background-image: url('refresh.jpg');
    min-height: 100%;
    background-position: center;
    background-size: cover;
}

body {
    font-family: "Lato", sans-serif;
    transition: background-color .5s;
}

.button1{
    background-color: #ff9933; 
    border: none;
    color: black;
    padding: 25px 55px;
    text-align: center;
    text-decoration: none;
    display: inline-black;
    font-size: 22px;
    margin: 50px 10px;
    cursor: pointer;
}

.button{border-radius: 30px;}

.sidenav {
    height: 100%;
    width: 0;
    position: fixed;
    z-index: 1;
    top: 0;
    left: 0;
    background-color: #111;
    overflow-x: hidden;
    transition: 0.5s;
    padding-top: 60px;
}

.sidenav a {
    padding: 8px 8px 8px 32px;
    text-decoration: none;
    font-size: 25px;
    color: #818181;
    display: block;
    transition: 0.3s;
}

.sidenav a:hover, .offcanvas a:focus{
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
    transition: margin-left .5s;
    padding: 16px;
}

@media screen and (max-height: 450px) {
  .sidenav {padding-top: 15px;}
  .sidenav a {font-size: 18px;}
}
#title {
    font-family: "Allerta Stencil", Sans-serif;
    font-size: 50px;
    text-align: center;
    padding:1px;
    float: center;
}
</style>
</head>
<body>

<div id="main">
  <span style="font-size:30px;cursor:pointer" onclick ="openNav()">&#9776; </span>
  <div id="title" style="cursor:pointer" onclick="#"><span class="glyphicon glyphicon-map-marker"></span>Cabriolet</div>
</div>
<div id="mySidenav" class="sidenav">
  <a href="javascript:void(0)" class="closebtn" onclick ="closeNav()">&times;</a> 
  <a href="DriverProfile.jsp"><span class="glyphicon glyphicon-user" style="font-size:30px;color:white;"></span> Your Account</a>
 <a></a>
  <a href="#"><span class="glyphicon glyphicon-star-empty" style="font-size:30px;color:white;"></span> Your Rating</a>
   <a></a>
<a href="#"><span class="glyphicon glyphicon-credit-card" style="font-size:30px;color:white;"></span> Payment</a>
   <a></a>
<a href="RidesHistory.jsp"><span class="glyphicon glyphicon-list" style="font-size:30px;color:white;"></span> Rides History</a>
<a></a>
<a href="WelcomePage.html"><span class="glyphicon glyphicon-credit-off" style="font-size:30px;color:white;"></span>Logout</a>
   <a></a>
</div>


<div class="bgimg w3-display-container w3-animate-opacity w3-text-white">
  <div class="w3-display-middle">
  <!--  <form method="post" action = "RideController">
     <button  class = "button button1 " name ="refresh" value = "Refresh"> Refresh</button>

    </form> -->
  </div>  
</div>


<script>
function openNav() {
    document.getElementById("mySidenav").style.width = "250px";
    document.getElementById("main").style.marginLeft = "250px";
    document.body.style.backgroundColor = "rgba(0,0,0,0.4)";
}

function closeNav() {
    document.getElementById("mySidenav").style.width = "0";
    document.getElementById("main").style.marginLeft= "0";
    document.body.style.backgroundColor = "white";
}

</script>
</body>
</html>