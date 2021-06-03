<%@include file="../../models/Payment.jsp" %>
<%@page import="java.sql.*, java.util.*" %>

<%
    Payment payment = new Payment();
    Integer payid = request.getParameter("payment_id");
    try {
        return payment.getPayment(payid);
    } catch (Exception e) {
        e.printStackTrace();
    }
%>