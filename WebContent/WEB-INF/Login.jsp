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
 
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
 
<p class="centeredImage"> <img src= "<c:url value="/resources/images/Screen Shot 2014-10-09 at 11.20.48 PM.png" />" alt="image description" height="161" width="471" /> </p>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!--<link href="<c:url value="/resources/style/style.css" />" rel="stylesheet"  type="text/css" /> -->
<link href="<c:url value="/resources/style/bootstrap.min.css" />" rel="stylesheet"  type="text/css" media="screen" />
<title>Login</title>
 
</head>
<body>
 
<!--  <h1 align ="center">Hi, Welcome to HouseholdChores Login!</h1>-->
<div class="container" align = "center">
  <h1 class="text-muted">Hi, Welcome to HouseholdChores Login!</h1>
  <hr>
</div>
<br><br><br>
 
<!--  <div align = "center"> -->
 
<form action="/HouseholdChores/Home.html" method="post">
 
<div class="form-group">
   <label for="emailField">Username</label>
<input type="text" class="form-control" name="emailField" placeholder="Enter username" style="width:30%;"><br>
</div>
 
<div class="form-group">
<label for="passwordField">Password</label>
<input type="password" class="form-control" name="passwordField" placeholder="Enter Password" style="width:30%;"
><br>
</div>
 
<div class="checkbox">
   <label>
       <input type="checkbox" /> Remember Me
   </label>
</div>
 
<div class="login-button">
<button type="submit" class="btn btn-info">Login</button>
 
<!--  <a href="/HouseholdChores/Register" -->
<a href = "/HouseholdChores/Register" class="btn btn-info" role = "button" >Register </a>
<!-- <button type="submit" class="btn btn-info" >Register</button> -->
</div>
</form> 
 
<!-- </div> -->
 
</body>
</html>