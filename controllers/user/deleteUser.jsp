<%@include file="../../models/User.jsp" %>
<%@page import="java.sql.*, java.util.*" %>

<%
    User user = new User();
    try {
        user.deleteUser(Integer.parseInt(request.getParameter("user_id")))
    } catch (Exception e) {
        e.printStackTrace();
    }
    response.sendRedirect("/");
%>