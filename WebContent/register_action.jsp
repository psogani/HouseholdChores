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

String insertQuery = "INSERT INTO users(fname,lname,email,userId,password) VALUES(?,?,?,?,?)";
PreparedStatement pst =(PreparedStatement) connection.prepareStatement(insertQuery); 

pst.setString(1,firstName);  
pst.setString(2,lastName);        
pst.setString(3,email);
pst.setString(4,userId);
pst.setString(5,password);


int pstStatusCode = pst.executeUpdate();



//connection.commit();

if(pstStatusCode!=0)
{
	String msg="User registered successfully!!.";
  	out.println("<font size='6' color=blue>" + msg + "</font>");
	
	//Redirect to homepage
   	String site = new String("http://localhost:8080/HouseholdChores/home.jsp");
   	//response.setStatus(response.SC_MOVED_TEMPORARILY);
   	response.setHeader("Location", site); 
 	//Redirect to homepage
 	
  	//out.println("window.location.replace("home.jsp");");  

}  
else{
	//Redirect to registration page with message "Invalid fields"
  	String msg="failed to insert the data.";
  	out.println("<font size='6' color=blue>" + msg + "</font>");
}  
pst.close();
connection.close();


%>
