<%@include file="../../models/Category.jsp" %>
<%@page import="java.sql.*, java.util.*" %>

<%
    Category category = new Category();
    String cname = request.getParameter("category_name");

    //Validation -- NANTI AJA MAGER HEHE 

    //Set value ke place dan insert ke DB
    try{
        category.setName(cname.toLowerCase());
    } catch(Exception err=> {
        err.printStackTrace();
    })
%>