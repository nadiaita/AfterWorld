<!-- check username dan password yang diinput user ada dan sesuai dengan data di database -->
<%@include file="../model/User.jsp" %>
<%@page import="java.sql.*, java.util.*" %>

<%
	User user = new User();
	Vector<User> userVector = new Vector<User>();

	String email = request.getParameter("email");
	String password = request.getParameter("password");
	String check = request.getParameter("remember");

	userVector = user.getUserByEmail(email.toLowerCase());

	if(email.isEmpty() || password.isEmpty()) {
		response.sendRedirect("../login.jsp?status=danger&message=All fiels must be filled");
        return;
	}else if(usersVector.size()==0) {
		response.sendRedirect("../login.jsp?status=danger&message=Account not registered");
        return;
	}else {
		if(password.equals(userVector.get(0).getUserPassword())){
			
			//add session
			session.setAttribute("email",userVector.get(0).getEmail());
			session.setAttribute("role",userVector.get(0).getRole());

			if(check != null){
				if(check.equals("true")) {
					Cookie cookie = new Cookie("username",username.toLowerCase());
					Cookie cookie_role = new Cookie("role",userVector.get(0).getUserRole());

					cookie.setMaxAge(60*60*24*7);
					cookie_role.setMaxAge(60*60*24*7);

					//add cookies
					response.addCookie( cookie );
					response.addCookie( cookie_role );
				}
			}

			//add number of user login
			Integer Snline = (Integer) application.getAttribute("online");
            online = (online == null) ? 1 : online + 1;
            application.setAttribute("online", online);
			response.sendRedirect("../home.jsp?status=success&message=Successfully Login");

		}else {
			response.sendRedirect("../login.jsp?status=danger&message=Wrong password");
        	return;
		}
	}

%>