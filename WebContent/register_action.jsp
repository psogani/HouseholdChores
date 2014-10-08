<%@include file="dbConnect.jsp" %>

<% 

String firstName = request.getParameter("firstName");
String lastName = request.getParameter("lastName");
String email = request.getParameter("email");
String userId = request.getParameter("userId");
String password = request.getParameter("password");

//out.println(firstName);
//out.println(lastName);
//out.println(email);
//out.println(userId);
//out.println(password);


PreparedStatement pst =(PreparedStatement) connection.prepareStatement("INSERT INTO `users`(`fname`, `lname`, `email`, `userId`, `password`) VALUES (?,?,?,?,?)"); 

pst.setString(1,firstName);  
pst.setString(2,lastName);        
pst.setString(3,email);
pst.setString(4,userId);
pst.setString(5,password);


int pstStatusCode = pst.executeUpdate();



connection.commit();

if(pstStatusCode!=0){
	
	// /*
	
   	String site = new String("home.jsp");
   	response.setHeader("Location", site); 
 	
 	
 	// */

  	//String msg="Record has been inserted";
  	//out.println("<font size='6' color=blue>" + msg + "</font>");  

}  
else{
	//Redirect to registration page with message "Invalid fields"
  	String msg="failed to insert the data";
  	out.println("<font size='6' color=blue>" + msg + "</font>");
}  
pst.close();
connection.close();


%>
