<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="dbConnect.jsp"%>


<!-- THIS IS AN OBSOLETE JSP FILE FROM ITERATION 1. PELASE LOOK AT THE RECENT FILES IN WEB-INF AND Java Resources/src folders-->


<%
	String selectQuery = "SELECT * from users";
	int i = 0;
	Statement st = connection.createStatement();
	ResultSet rs = st.executeQuery(selectQuery);
	while (rs.next()) 
	{
		out.print("i " + i);
		out.print(rs.getString("fname")+rs.getString("lname"));
	}
%>