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
<title>Home</title>

</head>
<body>
<%
//get the user id passed in the url
String user = request.getParameter("u");
%>
<ul id='nav'>
	<li><a href ="GetTaskDate.jsp">Create Tasks</a></li>
	<li><a href ="register.jsp">Add People</a></li>
	<li><a href ="GetTaskStartDate.jsp">Allocate Tasks</a></li>
	<li><a href ="login.jsp">Logout</a></li>
</ul>


<%@include file="dbConnect.jsp" %>
<% 


//get the lists of current task allocated to the use
String query = "SELECT * FROM tasks t,taskAssigned ta, users u where u.uid ='" + user + "' and t.taskId = ta.taskId and u.uid = ta.uid and t.done = 0";

Statement st = connection.createStatement(); 
ResultSet rs= st.executeQuery(query);



if(!rs.next())
{
	out.println("<br><br><br><h3>Congratulations! You have no tasks due for the next two weeks!.</h3>");
}
else
{
	out.println("<h2>Hi, " + rs.getString("fname") + "!</h2>");
	out.println("<div id='taskTable' align = 'center'>");
	out.println("<h2>You have following tasks due for the next two weeks:</h2>");
	out.println("<table>");
	out.println("<tr><th>Task Name |</th><th>End Date |</th><th>Points</th></tr>");
	out.println("<tr>" +
				"<td>" + rs.getString("taskName") + "</td>" +
				"<td>" + rs.getString("endDate") + "</td>" +
				"<td>" + rs.getString("pointValue") + "</td>" +
				"</tr>");
	
	while(rs.next())
	{
		
		out.println("<tr>" +
				"<td>" + rs.getString("taskName") + "</td>" +
				"<td>" + rs.getString("endDate") + "</td>" +
				"<td>" + rs.getString("pointValue") + "</td>" +
				"</tr>");
	}
}
st.close();
connection.close();

%>

</body>
</html>