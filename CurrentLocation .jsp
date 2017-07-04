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
    
    
}
.button2 {
    background-color: red;
    border: none;
    color: white;
    padding: 5px 12px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 16px;
    margin: 4px 2px;
    cursor: pointer;
    
   
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
	  <form action = "Loading.jsp" > 
     <button type = "submit" class=" button" >Search Rides</button> 
	  </form> 
<div id="main">
<div id="title" style="cursor:pointer"><span class="glyphicon glyphicon-map-marker"></span>Cabriolet
<div id="icon" style="cursor:pointer"><span class="glyphicon glyphicon-off"></span>
</div>
</div>
<div id="MyMapLOC" style="width: 1000px; height: 600px"> 

</div>
</div>

<!-- <div class="w3-container">



  <div id="id01" class="w3-modal">
    <div class="w3-modal-content w3-card-4 w3-animate-zoom" style="max-width:600px">
  
      <div class="w3-center"><br>
        <span onclick="document.getElementById('id01').style.display='none'" class="w3-button w3-xlarge w3-transparent w3-display-topright" title="Close Modal">×</span>
        <img src="backgroundcar.jpg" alt="Avatar" style="width:30%" class="w3-circle w3-margin-top">
      </div>

       <form action= "RideController" method ="post" >
        <div class="w3-section">
          <label><b>User Name : </b></label>
          <br>
          <label><b>Phone Number :  </b></label>
          <br>
         
          <button  class = "button1" type="submit">Accept</button>
          </form>
          <button class="button2" type="submit">Reject</button>
         
        </div>
      </form>

      <div class="w3-container w3-border-top w3-padding-16 w3-light-grey">
      </div>

    </div>
  </div>
</div>  -->

<!-- <script>
function checkForRides() {
	var xhttp = new XMLHttpRequest();
	xhttp.onreadystatechange = function() {
		if(this.readyState == 4 && this.status == 200) {
			var resp = this.responseText;
			
			document.getElementById("results").innerHTML = resp;
			alert(resp);
			resp=resp.trim();
			if(resp=="Waiting") {
				alert('if');
				clearInterval(myVar);
			}
		}
		};


	xhttp.open("GET","RouteToUser.jsp",true);
	xhttp.send();
	}
</script> -->
</body>  
</html>