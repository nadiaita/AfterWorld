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
            <%@include file="../models/Category.jsp"%>
            <%
                Integer categoryId = Integer.parseInt(request.getParameter("categoryId"));
                Category category = new Category().getCategory(categoryId);
                Vector<Category> categories = new Category().getAllCategory();
            %>
        <div class="card" style="padding: 2em; margin-top: 2em;">
            <form action="../controllers/category.createCategory.jsp" method="POST" id="createCategory" style="flex-direction: column;">
                <input type="hidden" value="<%= category.getCategoryId() %>" name="category_id" />
                <label for="name" style="display: block;">Name</label>
                <input type="text" name="name" id="name" style="display: block; width: 100%; margin-top" value="<%= category.getName() %>"/>
                <input type="submit" value="Save" style="display: block; width: 100%;"/>
            </form>
        </div>
    </div>
    <jsp:include page="../components/footer.jsp" />
</body>
</html>