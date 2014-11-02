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

<p class="centeredImage"> <img src= "<c:url value="/resources/images/Screen Shot 2014-10-09 at 11.20.48 PM.png" />" alt="image description" height="161" width="471" /> </p>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="<c:url value="/resources/style/style.css" />" rel="stylesheet"  type="text/css" />

<title>Login</title>

</head>
<body>

<h1 align ="center">Hi, Welcome to HouseholdChores Login!</h1>
<br><br><br><br><br><br><br><br>

<div align = "center">

<form action="/HouseholdChores/Home.html" method="post">

<input type="text" class="inputs" name="userId" placeholder="Username"><br>

<input type="password" class="inputs" name="password" placeholder="Password"><br>

<input id="login" type="submit" class="inputs" value="Login" />

<br><br>
<a href="Register">Register</a>

</form> 

</div>
 
</body>
</html>

