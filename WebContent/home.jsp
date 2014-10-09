<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Home Page</title>

<style>
   /* Begin Navigation Bar Styling */
   #nav {
      width: 100%;
      float: left;
      margin: 0 0 3em 0;
      padding: 0;
      list-style: none;
      background-color: #f2f2f2;
      border-bottom: 1px solid #ccc; 
      border-top: 1px solid #ccc; }
   #nav li {
      float: left; }
   #nav li a {
      display: block;
      padding: 8px 15px;
      text-decoration: none;
      font-weight: bold;
      color: #069;
      border-right: 1px solid #ccc; }
   #nav li a:hover {
      color: #c00;
      background-color: #fff; }
   /* End navigation bar styling. */
   
   /* This is just styling for this specific page. */
   body {
      background-color: #d5d5d3; 
      font: small/1.3 Arial, Helvetica, sans-serif; }
   #wrap {
      width: 750px;
      margin: 0 auto;
      background-color: #fff; }
   h1 {
      font-size: 1.5em;
      padding: 1em 8px;
      color: #333;
      background-color: #069;
      margin: 0; }
   #content {
      padding: 0 50px 50px; }
</style>


</head>
<body>
<%
String user = request.getParameter("u");
%>
<ul id='nav'>
	<li><a href ="CreateTasks.jsp">Create Tasks</a></li>
	<li><a href ="register.jsp">Add People</a></li>
	<li><a href ="AllocateTasks.jsp">Allocate Tasks</a></li>

</ul>

<div id='taskTable' align = 'center'>
<table>
<%@include file="dbConnect.jsp" %>
<% 

String query = "SELECT * FROM tasks t,taskAssigned ta, users u where u.userId ='" + user + "' and t.taskId = ta.taskId and u.uid = ta.uid and t.done = false and t.endDate < ADDDATE(CURDATE(), 7)";

Statement st = connection.createStatement(); 
ResultSet rs= st.executeQuery(query);


if(!rs.next())
{
	out.println("<br><br><h3>Congratulations! You have no tasks left.</h3>");
}
else
{
	out.println("<tr><th>Task Name</th><th>Start Date</th><th>End Date</th><th>Recurring</th><th>Points	</th></tr>");
	out.println("<tr>" +
				"<td>" + rs.getString("taskName") + "</td>" +
				"<td>" + rs.getString("startDate") + "</td>" +
				"<td>" + rs.getString("endDate") + "</td>" +
				"<td>" + rs.getString("recurring") + "</td>" +
				"<td>" + rs.getString("pointValue") + "</td>" +
				"</tr>");
	
	while(rs.next())
	{
		
		out.println("<tr>" +
				"<td>" + rs.getString("taskName") + "</td>" +
				"<td>" + rs.getString("startDate") + "</td>" +
				"<td>" + rs.getString("endDate") + "</td>" +
				"<td>" + rs.getString("recurring") + "</td>" +
				"<td>" + rs.getString("pointValue") + "</td>" +
				"</tr>");
	}
}
st.close();
connection.close();




%>

</table>
</div>
</body>
</html>