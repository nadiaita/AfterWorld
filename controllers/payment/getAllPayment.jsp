<%@include file="../../models/Payment.jsp" %>
<%@page import="java.sql.*, java.util.*" %>

<%
    Payment payment = new Payment();
    try {
        return payment.getAllPayment();
    } catch (Exception e) {
        e.printStackTrace();
    }
%>