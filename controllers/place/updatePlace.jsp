<!-- inser a new product -->
<%@include file="../../models/Place.jsp" %>
<%@page import="java.sql.*, java.util.*" %>

<%
    Place place = new Place();
    Integer pid = Integer.parseInt(request.getParameter("place_id"));
    String pname = request.getParameter("name");
    Integer pcat = Integer.parseInt(request.getParameter("category_id"));
    Integer pprice = Integer.parseInt(request.getParameter("price"));
    String ploc = request.getParameter("location");
    String pdesc = request.getParameter("description");
    Integer prat = Integer.parseInt(request.getParameter("rating"));

    //Validation -- NANTI AJA MAGER HEHE 

    //Set value ke place dan insert ke DB
    try{
        System.out.println("Isi dati Product");
        System.out.println(pname);
        place.setName(pname.toLowerCase());
        place.setCategoryId(1);
        place.setPrice(pprice);
        place.setDescription(pdesc);
        place.setLocation(ploc);
        place.setRating(prat);


        place.updatePlace(pid);
        response.sendRedirect("../../views/managePlace.jsp");
    } catch(Exception err) {
        System.out.println(place);
        err.printStackTrace();
        System.out.println(err);
    }
%>