<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%@include file="dbConnect.jsp" %>

<% 

String user = request.getParameter("userId");
String password = request.getParameter("password");

//out.println(user);
//out.println(password);


String query = "SELECT * FROM users where user_id ='" + user + "' and password = '" + password + "'";

Statement st = connection.createStatement(); 

ResultSet rs= st.executeQuery(query);

rs.next();
String firstName = rs.getString("fname");
out.println("Hi, " +firstName + "\n");
	


st.close();
connection.close();


%>