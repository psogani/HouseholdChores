<%@include file = "dbConnect.jsp" %>
<%
int flag = 0;
PreparedStatement pst = null;
String[] taskName = request.getParameterValues("taskName");
String[] pointValue = request.getParameterValues("pointValue");
String[] recurring = new String[taskName.length];
String[] startDate = request.getParameterValues("startDate");
String[] endDate = request.getParameterValues("endDate");

for(int i = 0; i < recurring.length; i++){
	try{
		if(request.getParameterValues("recurring")[i] != null)
			recurring[i] = "1"; 
	}
	catch(Exception e){
		recurring[i] = "0";
	}
}
for(int row = 1; row <= taskName.length; row++){
	 
	 String insertQuery = "INSERT INTO tasks(taskName,pointValue,recurring,startDate,endDate) VALUES(?,?,?,?,?)";
	 pst =(PreparedStatement) connection.prepareStatement(insertQuery); 

	 pst.setString(1,taskName[row]);  
	 pst.setString(2,pointValue[row]);        
	 pst.setString(3,recurring[row]);
	 pst.setString(4,startDate[row]);
	 pst.setString(5,endDate[row]);


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