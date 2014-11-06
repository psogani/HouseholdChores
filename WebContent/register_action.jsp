<%@include file="dbConnect.jsp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>


<!-- THIS IS AN OBSOLETE JSP FILE FROM ITERATION 1. PELASE LOOK AT THE RECENT FILES IN WEB-INF AND Java Resources/src folders-->

	<style type="text/css">
	  .centeredImage
	    {
	    text-align:center;
	    margin-top:0px;
	    margin-bottom:0px;
	    padding:0px;
	    }
	</style>
	
	<p class="centeredImage"><img src="Screen Shot 2014-10-09 at 11.20.48 PM.png" alt="image description" height="161" width="471"></p>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link rel="stylesheet" type="text/css" href="style/style.css">
</head>

<body>
	<ul id='nav'>
		<li><a href ="home.jsp">Home</a></li>
		<li><a href ="GetTaskDate.jsp">Create Tasks</a></li>
		<li><a href ="register.jsp">Add People</a></li>
		<li><a href ="GetTaskStartDate.jsp">Allocate Tasks</a></li>
		<li><a href ="login.jsp">Logout</a></li>
	</ul>
</body>

<% 
//get all the parameters
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

//insert into the database
String insertQuery = "INSERT INTO users(fname,lname,email,userId,password) VALUES(?,?,?,?,?)";
PreparedStatement pst =(PreparedStatement) connection.prepareStatement(insertQuery); 

pst.setString(1,firstName);  
pst.setString(2,lastName);        
pst.setString(3,email);
pst.setString(4,userId);
pst.setString(5,password);


int pstStatusCode = pst.executeUpdate();



//connection.commit();

//show errors accordingly
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

//release all the open resources
pst.close();
connection.close();


%>
