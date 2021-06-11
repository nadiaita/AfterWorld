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
                Vector<Place> places = new Place().getAllPlaces();
            %>
        <table style="margin-top: 1em;">
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Price</th>
                <th>Location</th>
                <th>Description</th>
                <th>Rating</th>
                <th>Category</th>
                <th></th>
            </tr>
            <%
                for(Place place : places){
            %>
                <tr>
                    <td>
                        <%= place.getPlacesId() %>
                    </td>
                    <td>
                        <%= place.getName() %>
                    </td>
                    <td>
                        <%= place.getPrice() %>
                    </td>
                    <td>
                        <%= place.getLocation() %>
                    </td>
                    <td>
                        <%= place.getDescription() %>
                    </td>
                    <td>
                        <%= place.getRating() %>
                    </td>
                    <td>
                        <%= place.getCategoryName(place.getCategoryId()) %>
                    </td>
                    <td>
                        <button style="padding: 4px;">
                            <a href="./editPlace.jsp?placeId=<%= place.getPlacesId() %>">Edit</a>
                        </button>
                        <form action="../controllers/place/deletePlace.jsp" method="POST">
                            <input type="hidden" name="place_id" value="<%= place.getPlacesId() %>" />                    
                            <input type="submit" value="Delete" name="Delete"/>   
                        </form>
                    </td>
                </tr>
            <%
            }
            %>
        </table>
        <%
		String status = request.getParameter("status"),
				message = request.getParameter("message");
		if (status != null && status.equals("danger")) {
		%>
			<div class="error-messages" style="display: block; background-color: #FF0000; padding: 12px; margin-top: 1em; color: white; border-radius: 4px;">
				<b><%= message %></b>
			</div>
		<%
		}else if (status != null && status.equals("success")) {
		%>
			<div class="success-messages" style="display: block; background-color: green; color: white; padding: 12px; margin-top: 1em; border-radius: 4px;">
				<p><%= message %></p>
			</div>
		<%
		}
		%>
        <div class="card" style="padding: 2em; margin-top: 2em;">
            <h2 style="text-align:center;">Insert Place</h2>
            <form action="../controllers/place/createPlace.jsp" method="POST" id="createPlace" style="flex-direction: column;">
                <label for="name" style="display: block;">Name</label>
                <input type="text" name="name" id="name" style="display: block; width: 100%; margin-top"/>
                <label for="location" style="display: block;">Location</label>
                <input type="text" name="location" id="location" style="display: block; width: 100%; margin-top"/>
                <label for="price" style="display: block;">Price</label>
                <input type="number" name="price" id="price" style="display: block; width: 100%" value="0"/>
                <label for="description" style="display: block;">Description</label>
                <textarea name="description" id="description" form="createPlace" style="display: block; width: 100%"></textarea>
                <label for="rating" style="display: block;">Rating</label>
                <input type="number" name="rating" id="rating" style="display: block; width: 100%" value="0"/>
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