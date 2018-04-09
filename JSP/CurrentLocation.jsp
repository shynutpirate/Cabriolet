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
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">  
<title>Current Location</title>
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
    position:absolute;
    transition: .5s ease;
    right: 1px;
    top: 180px;
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
.button1 {
    background-color: green;
    border: none;
    color: white;
    padding: 5px 12px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 16px;
    margin: 4px 2px;
    cursor: pointer;
    position : absolute;
    top : 20px;
    right: 40px;    
}
</style>
</style>
  
    <script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?sensor=false"></script>  
  
    <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAVggilex7Y9t61m3WCIZGkyuYtqPTom6g">  
    </script>  
  
    <script type="text/javascript">  
        if (navigator.geolocation) {  
            navigator.geolocation.getCurrentPosition(success);  
        } else {  
            alert("There is Some Problem on your current browser to get Geo Location!");  
        }  
  
        function success(position) {  
            var lat = position.coords.latitude;  
            var long = position.coords.longitude;  
            var city = position.coords.locality;  
            var LatLng = new google.maps.LatLng(lat, long);  
            var mapOptions = {  
                center: LatLng,  
                zoom: 12,  
                mapTypeId: google.maps.MapTypeId.ROADMAP  
            };  
  
            var map = new google.maps.Map(document.getElementById("MyMapLOC"), mapOptions);  
            var marker = new google.maps.Marker({  
                position: LatLng,  
                title: "<div style = 'height:60px;width:200px'><b>Your location:</b><br />Latitude: "  
                            + lat + +"<br />Longitude: " + long  
            });  
  
            marker.setMap(map);  
        }  
    </script>  
   
	</head>
<body>

	 <!--  <button onclick="document.getElementById('id01').style.display='block'" class=" button">Search Rides</button>  -->
	  <form action = "JSP/Loading.jsp" > 
     <button type = "submit" class=" button" >Search Rides</button> 
	  </form> 
<div id="main">
<div id="title" style="cursor:pointer"><span class="glyphicon glyphicon-map-marker"></span>Cabriolet
<form action = "JSP/Logout.jsp">
<button class = "button1" >Offline</button>

</form>
</div>
</div>
<div id="MyMapLOC" style="width: 1000px; height: 600px"> 

</div>
</div>

</body>  
</html>