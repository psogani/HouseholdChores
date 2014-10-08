<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>
<%
int total_tasks = Integer.parseInt(request.getParameter("totalTasks"));
session.setAttribute("total_tasks",total_tasks);
%>

<HTML>
<form action = "InsertTaskSet.jsp" method = "post">
<table>
<% for(int row=1; row <= total_tasks; row++) { %>
    <tr><td>Task Number <%=row%>: </td><td><input type="text" name="tasknumber<%=row%>"></td> 
    <td> Priority</td><td><input type="text" name= "priority<%=row%>" style="width: 50px;"></td> 
    <td> Status</td><td><select name = "status<%=row%>"><option value = "Pending">Pending</option><option value = "Done">Done
    </option></select></td></tr>
<% } %>
<tr><td><input id="SubmitTaskSet" type="submit" value="Create Task Set" /></td></tr>
</table>
</form>
</HTML>