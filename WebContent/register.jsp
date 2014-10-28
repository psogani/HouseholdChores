<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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

<p class="centeredImage"><img src="Screen Shot 2014-10-09 at 11.20.48 PM.png" alt="image description" height="161" width="471"></p>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="style/style.css">
<title>Register User</title>
</head>
<body>
<ul id='nav'>
	<li><a href ="home.jsp">Home</a></li>
	<li><a href ="CreateTasks.jsp">Create Tasks</a></li>
	<li><a href ="GetTaskStartDate.jsp">Allocate Tasks</a></li>
	<li><a href ="login.jsp">Logout</a></li>
</ul>
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