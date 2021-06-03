<%@include file="../../models/Category.jsp" %>
<%@page import="java.sql.*, java.util.*" %>

<%
    Category category = new Category();
    Integer cid = request.getParameter("category_id");
    try {
        return category.getCategory(cid);
    } catch (Exception e) {
        e.printStackTrace();
    }
%>
