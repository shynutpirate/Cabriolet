<%@ page language="java" contentType="text/html; charset=ISO-8859-1"

    pageEncoding="ISO-8859-1"%>
    <%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>
<%@ page import = "java.util.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
    <meta charset="utf-8">
    <title>bill</title>
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"> 
<style>
.button{
    background-color: black; 
    border: none;
    color: white;
    padding: 15px 25px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 20px;
    margin: 10px 550px;
    cursor: pointer;   
    transition: .5s ease;
    
}
.invoice-box{
     max-width:800px;
     margin:auto;
     padding:30px;
     border:1px solid #eee;
     box-shadow:0 0 10px rgba(0, 0, 0, .15);
     font-size:16px;
     line-height:24px;
     font-family:'Helvetica Neue', 'Helvetica', Helvetica, Arial, sans-serif;
     color:#555;
    }
.invoice-box table{
     width:100%;
     line-height:inherit;
     text-align:left;
    }
 .invoice-box table td{
     padding:5px;
     vertical-align:top;
    }

.invoice-box table tr td:nth-child(2){
     text-align:right;
    }
 .invoice-box table tr.top table td{
        padding-bottom:20px;
    }
.invoice-box table tr.top table td.title{
        font-size:45px;
        line-height:45px;
        color:#333;
    }
.invoice-box table tr.information table td{
        padding-bottom:40px;
    }
.invoice-box table tr.heading td{
        background:#eee;
        border-bottom:1px solid #ddd;
        font-weight:bold;
    }
.invoice-box table tr.details td{
        padding-bottom:20px;
    }
 .invoice-box table tr.item td{
        border-bottom:1px solid #eee;
    }
.invoice-box table tr.item.last td{
        border-bottom:none;
    }
.invoice-box table tr.total td:nth-child(2){
        border-top:2px solid #eee;
        font-weight:bold;
    }
@media only screen and (max-width: 600px) {
       .invoice-box table tr.top table td{
            width:100%;
            display:block;
            text-align:center;
        }
.invoice-box table tr.information table td{
            width:100%;
            display:block;
            text-align:center;
 }


    </style>
</head>

<body>
<sql:setDataSource var = "snapshot" driver = "com.mysql.jdbc.Driver"
url = "jdbc:mysql://localhost/cabriolet"
user = "srividya"  password = "srividyaswamy"/>
  <sql:update dataSource = "${snapshot}" var = "count">
   update ride set status = "Completed" where driverId = <%= session.getAttribute("driverId") %>
</sql:update>

<center>
<h1>Ride Successfully Completed </h1>
<h2>Bill</h2>
</center>
<div class="invoice-box">
        <table cellpadding="0" cellspacing="0">
            <tr class="top">
                <td colspan="2">
                    <table>
                        <tr>                         
                            <td>                      
                                Created: <%= java.time.LocalDate.now() %><br>                           
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>          
            <tr class="heading">
                <td>
                    Payment Method
                </td>
                <td>
                    Cash
                </td>
            </tr>
            <br>
            <tr class="heading">
                <td>
                    Ride
                </td>
                <td>
                   Details
                </td>
            </tr>
            <tr class="item">
                <td>
                    Source
                </td>
                <td>
                  <%= session.getAttribute("source") %>
                </td>
            </tr>
            <tr class="item">
                <td>
                 Destination
                </td>
                 <td>
                   <%= session.getAttribute("destination") %>
                </td>
            </tr>
            <tr class="total">
                <td></td>
                 <td>
                   Total: <%=session.getAttribute("amount") %>
                </td>
            </tr>
        </table>
    </div>
     <div>	             
    	 <button  type = "submit" class = "button" value = "Home" ><a href="JSP/CurrentLocation.jsp">Home</a></button> 
    	  <button  type = "submit" class = "button" value = "SendBill" ><a href = "SendEmail.jsp" >Send Bill</a></button>                                          
   </div>
</body>

</html>