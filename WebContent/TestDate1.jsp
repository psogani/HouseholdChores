<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>


<!-- THIS IS AN OBSOLETE JSP FILE FROM ITERATION 1. PELASE LOOK AT THE RECENT FILES IN WEB-INF AND Java Resources/src folders-->


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
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Test Date 1</title>
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
<form name="testDate1" action="TestDate2.jsp" method="post" target="my_frame">
<input type="text" id="datepicker1" name="startDate">
<input id="createTaskButton" type="submit" value="Create Tasks" />
</form>
<iframe name="my_frame" width="1000" height="1000">
  </iframe>
</body>
</html>