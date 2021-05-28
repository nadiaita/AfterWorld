<!-- inser a new product -->
<%@include file="../../models/Place.jsp" %>
<%@page import="java.sql.*, java.util.*" %>

<%
    Place place = new Place();
    Integer pid = request.getParameter("place_id")
    String pname = request.getParameter("place_name");
    Integer pcat = request.getParameter("category_id");
    Integer pprice = request.getParameter("price");
    String ploc = request.getParameter("location");
    String pdesc = request.getParameter("description");
    String prat = request.getParameter("rating");

    //Validation -- NANTI AJA MAGER HEHE 

    //Set value ke place dan insert ke DB
    try{
        place.setName(pname.toLowerCase());
        place.setCategoryId(Integer.parseInt(pcat));
        place.setPrice(Integer.parseInt(pprice));
        place.setDescription(pdesc);
        place.setLocation(ploc);
        place.setRating(prat);
        place.updatePlace(pid);
        response.sendRedirect("/");
    } catch(Exception err=> {
        err.printStackTrace();
    })
%>