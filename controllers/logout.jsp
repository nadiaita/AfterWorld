<%
    // delete session data
    session.invalidate();

    // decrease number of user login
    Integer online = (Integer) application.getAttribute("online");
    if (online != null) online--;
    application.setAttribute("online", online);

    response.sendRedirect("../home.jsp");
%>
