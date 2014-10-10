<%@include file="dbConnect.jsp"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="style/style.css">
<title>Create Tasks</title>
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.1/themes/smoothness/jquery-ui.css">
  <script src="//code.jquery.com/jquery-1.10.2.js"></script>
  <script src="//code.jquery.com/ui/1.11.1/jquery-ui.js"></script>
  <link rel="stylesheet" href="/resources/demos/style.css">
  <script>
  $(function() {
    $( '#datepicker1,#datepicker2' ).datepicker();
  });
  </script>
</head>
<body>
<ul id='nav'>
	<li><a href ="home.jsp">Home</a></li>
	<li><a href ="register.jsp">Add People</a></li>
	<li><a href ="GetTaskStartDate.jsp">Allocate Tasks</a></li>
	<li><a href ="login.jsp">Logout</a></li>
</ul>
<form name="createTask" action="InsertTaskSet.jsp" method="post">
		<INPUT type="button" value="Add Row"
			onclick="addRow('createTaskTable')" /> <INPUT type="button"
			value="Delete Row" onclick="deleteRow('createTaskTable')" />

		<TABLE id="createTaskTable" width="350px" border="1">
			<TR>
				<TH>Select</TH>
				<TH>TaskName</TH>
				<TH>PointValue</TH>
				<TH>Recurring</TH>
				<TH>StartDate</TH>
				<TH>EndDate</TH>
			</TR>
			<TR>
				<TD><INPUT type="checkbox" name="chk" /></TD>
				<TD><INPUT type="text" name="taskName"></TD>
				<TD><SELECT name="pointValue">
					<OPTION value = "1">1</OPTION>
					<OPTION value = "2">2</OPTION>
					<OPTION value = "3">3</OPTION>
					<OPTION value = "4">4</OPTION>
					<OPTION value = "5">5</OPTION>
					</SELECT>
				</TD>
				<TD><INPUT type="checkbox" name="recurring" /></TD>
				<TD><input type="text" id="datepicker1" name="startDate"></TD>
				<TD><input type="text" id="datepicker2" name="endDate"></TD>	
			</TR>
		</TABLE>
		<input id="createTaskButton" type="submit" value="Create Tasks" />
	</form>
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
</body>
</html>