<%@include file = "dbConnect.jsp" %>

<%
Integer total = (Integer)session.getAttribute("total_tasks");
 for(int row = 1; row <= total; row++){
	 String taskNumber = Integer.toString(row);
	 String taskName = request.getParameter("tasknumber"+row);
	 String taskPriority = request.getParameter("priority"+row);
	 String taskStatus = request.getParameter("status"+row);
	 String insertQuery = "INSERT INTO users(Task_Number,Task_Name,Task_Priority,Task_Status) VALUES(?,?,?,?)";
	 PreparedStatement pst =(PreparedStatement) connection.prepareStatement(insertQuery); 

	 pst.setString(1,taskNumber);  
	 pst.setString(2,taskName);        
	 pst.setString(3,taskPriority);
	 pst.setString(4,taskStatus);


	 int pstStatusCode = pst.executeUpdate();

}

%>
