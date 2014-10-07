<%@include file="dbConnect.jsp" %>

<%
int total_tasks = Integer.parseInt(request.getParameter("totalTasks"));
%>

<HTML>
<form action="InsertTaskSet.jsp" method="post">
<table>
<% for(int row=1; row <= total_tasks; row++) { %>
    <tr><td>Task Number <%=row%>: </td><td><input type="text"></td></tr>
<% } %>
<tr><td><input id="SubmitTaskSet" type="submit" value="Create Task Set" /></td></tr>
</table>
</form>
</HTML>