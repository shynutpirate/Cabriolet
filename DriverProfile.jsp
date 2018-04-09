
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
<title>Cabriolet</title>
</head>
<style>
body,h1 {font-family: "Raleway", sans-serif}
body, html {height: 100%}
.bgimg {
    background-image: url('http://www.blog.tv-shop.tv/wp-content/uploads/2014/10/voznja.jpg');
    min-height: 100%;
    background-position: center;
    background-size: cover;
}

.w3-text-white, .w3-hover-text-white:hover {
    color: black!important;
}
body {
    font-family: "Lato", sans-serif;
    transition: background-color .5s;
}

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
    font-size: 35px;
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
  .sidenav {padding-top: 15px;}
  .sidenav a {font-size: 18px;}
}

h1{
	font-family: "Allerta Stencil", Sans-serif !important;
	text-align: center;
	font-size: 70px !important;
	margin-top: 20px !important;
  margin-bottom: 20px !important;
}

.glyphicon {  
	margin-bottom: 10px;
}

small {
	display: block;
	line-height: 1.428571429;
	color: #999;
}

hr {
    margin-top: 0px !important;
    margin-bottom: 2px !important;
    border: 0;
    border-top: 2px solid black !important;
}
.col-sm-6 col-md-8{
text-align : center !important;
}
</style>
<body>

<div id="main">
  <span style="font-size:30px;cursor:pointer" onclick="openNav()">&#9776; </span>
  </div>
<div id="mySidenav" class="sidenav">
  <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
 <br>
 <a href="DriverProfile.jsp"><span class="glyphicon glyphicon-user" style="font-size:30px;color:white;"></span> Your Account</a>
 <a></a>
  <a href="#"><span class="glyphicon glyphicon-star-empty" style="font-size:30px;color:white;"></span> Your Rating</a>
   <a></a>
<a href="#"><span class="glyphicon glyphicon-credit-card" style="font-size:30px;color:white;"></span> Payment</a>
   <a></a>
<a href="RidesHistory.jsp"><span class="glyphicon glyphicon-list" style="font-size:30px;color:white;"></span> Rides History</a>
<a href="DriverOnline.html"><span class="glyphicon glyphicon-home" style="font-size:30px;color:white;"></span> Home Page</a>
   <a></a>
</div>
<div id="mySidenav" class="sidenav">
  <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
</div>
<div class="bgimg w3-display-container w3-animate-opacity w3-text-white">
<div class="container">
  	<h1>Your Profile</h1>
		<br>
		<div class="row">
        <div class="col-md-6 col-md-offset-3">
            <div class="well well-sm">
                <div class="row">
                    
                    <div class="col-sm-6 col-md-8">
                         Name : <%= session.getAttribute("name")%>
                        <p>
                            <i class="glyphicon glyphicon-map-marker"></i><%= session.getAttribute("city") %>
                            <br>
                            <i class="glyphicon glyphicon-envelope"></i><%= session.getAttribute("email")%>
                            <br>
                            <i class="glyphicon glyphicon-gift"></i><%= session.getAttribute("DOB") %></p>
                    </div>
                </div>
            </div>
			</div>
        </div>
    </div>
    </div>
<script>
function openNav() {
    document.getElementById("mySidenav").style.width = "400px";
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