<%@include file="../../models/Payment.jsp" %>
<%@page import="java.sql.*, java.util.*" %>

<%
    Payment payment = new Payment();
    String payname = request.getParameter("payment_name");

    //Validation -- NANTI AJA MAGER HEHE 

    //Set value ke place dan insert ke DB
    try{
        payment.setName(payname.toLowerCase());
    } catch(Exception err=> {
        err.printStackTrace();
    })
%>