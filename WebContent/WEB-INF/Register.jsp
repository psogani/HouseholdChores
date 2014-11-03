<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
	<head>
		<style type="text/css">
		 .centeredImage
		   {
		   text-align:center;
		   margin-top:0px;
		   margin-bottom:0px;
		   padding:0px;
		   }
		</style>
		 
		<style type="text/css">
		   .bs-example{
		       margin: 20px;
		   }
		</style>
		 
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		
		 
		<p class="centeredImage"> <img src= "<c:url value="/resources/images/Screen Shot 2014-10-09 at 11.20.48 PM.png" />" alt="image description" height="161" width="471" /> </p>
		
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		
		<link href="<c:url value="/resources/style/bootstrap.min.css" />" rel="stylesheet"  type="text/css" media="screen" />
		
		<title>Register User</title>
	</head>
	 
	<body>
		<div class="container">
			<ul class="nav nav-tabs" role="tablist">
			<li class="active"><a href ="#">Registration</a></li>
			   <li><a href ="/HouseholdChores/Login">Back to Login</a></li>
			</ul>
		</div>
		
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
		<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
		 
		<div align="center">
			<br><br>
			
			<h2>${msg}</h2>
			
			<br><br><br><br>
			
			<form name="registerInput" action="/HouseholdChores/RegisterSubmit" method="post">
				<div class="form-group">
				   <input type="text" class="form-group" name="firstname" placeholder="First Name"><br>
				 
				   <input type="text" class="form-group" name="lastname" placeholder="Last Name"><br>
				 
				   <input type="email" class="form-group" name="email" placeholder="Email"><br>
				 
				   <input type="text" class="form-group" name="userid" placeholder="User Id"><br>
				 
				   <input type="password" class="form-group" name="password" placeholder="Password"><br>
				 
				   <input type="password" class="inputs" name="reenterpassword" placeholder="Re-Enter Password"><br>
				</div>
				 
				<div class="register-button">
				   <button type="submit" class="btn btn-info">Register</button>
				</div>
			
			</form> 
		</div>
	</body>
</html>