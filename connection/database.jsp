<%@ page import="java.sql.*" %>

<%
	Class.forName("com.mysql.jdbc.Driver");

	Connection con = DriverManager.getConnection("jbdc:mysql://localhost/afterworld","root","");
%>