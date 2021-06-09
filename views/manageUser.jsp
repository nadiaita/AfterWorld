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
    </div>
    <jsp:include page="../components/footer.jsp" />
</body>
</html>