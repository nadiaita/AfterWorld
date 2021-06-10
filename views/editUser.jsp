<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<style>
table {
  border-collapse: collapse;
  width: 100%;
}

td, th {
  border: 1px solid #dddddd;
  text-align: left;
  padding: 8px;
}

tr:nth-child(even) {
  background-color: #dddddd;
}

.card label, .card input {
    margin-top: 0.5em;
}

</style>
<body>
    <jsp:include page="../components/navbar.jsp" />
    <div class="container">
            <%@include file="../models/User.jsp"%>
            <%
                Integer userId = Integer.parseInt(request.getParameter("userId"));
                User user = new User().getUser(userId);
                Vector<User> users = new User().getAllUsers();
            %>
        <div class="card" style="padding: 2em; margin-top: 2em;">
            <form action="../controllers/user.createUser.jsp" method="POST" id="createUser" style="flex-direction: column;">
                <label for="name" style="display: block;">Name</label>
                <input type="text" name="name" id="name" style="display: block; width: 100%; margin-top" value="<%= place.getName() %>"/>
                <label for="email" style="display: block;">Email Address</label>
                <input type="text" name="email" id="email" style="display: block; width: 100%" value="<%= place.getEmail() %>"/>
                <label for="phone" style="display: block;">Phone Number</label>
                <input type="number" name="phone" id="phone" style="display: block; width: 100%" value="<%= place.getPhoneNumber() %>"/>
                <label for="role" style="display: block;">Role</label>
                <%-- <c:forEach items="<%=RoleIds%>" var="role">
                    <option value="<%= role%>"><%= user.getRoleName(role) %></option>
                </c:forEach> --%>
                <input type="hidden" value="1" name="role_id"/>
                <input type="submit" value="Save" style="display: block; width: 100%;"/>
            </form>
        </div>
    </div>
    <jsp:include page="../components/footer.jsp" />
</body>
</html>