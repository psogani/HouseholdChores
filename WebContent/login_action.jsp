<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%@include file="dbConnect.jsp"%>

<%
	//get the user id and password
	String user = request.getParameter("userId");
	String password = request.getParameter("password");

	//run the query on user table for credentials
	String query = "SELECT * FROM users where userId ='" + user
			+ "' and password = '" + password + "'";

	Statement st = connection.createStatement();
	ResultSet rs = st.executeQuery(query);

	//check if the entry exists. Redirect to either login or home accordigly
	if (!rs.next()) {
		out.println("<script>window.location.replace(\"login.jsp?e=wip\")</script>");
	} else {
		String uid = rs.getString("uid");
		out.println("<script>window.location.replace(\"home.jsp?u="
				+ uid + "\")</script>");
	}

	st.close();
	connection.close();
%>