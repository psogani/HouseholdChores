<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="style/style.css">
<title>Insert a new task</title>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.11.1/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.11.1/jquery-ui.js"></script>
<link rel="stylesheet" href="/resources/demos/style.css">

<script>
  $(function() {
    $('#datepicker1').datepicker({dateFormat: 'yy-mm-dd'});
  });
  </script>
</head>
<body>
<form name="testDate1" action="CreateTasks.jsp" method="post" target="allocateTaskFrame">
<input type="text" id="datepicker1" name="startDate">
<input id="createTaskButton" type="submit" value="Create Tasks" />
</form>
<iframe name="allocateTaskFrame" height=800 width=800>
  </iframe>
</body>
</html>