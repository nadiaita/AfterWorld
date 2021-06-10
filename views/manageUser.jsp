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
</style>
<body>
    <jsp:include page="../components/navbar.jsp" />
    <div class="container">
            <%@include file="../models/User.jsp"%>
            <%
                Vector<User> users = new User().getAllUser();
            %>
        <table style="margin-top: 1em;">
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Email</th>
                <th>Phone</th>
                <th>Role</th>
                <th></th>
            </tr>
            <%
                for(User user : users){
            %>
                <tr>
                    <td>
                        <%= user.getUserId() %>
                    </td>
                    <td>
                        <%= user.getName() %>
                    </td>
                    <td>
                        <%= user.getEmail() %>
                    </td>
                    <td>
                        <%= user.getPhoneNumber() %>
                    </td>
                    <td>
                        <%= user.getRoleId() %>
                    </td>
                    <td>
                        <button style="padding: 4px;">
                            <a href="./editUser.jsp?userId=<%= user.getUserId() %>">Edit</a>
                        </button>
                        <form action="../controllers/user/deleteUser.jsp" method="POST">
                            <input type="hidden" name="user_id" value="<%= user.getUserId() %>" />                    
                            <input type="submit" value="Delete" name="Delete"/>   
                        </form>
                    </td>
                </tr>
            <%
            }
            %>
        </table>
        <div class="card" style="padding: 2em; margin-top: 2em;">
            <h2 style="text-align:center;">Insert User</h2>
            <form action="../controllers/user/createUser.jsp" method="POST" id="createUser" style="flex-direction: column;">
                <label for="name" style="display: block;">Name</label>
                <input type="text" name="name" id="name" style="display: block; width: 100%; margin-top"/>
                <label for="email" style="display: block;">Email Address</label>
                <input type="text" name="email" id="email" style="display: block; width: 100%"/>
                <label for="phone" style="display: block;">Phone Number</label>
                <input type="number" name="phone" id="phone" style="display: block; width: 100%"/>
                <label for="role" style="display: block;">Role</label>
                <%-- <c:forEach items="<%=RoleIds%>" var="role">
                    <option value="<%= role%>"><%= user.getRoleName(role) %></option>
                </c:forEach> --%>
                <input type="hidden" value="1" name="role_id"/>
                <input type="submit" value="Save" style="display: block; width: 100%;"/>
            </form>
        </div>
    </div>
    </div>
    <jsp:include page="../components/footer.jsp" />
</body>
</html>