<%@page import="java.util.ArrayList"%>
<%@page import="com.householdChores.UserTasks"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

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
		<link href="<c:url value="/resources/style/style.css" />" rel="stylesheet"  type="text/css" media="screen" />
		<title>Mark as Complete</title>
	</head>
	
	<script type="text/javascript">
			var checkForm = function(form){
			    var inputs = form.getElementsByTagName('input');
			    for(var i = 0, l = inputs.length; i < l; i++){
			        var input = inputs[i];
			        if(input.type == "checkbox" && input.checked)
			            return true;
			    }
			    alert('none of the tasks are selected');
			    return false;
			};
	</script>	
	
	<body>
		<div class="container no_margin">
		    <ul class="nav nav-tabs" role="tablist">
		       <li><a href ="/HouseholdChores/Home.html">Home</a></li> 
		       <li><a href ="/HouseholdChores/CreateTasks">Create Tasks</a></li>
		       <li><a href ="/HouseholdChores/AllocateTasks">Allocate Tasks</a></li> 
		       <li class="active"><a href ="#">Current Tasks</a></li> 
		       <li><a href ="/HouseholdChores/Register">Add People</a></li>
		       <li><a href ="/HouseholdChores/Login">Logout</a></li> 		       
			</ul>
		</div>
		
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
		<br><br>
		
		<%
			out.println("<form action = '/HouseholdChores/markComplete' method='post' onsubmit = 'return checkForm(this);' >");
			out.println("<div class='table-responsive'>");
			out.println("<table border='2' style='width=20%' class='table table-striped table-bordered' id='taskCompleteTable' >" );
			out.println("<tr class='border_bottom'>"+
						 	"<th> Select </th>" + 
							"<th> Task Name </th>" + 
						 	"<th> End Date </th>" + 
							"<th>Points</th>" + 
						 "</tr>");
			ArrayList<UserTasks> userTask = (ArrayList<UserTasks>) request.getAttribute("userTasks");
			for (int i = 0; i < userTask.size(); i++) 
			{
				UserTasks task = userTask.get(i);
				out.println("<tr class='border_bottom'>" +
								"<td>" + "<input type='checkbox' name = 'markComplete' value = "+task.getTaskId()+">" + 
								"<td>" + task.getTaskName() + "</td>" +
						 		"<td>" + task.getEndDate()  + "</td>" + 
						 		"<td>" + task.getPointValue() + "</td>" + 
						 	"</tr>");
			}
			out.println("</table>");
			out.println("<input id = 'createTaskButton' type = 'submit'  class = 'btn btn-info' value = 'Set as Complete' />");
			out.println("</div");
			out.println("</form");
		%>
	</body>
</html>