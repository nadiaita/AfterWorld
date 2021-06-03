<%@ page import="java.sql.*" %>

<%
	Class.forName("com.mysql.jdbc.Driver");

	Connection con = DriverManager.getConnection("jbdc:mysql://localhost/afterworld","root","");
 
	//Statement st = con.createStatement(1004,1008);
%>