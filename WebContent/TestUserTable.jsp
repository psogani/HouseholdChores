<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="dbConnect.jsp"%>
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