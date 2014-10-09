<%@page import="com.mysql.jdbc.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@include file="dbConnect.jsp"%>
<%
String[] taskName = request.getParameterValues("tasks");
String[] users=request.getParameterValues("users");
Boolean flag=false;
PreparedStatement pst=null;
for(int i=0;i<taskName.length;i++)
{
	out.print("User"+users[i]+"has been assigned task"+taskName[i]);
	String insertQuery = "INSERT INTO allocatedtasks(user_name,task_number) VALUES(?,?)";
	pst =(PreparedStatement) connection.prepareStatement(insertQuery); 

	pst.setString(1,users[i]);
	pst.setString(2,taskName[i]);


	int pstStatusCode = pst.executeUpdate();
	if(pstStatusCode != 0)
	{
		 flag = true;
	}
	else
	{
		
		 String msg="Insertion error!!";
		 out.println("<font size='6' color=blue>" + msg + "</font>");
	}

}
pst.close();
connection.close();

%>