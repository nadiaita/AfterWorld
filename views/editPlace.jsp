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
        <div class="card" style="padding: 2em; margin-top: 2em;">
            <form action="../controllers/place.createPlace.jsp" method="POST" id="createPlace" style="flex-direction: column;">
                <label for="name" style="display: block;">Name</label>
                <input type="text" name="name" id="name" style="display: block; width: 100%; margin-top"/>
                <label for="price" style="display: block;">Price</label>
                <input type="number" name="price" id="price" style="display: block; width: 100%"/>
                <label for="description" style="display: block;">Description</label>
                <textarea name="description" id="description" form="createPlace" style="display: block; width: 100%"></textarea>
                <label for="rating" style="display: block;">Rating</label>
                <input type="number" name="rating" id="rating" style="display: block; width: 100%"/>
                <label for="category" style="display: block;">Category</label>
                select category harusnya di sini 
                <input type="submit" value="Save" style="display: block; width: 100%;"/>
            </form>
        </div>
    </div>
    <jsp:include page="../components/footer.jsp" />
</body>
</html>