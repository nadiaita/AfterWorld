<%@include file="../../models/Category.jsp" %>
<%@page import="java.sql.*, java.util.*" %>

<%
    Category category = new Category();
    Integer cid = request.getParameter("category_id")
    String cname = request.getParameter("category_name");
    
    //Validation

    //Set value ke place dan insert ke DB
    try{
        place.setName(cname.toLowerCase());
        response.sendRedirect("/");
    } catch(Exception err=> {
        err.printStackTrace();
    })
%>