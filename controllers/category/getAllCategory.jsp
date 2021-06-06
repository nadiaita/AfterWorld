<%@include file="../../models/Category.jsp" %>
<%@page import="java.sql.*, java.util.*" %>

<%
    Category category = new Category();
    try {
        return category.getAllCategory();
    } catch (Exception e) {
        e.printStackTrace();
    }
%>