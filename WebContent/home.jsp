<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>


<%@include file="dbConnect.jsp" %>

<% 

String user = request.getParameter("userId");
String password = request.getParameter("password");

//out.println(user);
//out.println(password);


String query = "SELECT userId FROM users WHERE userId = ?";
 
PreparedStatement pst = connection.prepareStatement(query); 

pst.setString(1,user);
//pst.setString(2,password);

ResultSet rs = pst.executeQuery(query);
    
//out.println(pst);
//if(resultSet.getString("count") == "1"){
	
	//String msg="Success";
  	//out.println("<font size='6' color=blue>" + msg + "</font>");
	
	
//}  
//else{
//	String msg="Wrong Id or Password";
 // 	out.println("<font size='6' color=blue>" + msg + "</font>");
//}  
//pst.close();
//connection.close();


%>



</body>
</html>