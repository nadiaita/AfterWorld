<!DOCTYPE html>
<html>
<head>
	<title>Register Page</title>
</head>
<body>
 	<jsp:include page="../components/navbar.jsp" />
	<div class="login_box">
		<p class="header_login">After World</p>

		<form action="../controllers/user/createUser.jsp" method="POST">
		<input type="hidden" name="role_id" id="role_id" value="2"/>
		<table>
			<tr>
				<td>
					Username
				</td>
				<td>
					<input type="text" name="user_name" placeholder="Username" id="user_name">
				</td>
			</tr>
			<tr>
				<td>
					Email
				</td>
				<td>
					<input type="text" name="email" placeholder="Email" id="email">
				</td>
			</tr>
			<tr>
				<td>
					Password
				</td>
				<td>
					<input type="password" name="password" placeholder="Password" id="password">
				</td>
			</tr>
			<tr>
				<td>
					Phone Number
				</td>
				<td>
					<input type="tel" name="phone_number" placeholder="Phone Number" id="phone_number" pattern="[0-9]{3}-[0-9]{3}-[0-9]{4}" required>
				</td>
			</tr>

		</table>

		<%
			String status = request.getParameter("status"),
				message = request.getParameter("message");
			if (status != null) {
		%>
			<div class="error-messages">
				<p><%= message %></p>
			</div>
		<%
			}
		%>

		<button type="submit" class="btn btn-action tombol_login">Register</button>
		
        <a href="./login.jsp">Already have an account? Login Now!</a>
        </form>
 
		
	</div>
	<jsp:include page="../components/footer.jsp" />
 
 
</body>
</html>