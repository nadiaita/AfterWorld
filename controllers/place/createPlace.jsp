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

    //Validation

    //Set value ke place dan insert ke DB
    try{
        if(pname.isEmpty() || ploc.isEmpty() || pdesc.isEmpty()){
            response.sendRedirect("../../views/managePlace.jsp?status=danger&message=All Field must be Filled");
            return;
        } else if(pprice < 0 || prat < 0){
            response.sendRedirect("../../views/managePlace.jsp?status=danger&message=Price or Category cannot be null");
            return;
        } else {
            place.setName(pname.toLowerCase());
            place.setCategoryId(1);
            place.setPrice(pprice);
            place.setDescription(pdesc);
            place.setLocation(ploc);
            place.setRating(prat);
            place.insertPlace();
            response.sendRedirect("../../views/managePlace.jsp?status=success&message=Place berhasil dimasukkan");
        }
    } catch(Exception err)  {
        err.printStackTrace();
    }
%>