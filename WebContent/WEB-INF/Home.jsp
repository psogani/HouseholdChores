
<%@page import="com.householdChores.UserTasks"%>
<%@page import="java.util.ArrayList"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true"%>

<html>
	<head>
		<style type="text/css">
		.centeredImage {
			text-align: center;
			margin-top: 0px;
			margin-bottom: 0px;
			padding: 0px;
		}
		</style>
		
		<style type="text/css">
		    .bs-example{
		        margin: 20px;
		    }
		</style>
		
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		
		<p class="centeredImage"> <img src= "<c:url value="/resources/images/Screen Shot 2014-10-09 at 11.20.48 PM.png" />" alt="image description" height="161" width="471" /> </p>
		
		<link href="<c:url value="/resources/style/bootstrap.min.css" />" rel="stylesheet"  type="text/css" media="screen" />
		<link href="<c:url value="/resources/style/style.css" />" rel="stylesheet"  type="text/css" media="screen" />
	</head>
	
	<body>
		<div class="container no_margin">
		    <ul class="nav nav-tabs" role="tablist">
		       <li class="active"><a href ="#">Home</a></li> 
		       <li><a href ="/HouseholdChores/CreateTask">Create Tasks</a></li>
		       <li><a href ="/HouseholdChores/TaskComplete">Current Tasks</a></li> 
		       <li><a href ="/HouseholdChores/Register">Add People</a></li> 
		       <li><a href ="/HouseholdChores/Login">Logout</a></li> 		       
			</ul>
		</div>
		<br>
		<h2>Hello ${username},</h2>
		<br>
		<h3>${msg}</h3>
		<%
				ArrayList<UserTasks> userTask = (ArrayList<UserTasks>) request.getAttribute("currentTasks");
				out.println("<div id='taskTable' align = 'center'>");
				out.println("<h2>You have following tasks due for the next two weeks:</h2>");
				out.println("<table table border='2' style='width=100px' class='table table-striped table-condensed'>");
				out.println("<tr class='border_bottom'>" 
								+ "<th>Task Name</th>" 
								+ "<th>End Date</th>"  
								+ "<th>Points</th>" 
						  + "</tr>");
				
				for (int i = 0; i < userTask.size(); i++) 
				{
					UserTasks task = userTask.get(i);
					out.println("<tr class='border_bottom'>"  
								+ "<td>" + task.getTaskName() + "</td>"
								+ "<td>" + task.getEndDate() + "</td>"  
								+ "<td>" + task.getPointValue() + "</td>" 
								+ "</tr>");
				}
				out.println("</table>");
				out.println("</div>");			
		%>
		<h2>Minimum points to be completed: ${currentPoints}</h2>
	</body>
</html>
