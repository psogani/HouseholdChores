<%@page import="java.util.ArrayList"%>
<%@page import="com.householdChores.UserTasks"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Insert title here</title>
	</head>
	<script type="text/javascript">
			var checkForm = function(form){
			    var inputs = form.getElementsByTagName('input');
			    for(var i = 0, l = inputs.length; i < l; i++){
			        var input = inputs[i];
			        if(input.type == "checkbox" && input.checked)
			            return true;
			    }
			    alert('none are checked');
			    return false;
			};
	</script>	
	<body>
		<%
			out.println("<form action = '/HouseholdChores/markComplete' method='post' onsubmit = 'return checkForm(this);' >");
			out.println("<table border='1' style='width:100%' >" );
			out.println("<tr>"+
						 	"<th> Select </th>" + 
							"<th> Task Name </th>" + 
						 	"<th> End Date </th>" + 
							"<th>Points</th>" + 
						 "</tr>");
			ArrayList<UserTasks> userTask = (ArrayList<UserTasks>) request.getAttribute("userTasks");
			for (int i = 0; i < userTask.size(); i++) 
			{
				UserTasks task = userTask.get(i);
				out.println("<tr>" +
								"<td align = 'center'>" + "<input type='checkbox' name = 'markComplete'"+i+" id = "+task.getTaskId()+">" + 
								"<td align = 'center'>" + task.getTaskName() + "</td>" +
						 		"<td align = 'center'>" + task.getEndDate()  + "</td>" + 
						 		"<td align = 'center'>" + task.getPointValue() + "</td>" + 
						 	"</tr>");
			}
			out.println("</table>");
			out.println("<input id = 'Complete' type = 'submit' class = 'inputs' value = 'Set as Complete' />");
			//for(int i = 0; i < userTask.size())
			boolean myCheckBox = request.getParameter( "" ) != null;
			out.println("</form");
		%>
	</body>
</html>