<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
<title>Insert title here</title>
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
.button {
    background-color: black; 
    border: none;
    color: white;
    padding: 15px 25px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 20px;
    margin: 100px 250px;
    cursor: pointer;    
    transition: .5s ease;
   
}
</style>
</head>
<body>
   
 <sql:setDataSource var = "snapshot" driver = "com.mysql.jdbc.Driver"
         url = "jdbc:mysql://localhost/cabriolet"
         user = "srividya"  password = "srividyaswamy"/>

         <sql:query dataSource = "${snapshot}" var = "result">
            SELECT * from DriverApplicants limit 1;
         </sql:query>
         
         <h1>Details Of Applied Driver</h1>
		<br>
		<div class="row">
        <div class="col-md-6 col-md-offset-3"> 
            <div class="well well-sm">
                <div class="row">
                    
                    <div class="col-sm-6 col-md-8">
                        <i class = "glyphicon glyphicon-user"></i>Name : <%= session.getAttribute("firstName")%>
                        <p>
                            <i class="glyphicon glyphicon-map-caledar"></i><%= session.getAttribute("DOB") %>
                            <br>
                            <i class="glyphicon glyphicon-envelope"></i><%= session.getAttribute("email")%>
                            <br>
                            <i class="glyphicon glyphicon-phone"></i><%= session.getAttribute("phonenumber") %>
                            <br>
                             <i class="glyphicon glyphicon-map-marker"></i><%= session.getAttribute("city") %>
                            <br>
                            <i class="glyphicon glyphicon-"></i><%= session.getAttribute("licenseNumber") %></p>
                    </div>
                </div>
            </div>
			</div>
        </div>
        <div>	 
	 <form method = "post" action = "NewDriverController">
	 <button  class = "button1 button" name = "AddDriver" value = "AddDriver" >Add Driver</button>
	 <button class = "button" name = "RejectDriver" value = "RejectDriver" >Reject Driver</button>
     
      </form>
   </div>  
  
</body>
</html>