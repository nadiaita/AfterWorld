<!-- inser a new product -->
<%@include file="../../models/Place.jsp" %>
<%@page import="java.sql.*, java.util.*" %>

<%
    Place place = new Place();
    Integer pid = request.getParameter("place_id");
    try {
        return place.getPlace(pid);
    } catch (Exception e) {
        e.printStackTrace();
    }
%>