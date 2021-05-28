<!-- inser a new product -->
<%@include file="../../models/Place.jsp" %>
<%@page import="java.sql.*, java.util.*" %>

<%
    Place place = new Place();
    try {
        return place.getAllPlaces();
    } catch (Exception e) {
        e.printStackTrace();
    }
%>