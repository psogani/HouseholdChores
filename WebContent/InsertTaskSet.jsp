<%@include file = "dbConnect.jsp" %>

<%
Integer total = (Integer)session.getAttribute("total_tasks");
 for(int row = 1; row <= total; row++){
	 out.println(request.getParameter("tasknumber"+row));
	 out.println(request.getParameter("priority"+row));
	 out.println(request.getParameter("status"+row));
	 out.println("<BR>");
}

%>
