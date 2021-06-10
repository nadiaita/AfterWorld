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
            <%@include file="../models/Place.jsp"%>
            <%
               /* Tools tools = new Tools();
                news [] list = tools.getEvent();
                pageContext.setAttribute("list", list); */
                Integer userId = Integer.parseInt(request.getParameter("userId"));
                Place place = new Place().getPlace(userId);
                Vector<Integer> categoryIds = place.getAllCategoryId();

            %>
        <div class="card" style="padding: 2em; margin-top: 2em;">
            <form action="../controllers/place/updatePlace.jsp" method="POST" id="createPlace" style="flex-direction: column;">
                <input type="hidden" value="<%= place.getPlacesId() %>" name="place_id" />
                <label for="name" style="display: block;">Name</label>
                <input type="text" name="name" id="name" style="display: block; width: 100%; margin-top" value="<%= place.getName() %>"/>
                <label for="location" style="display: block;">Location</label>
                <input type="text" name="location" id="location" style="display: block; width: 100%; margin-top" value="<%= place.getLocation() %>"/>
                <label for="price" style="display: block;">Price</label>
                <input type="number" name="price" id="price" style="display: block; width: 100%" value="<%= place.getPrice() %>"/>
                <label for="description" style="display: block;">Description</label>
                <textarea name="description" id="description" form="createPlace" style="display: block; width: 100%"><%= place.getDescription() %></textarea>
                <label for="rating" style="display: block;">Rating</label>
                <input type="number" name="rating" id="rating" style="display: block; width: 100%" value="<%= place.getRating() %>"/>
                <label for="category" style="display: block;">Category</label>
                <%-- <c:forEach items="<%=categoryIds%>" var="category">
                    <option value="<%= category%>"><%= place.getCategoryName(category) %></option>
                </c:forEach> --%>
                <input type="hidden" value="1" name="category_id"/>
                <input type="submit" value="Save" style="display: block; width: 100%;"/>
            </form>
        </div>
    </div>
    <jsp:include page="../components/footer.jsp" />
</body>
</html>