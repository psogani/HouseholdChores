<%@include file="dbConnect.jsp"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<% 
String date=request.getParameter("startDate");

String selectQuery = "SELECT * from tasks where startDate > '"+date+"'";

out.print(selectQuery);
Statement st = connection.createStatement(); 
ResultSet rs= st.executeQuery(selectQuery);
while(rs.next())
{
	out.print(rs.getString("taskId")+rs.getString("taskName"));
}
%>