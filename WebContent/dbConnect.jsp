<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>

<%

String dbms="mysql";
String serverName="localhost";
String portNumber="3306";
String dbUserName="root";
String dbPassword="root";
String databaseName="sample";

String connectionURL = "jdbc:"+ dbms +"://"+ serverName +":"+ portNumber +"/"+databaseName;
Connection connection = null;
Class.forName("com.mysql.jdbc.Driver").newInstance();
connection = DriverManager.getConnection(connectionURL, dbUserName, dbPassword);

if(connection.isClosed()){
	out.println("Unable to connect to database.");
}
%>