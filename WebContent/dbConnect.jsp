<%@ page import="java.sql.*"%>
<%@ page import="java.io.*" %>

<!-- THIS IS AN OBSOLETE JSP FILE FROM ITERATION 1. PELASE LOOK AT THE RECENT FILES IN WEB-INF AND Java Resources/src folders-->

<%

String dbms="mysql";
String serverName="localhost";
String portNumber="3306";
String dbUserName="root";
String dbPassword="password";
String databaseName="householdchores";

String connectionURL = "jdbc:"+ dbms +"://"+ serverName +":"+ portNumber +"/"+databaseName;
Connection connection = null;
Class.forName("com.mysql.jdbc.Driver").newInstance();
connection = DriverManager.getConnection(connectionURL, dbUserName, dbPassword);

if(connection.isClosed()){
	out.println("Unable to connect to database.");
}
%>