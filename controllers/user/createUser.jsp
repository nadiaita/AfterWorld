<%@include file="../../models/User.jsp" %>
<%@page import="java.sql.*, java.util.*" %>

<%
    User user = new User();
    Integer urole = Integer.parseInt(request.getParameter("role_id"));
    String uname = request.getParameter("user_name");
    String uemail = request.getParameter("email");
    String upassword = request.getParameter("password");
    String uphone = request.getParameter("phone_number");

    try{
        user.setName(uname.toLowerCase());
        user.setRoleId(urole);
        user.setEmail(uemail);
        user.setPassword(upassword);
        user.setPhoneNumber(uphone);
        System.out.println(user);
        user.insertUser();
        response.sendRedirect("/");
    } catch(Exception err)  {
        err.printStackTrace();
    }
%>