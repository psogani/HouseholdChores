<%@page import="java.util.Date"%>
<%@include file = "dbConnect.jsp" %>
<%@page import = "java.text.*" %>
<%
int flag = 0;
PreparedStatement pst = null;
String[] taskName = request.getParameterValues("taskName");
String[] pointValue = request.getParameterValues("pointValue");
String[] recurring = new String[taskName.length];
DateFormat df = new SimpleDateFormat("yyyy/MM/dd");

for(int i = 0; i < recurring.length; i++){
	try{
		if(request.getParameterValues("recurring")[i] != null)
			recurring[i] = "True";
	}
	catch(Exception e){
		recurring[i] = "False";
	}
}

for(int row = 0; row < taskName.length; row++){
	 
	 String insertQuery = "INSERT INTO tasks(taskName,pointValue,recurring,startDate,endDate) VALUES(?,?,?,?,?)";
	 pst =(PreparedStatement) connection.prepareStatement(insertQuery); 

	 pst.setString(1,taskName[row]);  
	 pst.setString(2,pointValue[row]);        
	 pst.setString(3,recurring[row]);
	 try{
		 if(request.getParameterValues("startDate")[row] != null){
			 java.util.Date start_date = df.parse(request.getParameterValues("startDate")[row]);
			 pst.setDate(4,new java.sql.Date(start_date.getTime()));
		 }
			 
	 }
	 catch(Exception e){
		 java.util.Date start_date = new Date();
		 pst.setDate(4,new java.sql.Date(start_date.getTime()));
	 }
	 try{
		 if(request.getParameterValues("endDate")[row] != null){
			 java.util.Date end_date = df.parse(request.getParameterValues("endDate")[row]);
			 pst.setDate(5,new java.sql.Date(end_date.getTime()));
		 }
			 
	 }
	 catch(Exception e){
		 java.util.Date end_date = new Date();
		 pst.setDate(5,new java.sql.Date(end_date.getTime()));
	 }


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