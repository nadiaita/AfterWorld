<!-- inser a new product -->
<%@include file="../../models/Place.jsp" %>
<%@page import="java.sql.*, java.util.*" %>

<%
    Place place = new Place();
    try {
        place.deletePlace(Integer.parseInt(request.getParameter("place_id")))
    } catch (Exception e) {
        e.printStackTrace();
    }
    response.sendRedirect("/");
%>