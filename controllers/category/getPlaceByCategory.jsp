<!-- inser a new product -->
<%@include file="../../models/Place.jsp" %>
<%@page import="java.sql.*, java.util.*" %>

<%
    Place place = new Place();
    Integer pid = request.getParameter("place_id");
    Integer cid = request.getParameter("category_id");
    try {
        return place.getPlaceByCategory(pid, cid);
    } catch (Exception e) {
        e.printStackTrace();
    }
%>