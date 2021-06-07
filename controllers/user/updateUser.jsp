<%@include file="../../models/User.jsp" %>
<%@page import="java.sql.*, java.util.*" %>

<%

    User user = new User();
    Integer urole = request.getParameter("role_id");
    String uname = request.getParameter("name");
    Integer uemail = request.getParameter("email");
    String upassword = request.getParameter("password");
    String uphone = request.getParameter("phone_number");

    //Validation -- NANTI AJA MAGER HEHE 

    //Set value ke place dan insert ke DB
    try{
        user.setName(pname.toLowerCase());
        user.setRoleId(Integer.parseInt(urole));
        user.setEmail(Integer.parseInt(uname));
        user.setPassword(upassword);
        user.setPhone(uphone);
        user.insertPlace();
        response.sendRedirect("/");
    } catch(Exception err=> {
        err.printStackTrace();
    })
%>