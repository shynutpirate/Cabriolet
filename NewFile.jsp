<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>
<!DOCTYPE html>
<html>
 <head>
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">  

    <meta charset="utf-8">

    <title>Route To Destination</title>

    <style>

      /* Always set the map height explicitly to define the size of the div

       * element that contains the map. */

      #map {
        height: 100%;
        width : 85%;
        top: 7%;

      }
      .button {
    background-color: black; 
    border: none;
    color: white;
    padding: 10px 25px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 20px;
    margin: 190px 100px;
    cursor: pointer;
    position:absolute;
    transition: .5s ease;
    right : -50px;
    top: 180px;
}

      /* Optional: Makes the sample page fill the window. */

      html, body {

        height: 100%;

        margin: 0;

        padding: 0;

      }

      #floating-panel {

        position: absolute;

        top: 80px;

        left: 20%;

        <!--z-index: 5;-->

        background-color: #fff;

        padding: 5px;

        border: 1px solid #999;

        text-align: center;

        font-family: 'Roboto','sans-serif';

        line-height: 30px;

        padding-left: 10px;

      }

      #warnings-panel {

        width: 100%;

        height:10%;

        text-align: center;

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
#main {
    transition: margin-left .5s;
    padding:1px;
}
    </style>

  </head>

  <body>
  <div id="main">
<div id="title" style="cursor:pointer"><span class="glyphicon glyphicon-map-marker"></span>Cabriolet
</div>
</div> 

<sql:setDataSource var = "snapshot" driver = "com.mysql.jdbc.Driver"
url = "jdbc:mysql://localhost/cabriolet"
user = "srividya"  password = "srividyaswamy"/>

<sql:update dataSource = "${snapshot}" var = "count">
   update ride set status = "Driving" where driverId = <%= session.getAttribute("driverId") %>
</sql:update>

<form action = "bill.jsp" >
    <button type = "submit" class=" button" >End Ride</button>
    </form>
    <div id="floating-panel">

    <b>Start: </b>

    <select id="start">

      <option value="<%= session.getAttribute("source")%>"><%= session.getAttribute("source")%></option>
    </select>

    <b>End: </b>

    <select id="end">

      <option value=" <%=session.getAttribute("destination") %> "><%= session.getAttribute("destination")%></option>

    </select>

    </div>

    <div id="map"></div>

    &nbsp;

    <div id="warnings-panel"></div>

    <script>

      function initMap() {

        var markerArray = [];



        // Instantiate a directions service.

        var directionsService = new google.maps.DirectionsService;



        // Create a map and center it on Manhattan.

        var map = new google.maps.Map(document.getElementById('map'), {

          zoom: 13,

          center: {lat: 17.38, lng: 78.48}

        });



        // Create a renderer for directions and bind it to the map.

        var directionsDisplay = new google.maps.DirectionsRenderer({map: map});



        // Instantiate an info window to hold step text.

        var stepDisplay = new google.maps.InfoWindow;



        // Display the route between the initial start and end selections.

        calculateAndDisplayRoute(

            directionsDisplay, directionsService, markerArray, stepDisplay, map);

        // Listen to change events from the start and end lists.

        var onChangeHandler = function() {

          calculateAndDisplayRoute(

              directionsDisplay, directionsService, markerArray, stepDisplay, map);

        };

        document.getElementById('start').addEventListener('change', onChangeHandler);

        document.getElementById('end').addEventListener('change', onChangeHandler);

      }



      function calculateAndDisplayRoute(directionsDisplay, directionsService,

          markerArray, stepDisplay, map) {

        // First, remove any existing markers from the map.

        for (var i = 0; i < markerArray.length; i++) {

          markerArray[i].setMap(null);

        }



        // Retrieve the start and end locations and create a DirectionsRequest using

        // WALKING directions.

        directionsService.route({

          origin: document.getElementById('start').value,

          destination: document.getElementById('end').value,

          travelMode: 'DRIVING'

        }, function(response, status) {

          // Route the directions and pass the response to a function to create

          // markers for each step.

          if (status === 'OK') {

            document.getElementById('warnings-panel').innerHTML =

                '<b>' + response.routes[0].warnings + '</b>';

            directionsDisplay.setDirections(response);

            //showSteps(response, markerArray, stepDisplay, map);

          } else {

            window.alert('Directions request failed due to ' + status);

          }

        });

      }



      function showSteps(directionResult, markerArray, stepDisplay, map) {

        // For each step, place a marker, and add the text to the marker's infowindow.

        // Also attach the marker to an array so we can keep track of it and remove it

        // when calculating new routes.

        var myRoute = directionResult.routes[0].legs[0];

        for (var i = 0; i < myRoute.steps.length; i++) {

          var marker = markerArray[i] = markerArray[i] || new google.maps.Marker;

          marker.setMap(map);

          marker.setPosition(myRoute.steps[i].start_location);

          attachInstructionText(

              stepDisplay, marker, myRoute.steps[i].instructions, map);

        }

      }



      function attachInstructionText(stepDisplay, marker, text, map) {

        google.maps.event.addListener(marker, 'click', function() {

          // Open an info window when the marker is clicked on, containing the text

          // of the step.

          stepDisplay.setContent(text);

      //    stepDisplay.open(map, marker);

        });

      }

    </script>

    <script async defer

    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCErguwdbYflY_1z5HTHTicrvtTpL1u3e0&callback=initMap">

    </script>

  </body>

</html>