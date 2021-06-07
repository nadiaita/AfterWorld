<!DOCTYPE html>
<html>
<head>
	<title>Login Page</title>
</head>
<body>
 
	<div class="login_box">
		<p class="header_login">Aqua Pets</p>
 
		<form action="./controller/CheckUserLogin.jsp" method="POST">
			<label>Username</label>
			<input type="text" name="username" class="form_login" placeholder="Username">
 
			<label>Password</label>
			<input type="password" name="password" class="form_login" placeholder="Password">
 
 			<label>
				<input type="checkbox" name="remember" value="true"> Remember me
			</label>
			<%
			String status = request.getParameter("status"),
					message = request.getParameter("message");
			if (status != null && status.equals("danger")) {
			%>
				<div class="error-messages">
					<p><%= message %></p>
				</div>
			<%
			}else if (status != null && status.equals("success")) {
			%>
				<div class="success-messages">
					<p><%= message %></p>
				</div>
			<%
			}
			%>
			<button class="tombol_login">Sign In</button>
			<br>
		</form>

		<form action="./register.jsp">
			<button type="submit" class="btn btn-action tombol_regis">Register</button>
		</form>
 
		
	</div>
 
 
</body>
</html>
