<%@include file = "dbConnect.jsp" %>

<%
int flag = 0;
PreparedStatement pst = null;
Integer total = (Integer)session.getAttribute("total_tasks");
 for(int row = 1; row <= total; row++){
	 String taskNumber = Integer.toString(row);
	 String taskName = request.getParameter("tasknumber"+row);
	 String taskPriority = request.getParameter("priority"+row);
	 String taskStatus = request.getParameter("status"+row);
	 String insertQuery = "INSERT INTO tasks(Task_Number,Task_Name,Task_Priority,Task_Status) VALUES(?,?,?,?)";
	 pst =(PreparedStatement) connection.prepareStatement(insertQuery); 

	 pst.setString(1,taskNumber);  
	 pst.setString(2,taskName);        
	 pst.setString(3,taskPriority);
	 pst.setString(4,taskStatus);


	 int pstStatusCode = pst.executeUpdate();
	 if(pstStatusCode != 0){
		 flag = 1;
	 }
	 else{
		 String msg="Insertion error!!";
		 out.println("<font size='6' color=blue>" + msg + "</font>");
		 pst.close();
		 connection.close();
		 break;		 
	 }

}
 
if(flag == 1){
	String msg="All Records successfully inserted";
  	out.println("<font size='6' color=blue>" + msg + "</font>");
  	out.print("<BR>");
  	pst.close();
	connection.close();
}
%>
<FORM NAME="view_tasks" ACTION = "ViewTasks.jsp" METHOD="POST">            
            <INPUT TYPE="SUBMIT" VALUE="View Task Table">
</FORM>