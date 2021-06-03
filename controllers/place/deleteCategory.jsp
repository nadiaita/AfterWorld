<%@include file="../../models/Category.jsp" %>
<%@page import="java.sql.*, java.util.*" %>

<%
    Category category = new Category();
    try {
        category.deleteCategory(Integer.parseInt(request.getParameter("category_id")))
    } catch (Exception e) {
        e.printStackTrace();
    }
    response.sendRedirect("/");
%>