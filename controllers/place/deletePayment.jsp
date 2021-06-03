<%@include file="../../models/Payment.jsp" %>
<%@page import="java.sql.*, java.util.*" %>

<%
    Payment payment = new Payment();
    try {
        payment.deletePayment(Integer.parseInt(request.getParameter("payment_id")))
    } catch (Exception e) {
        e.printStackTrace();
    }
    response.sendRedirect("/");
%>