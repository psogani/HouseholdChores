<%@include file = "dbConnect.jsp" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="style/style.css">
<title>Create task</title>
</head>
<body>
	<ul id='nav'>
	<li><a href ="home.jsp">Home</a></li>
	<li><a href ="register.jsp">Add People</a></li>
	<li><a href ="CreateTasks.jsp">Create Tasks</a></li>
	<li><a href ="GetTaskStartDate.jsp">Allocate Tasks</a></li>
	<li><a href ="login.jsp">Logout</a></li>
</ul>
<%
String selectQuery = "SELECT * from tasks";
PreparedStatement pst = connection.prepareStatement(selectQuery); 
ResultSet rs = pst.executeQuery(selectQuery);
%>
<TABLE BORDER="1">
            <TR>
                <TH>Task Number</TH>
                <TH>Task Name</TH>
                <TH>Task Priority</TH>
                <TH>Task Status</TH>
            </TR>
            <% while(rs.next()){ %>
            <TR>
                <TD> <%= rs.getString(1) %></td>
                <TD> <%= rs.getString(2) %></TD>
                <TD> <%= rs.getString(3) %></TD>
                <TD> <%= rs.getString(4) %></TD>
            </TR>
            <% } %>
        </TABLE>