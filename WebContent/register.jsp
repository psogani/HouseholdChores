<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="style/style.css">
<title>Register User</title>
</head>
<body>
<h1 align ="center">Hi, Welcome to HouseholdChores User Registration!</h1>
<form name="registerInput" action="register_action.jsp" method="post">
<div align="center"><br><br><br><br><br><br>
<input type="text" class="inputs" name="firstName" placeholder="First Name"><br>
<input type="text" class="inputs" name="lastName" placeholder="Last Name"><br>
<input type="text" class="inputs" name="email" placeholder="Email"><br>
<input type="text" class="inputs" name="userId" placeholder="User Id"><br>
<input type="password" class="inputs" name="password" placeholder="Password"><br>
<input type="password" class="inputs" name="reEnteredPassowrd" placeholder="Re-enter Password"><br>
<input id="submitButton" type="submit" class="inputs" value="Register" />
</div></form> 

</body>
</html>