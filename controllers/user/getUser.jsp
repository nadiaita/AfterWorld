<%@include file="../../models/User.jsp" %>
<%@page import="java.sql.*, java.util.*" %>

<%
    User user = new User();
    Integer uid = request.getParameter("user_id");
    try {
        return place.getPlace(uid);
    } catch (Exception e) {
        e.printStackTrace();
    }
%>