<%@include file="../../models/Booking.jsp" %>
<%@page import="java.sql.*, java.util.*" %>

<%
    Booking booking = new Booking();
    Integer uid = Integer.parseInt(request.getParameter("user_id"));
    Integer plcid = Integer.parseInt(request.getParameter("place_id"));
    Integer pymid = Integer.parseInt(request.getParameter("payment_id"));
    java.sql.Date strdate = java.sql.Date.valueOf(request.getParameter("start_date"));
    java.sql.Date enddate = java.sql.Date.valueOf(request.getParameter("end_date"));

    try {
        booking.setUserId(uid);
        booking.setPlacesId(plcid);
        booking.setPaymentId(pymid);
        booking.setStartDate(strdate);
        booking.setEndDate(enddate);
        booking.createBooking(uid);
        response.sendRedirect("../../views/place.jsp");
    } catch(Exception err){
        err.printStackTrace();
    }

%>