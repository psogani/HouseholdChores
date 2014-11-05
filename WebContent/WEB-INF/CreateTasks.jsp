<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<style type="text/css">
			.centeredImage{
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
		<link rel="stylesheet" href="//code.jquery.com/ui/1.11.1/themes/smoothness/jquery-ui.css">
		
		<script src="//code.jquery.com/jquery-1.10.2.js"></script>
		<script src="//code.jquery.com/ui/1.11.1/jquery-ui.js"></script>
		
		<script>
		  $(function() {
		    $('#datepicker1').datepicker({dateFormat: 'yy-mm-dd'});
		  });
		  </script>
	</head>
	
	<body>
		<div class="container no_margin">
			<ul class="nav nav-tabs" role="tablist">
				<li><a href ="/HouseholdChores/Home.html">Home</a></li>
				<li class="active"><a href ="#">Create Tasks</a></li>
				<li><a href ="/HouseholdChores/AllocateTasks">Allocate Tasks</a></li>
				<li><a href ="/HouseholdChores/TaskComplete">Current Tasks</a></li>
				<li><a href ="/HouseholdChores/Register">Add People</a></li>
				<li><a href ="/HouseholdChores/Login">Logout</a></li>
			</ul>
		</div>
		<br><br>
		
		<div class="form-group">
			<form action="/HouseholdChores/CreateTaskForDate" method="post" target="allocateTaskFrame">
				<p><b>Please select a date for the week of which you want to create tasks</b></p>
				<label for="calendar">Date</label>
				<input type="text" id="datepicker1" name="startDate" class="form-group" placeholder="Date">
   				<input id="createTaskButton" type="submit" class="btn btn-info" value="Create Tasks" />
			</form>
		</div>
		<iframe name="allocateTaskFrame" height=800 width=800 frameborder="0"></iframe>	
	</body>
</html>