<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="com.householdChores.UserTasks"%>
<%@page import="java.util.ArrayList"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
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
</head>
<body>
	<ul id='nav'>
		<li><a href="/HouseholdChores/CreateTask">Create Tasks</a></li>
		<li><a href="/HouseholdChores/AllocateTasks">Allocate Tasks</a></li>
		<li><a href="/HouseholdChores/Login">Logout</a></li>
	</ul>
	<br>
	<h1>${headerMessage}</h1>
	<%
		HttpServletRequest req =  (HttpServletRequest) pageContext.getRequest();
		if(req.getMethod().equals("POST")){
			ArrayList<UserTasks> userTask = (ArrayList<UserTasks>) request.getAttribute("currentTasks");
			
			out.println("<div id='taskTable' align = 'center'>");
			out.println("<h2>You have following tasks due for the next two weeks:</h2>");
			out.println("<table>");
			out.println("<tr><th>Task Name |</th><th>End Date |</th><th>Points</th></tr>");
			
			for (int i = 0; i < userTask.size(); i++) 
			{
				UserTasks task = userTask.get(i);
				out.println("<tr>" + "<td>" + task.getTaskName() + "</td>"
						+ "<td>" + task.getEndDate() + "</td>" + "<td>"
						+ task.getPointValue() + "</td>" + "</tr>");
			}
			out.println("</table>");
			out.println("</div>");
		}
	%>

</body>
</html>
