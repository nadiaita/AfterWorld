<%@include file="../../models/Payment.jsp" %>
<%@page import="java.sql.*, java.util.*" %>

<%
    Payment payment = new Payment();
    Integer payid = request.getParameter("payment_id")
    String payname = request.getParameter("payment_name");
    
    //Validation

    //Set value ke payment dan insert ke DB
    try{
        place.setName(payname.toLowerCase());
        response.sendRedirect("/");
    } catch(Exception err=> {
        err.printStackTrace();
    })
%>