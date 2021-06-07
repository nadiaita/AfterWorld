<%@ page import="java.sql.*" %>
<%

    Class.forName("com.mysql.jdbc.Driver");

    Connection connection = DriverManager.getConnection("jbdc:mysql://localhost/webprog_ses4","root","");

%>