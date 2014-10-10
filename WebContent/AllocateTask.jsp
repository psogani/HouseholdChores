<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@include file="dbConnect.jsp"%>
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
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="style/style.css">
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
	<form name="assignTask" action="InsertAllocatedTasks.jsp" method="post">
		<INPUT type="button" value="Add Row"
			onclick="addRow('allocateTaskTable')" /> <INPUT type="button"
			value="Delete Row" onclick="deleteRow('allocateTaskTable')" />

		<TABLE id="allocateTaskTable" width="350px" border="1">
			<TR>
				<TH>Select</TH>
				<TH>Person</TH>
				<TH>Task</TH>
			</TR>
			<TR>
				<TD><INPUT type="checkbox" name="chk" /></TD>
				
				<%
				String selectQuery ="SELECT * from users";
				Statement st = connection.createStatement(); 
				ResultSet rs= st.executeQuery(selectQuery);
				out.print("<TD><SELECT name='users'>");
				while(rs.next())
				{
					out.print("<OPTION value="+rs.getString("uid")+">"+rs.getString("fname")+rs.getString("lname")+"</OPTION>");
				}
				out.print("</SELECT></TD>");
				out.print("</TD>");
				String date=request.getParameter("startDate");
				selectQuery = "SELECT * from tasks where startDate > '"+date+"'";
				rs= st.executeQuery(selectQuery);
				out.print("<TD><SELECT name='tasks'>");
				while(rs.next())
				{
					out.print("<OPTION value="+rs.getString("taskId")+">"+rs.getString("taskName")+"</OPTION>");
				}
				out.print("</SELECT></TD>");
				%>
				
			</TR>
		</TABLE>
		<input id="submitButton" type="submit" value="Assign Tasks" />
	</form>
</body>
</html>