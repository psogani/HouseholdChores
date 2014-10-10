<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%@include file="dbConnect.jsp" %>

<% 

String user = request.getParameter("userId");
String password = request.getParameter("password");

//out.println(user);
//out.println(password);


		String query = "SELECT * FROM users where userId ='" + user + "' and password = '" + password + "'";
		
		Statement st = connection.createStatement(); 
		ResultSet rs= st.executeQuery(query);
		
		
		
		if(!rs.next())
		{
			out.println("<script>window.location.replace(\"login.jsp?e=wip\")</script>");
		}
		else
		{
			out.println("<script>window.location.replace(\"home.jsp?u=" + user + "\")</script>");
		}
			
		st.close();
		connection.close();
		

%>