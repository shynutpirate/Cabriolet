<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="CSS/Register.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Allerta+Stencil">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style>
body,h1,h5 {font-family: "Raleway", sans-serif}

.w3-allerta {
  font-family: "Allerta Stencil", Sans-serif;
  font-size: 80px;
}

body, html{height: 100%}

.bgimg {
    background-image: url('Images/backgroungcar.jpg');
    min-height: 100%;
    background-position: center;
    background-size: cover;
}

h4, .close {
    background-color: black;
    color:white !important;
    text-align: center;
    font-size: 30px;
    height: 100%
}

.container-header {
    background-color: black;
    color:white !important;
    text-align: center;
    font-size: 30px;
}

.footer {
      background-color: #f9f9f9;
}

.container{
  width: 400px;
  margin-left: auto;
  margin-right: auto;
  background: white;
  align-content: center;
}

</style>
</head>

<body>

<section class="bgimg w3-display-container w3-text-black "> 
  <br><br><br>
  <section class="container">
    <section class="container-header" style="padding:35px 50px;">
      <h4><span class="glyphicon glyphicon-pencil"></span> Registration</h4>
    </section>

    <section class="container-body" style="padding:40px 50px;">
      <form role="form" action="DriverRegisterController" method ="post">
        <section class="form-group">
          <label for="firstName"><span class="glyphicon glyphicon-user"></span> First Name</label>
          <input type="text" class="form-control" name="firstName" required="" placeholder="Enter First Name">
        </section>

        <section class="form-group">
          <label for="lastName"><span class="glyphicon glyphicon-user"></span> Last Name</label>
          <input type="text" class="form-control" name="lastName" required="" placeholder="Enter Last Name">
        </section>

        <section class="form-group">
          <label for="emailID"><span class="glyphicon glyphicon-envelope"></span> Email ID</label>
          <input type="email" class="form-control" name="emailID" required="" placeholder="Enter Email ID">
        </section>

        <section class="form-group">
          <label for="gender"><span class="glyphicon glyphicon-user"></span> Gender</label>
          <br>
          <label class="radio-inline">
            <input type="radio" name="gender" value="Male"> Male
          </label>
          <label class="radio-inline">
            <input type="radio" name="gender" value ="Female"> Female
          </label>
        </section>

        <section class="form-group">
          <label for="dateOfBirth"><span class="glyphicon glyphicon-calendar"></span> Date Of Birth</label>
          <input type="date" class="form-control" name="dateOfBirth"  required="" placeholder="Enter Date of Birth">
        </section>
        
        <section class="form-group">
          <label for="city"><span class="glyphicon glyphicon-map-marker"></span> city</label>
          <input type="text" class="form-control" name="city"  required="" placeholder="Enter city">
        </section>
        
        <section class="form-group">
          <label for="LicenseNumber"><span class="glyphicon glyphicon-calendar"></span> License Number</label>
          <input type="text" class="form-control" name="LicenseNumber"  required="" placeholder="LicenseNumber">
        </section>
         <section class="form-group">
          <label for="carNumber"><span class="glyphicon glyphicon-calendar"></span>Car Number</label>
          <input type="text" class="form-control" name="carNumber" required="" placeholder="Enter Car Number">
        </section>
         <section class="form-group">
          <label for="Car Name"><span class="glyphicon glyphicon-car"></span> Car Name</label>
          <input type="text" class="form-control" name="carName" required="" placeholder="Enter Car Name">
        </section>
         <section class="form-group">
          <label for="Car Type"><span class="glyphicon glyphicon-car"></span>car Type</label>
          <input type="text" class="form-control" name="carType" required="" placeholder="Enter Car Type">
        </section>
        
        

         <section class="form-group">
          <label for="phoneNumber"><span class="glyphicon glyphicon-phone"></span> Phone number</label>
          <input type="tel" class="form-control" name="mobileNumber" maxlength="10" required="" placeholder="Enter Phone Number">
        </section>
        
        
        <section class="form-group">
          <label for="password"><span class="glyphicon glyphicon-eye-open"></span> Password</label>
          <input type="password" class="form-control" name="password" required="" placeholder="Enter Password">
        </section>

        <section class="form-group">
          <label for="reEnterPassword"><span class="glyphicon glyphicon-eye-open"></span> Re-enter Password</label>
          <input type="password" class="form-control" name="reEnterPassword" required="" placeholder="Re-enter Password">
        </section>

        <button type="submit" class="btn btn-basic btn-block"><span class="glyphicon glyphicon-ok"></span> Sign Up</button>

      </form>
    </section>

  <section class="container-footer">
    <p align="center">Already a member? <a href="#">Login</a></p>
  </section>
      
</section> 
</section>



</body>
</html>