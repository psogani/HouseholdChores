<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%String date=(String)request.getAttribute("selectedDate");%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link href="<c:url value="/resources/style/bootstrap.min.css" />" rel="stylesheet"  type="text/css" media="screen" />
		<link href="<c:url value="/resources/style/style.css" />" rel="stylesheet"  type="text/css" media="screen" />
		<title>Create task</title>
	</head>
	
	<body>
		<form action="/HouseholdChores/processTaskInput" method="post">
		<h2>${msg}</h2>
		<br>
		<input type='hidden' name='startDate' value="${selectedDate}"/> 
			<INPUT type="button" value="Add Row" class="btn btn-info" onclick="addRow('createTaskTable')" />
			<INPUT type="button" value="Delete Row" class="btn btn-info" onclick="deleteRow('createTaskTable')" />
			<br><br>
			<div class="table-responsive">
				<TABLE class="table table-bordered" id="createTaskTable" width="350px" border="2">
					<TR class="border_bottom">
						<TH>Select</TH>
						<TH>TaskName</TH>
						<TH>PointValue</TH>
						<TH>Recurring</TH>
					</TR>
					<TR class='border_bottom'>
						<TD><INPUT type="checkbox" name="chk" /></TD>
						<TD><INPUT type="text" name="taskName"></TD>
						<TD><SELECT name="pointValue">
								<OPTION value="1">1</OPTION>
								<OPTION value="2">2</OPTION>
								<OPTION value="3">3</OPTION>
								<OPTION value="4">4</OPTION>
								<OPTION value="5">5</OPTION>
						</SELECT></TD>
						<TD><INPUT type="checkbox" name="recurring" value="1"/></TD>
					</TR>
				</TABLE>
			</div>
			<input id="createTaskButton" type="submit" class="btn btn-info" value="Create Tasks" />
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
						newcell.childNodes[0].value = noOfRows;
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