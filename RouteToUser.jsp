<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">  
<html xmlns="http://www.w3.org/1999/xhtml">  
<head runat="server">  
<title>Search Route Direction</title>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">   
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
    top: 150px;
   
}
.button1 {
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
    top: 50px;
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
    padding:1px;
}

@media screen and (max-height: 450px) {
  .sidenav {padding-top: 15px;}
  .sidenav a {font-size: 18px;}
}

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
            var getInfoWindow = new google.maps.InfoWindow({ content: "<b>Your Current Location</b><br/> Latitude:" +  
                                    lat + "<br /> Longitude:" + long + ""  
            });  
            getInfoWindow.open(map, marker);  
        }  
    </script>   
    <script type="text/javascript">  
        function SearchRoute() {  
            document.getElementById("MyMapLOC").style.display = 'none';  
  
            var markers = new Array();  
            var myLatLng;  
  
            //Find the current location of the user.  
            if (navigator.geolocation) {  
                navigator.geolocation.getCurrentPosition(function(p) {  
                    var myLatLng = new google.maps.LatLng(p.coords.latitude, p.coords.longitude);  
                    var m = {};  
                    m.title = "Your Current Location";  
                    m.lat = p.coords.latitude;  
                    m.lng = p.coords.longitude;  
                    markers.push(m);  
  
                    //Find Destination address location.  
                   // var address = document.getElementById("txtDestination").value; 
                     var address = "<%= session.getAttribute("source")%>"; 
                    var geocoder = new google.maps.Geocoder();  
                    geocoder.geocode({ 'address': address }, function(results, status) {  
                        if (status == google.maps.GeocoderStatus.OK) {  
                            m = {};  
                            m.title = address;  
                            m.lat = results[0].geometry.location.lat();  
                            m.lng = results[0].geometry.location.lng();  
                            markers.push(m);  
                            var mapOptions = {  
                                center: myLatLng,  
                                zoom: 4,  
                                mapTypeId: google.maps.MapTypeId.ROADMAP  
                            };  
                            var map = new google.maps.Map(document.getElementById("MapRoute"), mapOptions);  
                            var infoWindow = new google.maps.InfoWindow();  
                            var lat_lng = new Array();  
                            var latlngbounds = new google.maps.LatLngBounds();  
  
                            for (i = 0; i < markers.length; i++) {  
                                var data = markers[i];  
                                var myLatlng = new google.maps.LatLng(data.lat, data.lng);  
                                lat_lng.push(myLatlng);  
                                var marker = new google.maps.Marker({  
                                    position: myLatlng,  
                                    map: map,  
                                   // title: data.title  
                                });  
                                latlngbounds.extend(marker.position);  
                               (function(marker, data) {  
                                    google.maps.event.addListener(marker, "click", function(e) {  
                                        //infoWindow.setContent(data.title);  
                                        //infoWindow.open(map, marker);  
                                    });  
                                })(marker, data);  
                            }  
                            map.setCenter(latlngbounds.getCenter());  
                            map.fitBounds(latlngbounds);  
  
                            //***********ROUTING****************//  
  
                            //Initialize the Path Array.  
                            var path = new google.maps.MVCArray();  
  
                            //Getting the Direction Service.  
                            var service = new google.maps.DirectionsService();  
  
                            //Set the Path Stroke Color.  
                            var poly = new google.maps.Polyline({ map: map, strokeColor: '#4986E7' });  
  
                            //Loop and Draw Path Route between the Points on MAP.  
                            for (var i = 0; i < lat_lng.length; i++) {  
                                if ((i + 1) < lat_lng.length) {  
                                    var src = lat_lng[i];  
                                    var des = lat_lng[i + 1];  
                                    path.push(src);  
                                    poly.setPath(path);  
                                    service.route({  
                                        origin: src,  
                                        destination: des,  
                                        travelMode: google.maps.DirectionsTravelMode.DRIVING  
                                    }, function(result, status) {  
                                        if (status == google.maps.DirectionsStatus.OK) {  
                                            for (var i = 0, len = result.routes[0].overview_path.length; i < len; i++) {  
                                                path.push(result.routes[0].overview_path[i]);  
                                            }  
                                        } else {  
                                            alert("Invalid location.");  
                                            window.location.href = window.location.href;  
                                        }  
                                    });  
                                }  
                            }  
                        } else {  
                            alert("Request failed.")  
                        }  
                    });  
  
                });  
            }  
            else {  
                alert('Some Problem in getting Geo Location.');  
                return;  
            }  
        }  
    </script>  
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
</head>  
<body>  
<div id="main">
<div id="title" style="cursor:pointer"><span class="glyphicon glyphicon-map-marker"></span>Cabriolet
</div>
</div>

    <form id="form1" runat="server">  
    
            <td style="background-color: skyblue; text-align: center; font-family: Verdana; font-size: 14pt;  
                color: red;">  
              <!--    <b>Enter Destination:</b>  -->
            <!--     <input type="text" id="txtDestination" value=" <%= session.getAttribute("source")%>" style="width: 200px" />  --> 
                <input type="button" class ="button1" value="Search Route" onclick="SearchRoute()" />
            </td>  
        </tr>  
        <tr>  
            <td>  
                  <div id="MyMapLOC" style="width: 1000px; height: 600px">  
                </div>  
                <div id="MapRoute" style="width: 1000px; height: 600px">  
                </div>  
                <div>	             
	                <button  type = "submit" class = "button" value = "Start Trip" ><a href="NewFile.jsp">Start Trip</a></button>                      
               </div>
            </td>  
        </tr>  
    </form>  
</body>  
</html>  