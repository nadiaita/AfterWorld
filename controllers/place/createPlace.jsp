<!-- inser a new place -->
<%@include file="../../models/Place.jsp" %>
<%@page import="java.sql.*, java.util.*" %>

<%
    Place place = new Place();
    String pname = request.getParameter("name");
    Integer pcat = Integer.parseInt(request.getParameter("category_id"));
    Integer pprice = Integer.parseInt(request.getParameter("price"));
    String ploc = request.getParameter("location");
    String pdesc = request.getParameter("description");
    Integer prat = Integer.parseInt(request.getParameter("rating"));

    //Validation -- NANTI AJA MAGER HEHE 

    //Set value ke place dan insert ke DB
    try{
        place.setName(pname.toLowerCase());
        place.setCategoryId(1);
        place.setPrice(pprice);
        place.setDescription(pdesc);
        place.setLocation(ploc);
        place.setRating(prat);
        place.insertPlace();
        response.sendRedirect("../../views/managePlace.jsp");
    } catch(Exception err)  {
        err.printStackTrace();
    }
%>