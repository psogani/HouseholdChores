<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="com.householdChores.UserTasks"%>
<%@page import="com.householdChores.User"%>
<%@page import="java.util.ArrayList"%>

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
		
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		
		<p class="centeredImage"> <img src= "<c:url value="/resources/images/Screen Shot 2014-10-09 at 11.20.48 PM.png" />" alt="image description" height="161" width="471" /> </p>
		
		<link href="<c:url value="/resources/style/bootstrap.min.css" />" rel="stylesheet"  type="text/css" media="screen" />
		<link href="<c:url value="/resources/style/style.css" />" rel="stylesheet"  type="text/css" media="screen" />
		
		<SCRIPT language="javascript">
			function addRow(tableID) {
		
				var table = document.getElementById(tableID);
		
				var noOfRows = table.rows.length;
				var row = table.insertRow(noOfRows);
		
				var noOfCols = table.rows[0].cells.length;
		
				for ( var i = 0; i < noOfCols; i++) {
		
					var newcell = row.insertCell(i);
		
					newcell.innerHTML = table.rows[1].cells[i].innerHTML;
		
					switch (newcell.childNodes[0].type) {
					case "checkbox":
						newcell.childNodes[0].checked = false;
						break;
					case "select-one":
						newcell.childNodes[0].selectedIndex = 0;
						break;
					}
				}
			}
		
			function deleteRow(tableID) {
				try {
					var table = document.getElementById(tableID);
					var noOfRows = table.rows.length;
					//alert("noOfRows"+noOfRows);
		
					for ( var i = 0; i < noOfRows; i++) {
						var row = table.rows[i];
						var chkbox = row.cells[0].childNodes[0];
						if (null != chkbox && true == chkbox.checked)
						{
							if (noOfRows <= 2) {
								alert("Cannot delete all the rows.");
								break;
							}
							table.deleteRow(i);
							noOfRows--;
							i--;
						}
		
					}
				} catch (e) {
					alert(e);
				}
			}
		</SCRIPT>
		<title>Allocate Task</title>
	</head>
	
	<body>
		<div class="container no_margin">
			<ul class="nav nav-tabs" role="tablist">
			       <li><a href ="/HouseholdChores/Home.html">Home</a></li> 
			       <li><a href ="/HouseholdChores/CreateTasks">Create Tasks</a></li>
			       <li class="active"><a href ="#">Allocate Tasks</a></li> 
			       <li><a href ="/HouseholdChores/TaskComplete">Current Tasks</a></li>
			       <li><a href ="/HouseholdChores/Register">Add People</a></li>
			       <li><a href ="/HouseholdChores/Login">Logout</a></li> 
			</ul>
		</div>
	
		<form name="assignTask" action="/HouseholdChores/Home" method="post">
			<br>
			<INPUT type="button"  class="btn btn-info" value="Add Row" onclick="addRow('allocateTaskTable')" /> 
			<INPUT type="button" class="btn btn-info" value="Delete Row" onclick="deleteRow('allocateTaskTable')" />
			<br><br>
			<div class="table-responsive">
				<TABLE id="allocateTaskTable" class="table table-striped table-bordered" border="2">
					<TR>
						<TH>Select</TH>
						<TH>Person</TH>
						<TH>Task</TH>
					</TR>
					<TR>
						<TD><INPUT type="checkbox" name="chk" /></TD>
						
						<%
						ArrayList<User> userList = (ArrayList<User>) request.getAttribute("userList");
						ArrayList<UserTasks> userTask = (ArrayList<UserTasks>) request.getAttribute("taskList");
						
						out.print("<TD><SELECT name='users'>");
						for (int i = 0; i < userList.size(); i++) 
						{
							User user = userList.get(i);
							out.print("<OPTION value="+user.getUid()+">"+ (user.getfName() + "" + user.getlName()) +"</OPTION>");
						}
						
						out.print("</SELECT></TD>");
						out.print("</TD>");
						
						out.print("<TD><SELECT name='tasks'>");
						for (int i = 0; i < userTask.size(); i++) 
						{
							UserTasks task = userTask.get(i);
							out.print("<OPTION value="+task.getTaskId() +">" + task.getTaskName() +"</OPTION>");
						}
						out.print("</SELECT></TD>");
						%>
						
					</TR>
				</TABLE>
			</div>
			<br>
			<input id="submitButton" type="submit" value="Assign Tasks" class="btn btn-info" />
		</form>
	</body>
</html>