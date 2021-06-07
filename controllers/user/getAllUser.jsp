<%@include file="../../models/User.jsp" %>
<%@page import="java.sql.*, java.util.*" %>

<%
    User user = new User();
    try {
        return place.getAllUser();
    } catch (Exception e) {
        e.printStackTrace();
    }
%>