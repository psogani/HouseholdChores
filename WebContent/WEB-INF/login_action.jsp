
<!DOCTYPE unspecified PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="java.util.ArrayList"%>
<HTML>
	<body>
		<h1>${username}</h1>
	</body>
</HTML>
<%
	ArrayList<String> username=(ArrayList<String>)request.getAttribute("username"); 
   	out.println("name is  "+username); 
   	for(String s: username){
   		out.println(s);
   	}
 %>