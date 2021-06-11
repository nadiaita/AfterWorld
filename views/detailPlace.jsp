<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<style>
    *{
        padding: 0px;
        margin: 0px;
    }
    body {
        /* padding: 0 100px */
    }
    .d-flex {
        display: flex;
        flex-direction: row;
        flex-wrap: wrap;
        /* justify-content: center; */
        /* align-items: center; */
    }
    .flex-1{
        margin-top: 30px;
        flex-grow: 1;
        max-width: 300px;
    }
    .card {
        padding: 30px;
        border: 1px solid black;
        margin: 10px;
    }
    .card div, .card button {
        margin-top: 4px;
    }
</style>
<body>
    <jsp:include page="../components/navbar.jsp" />
    <div class="container">
        <%@include file="../models/Place.jsp"%>
        <%
            String detailId = request.getParameter("placeId");

            Place place = new Place().getPlace(Integer.parseInt(detailId));
        %>
        <div class="d-flex">
                <div class="card" style="flex-grow: 1">
                    <h3>
                        <%= place.getName() %>
                    </h3>
                    <h4>
                        <%= place.getCategoryName(place.getCategoryId()) %>
                    </h4>
                    <p>
                        Harga: Rp. <%= place.getPrice() %> / night
                    </p>
                    <div>
                        Location: <%= place.getLocation() %>
                    </div>
                    <div>
                        Description: <%= place.getDescription() %>
                    </div>
                </div>
                <div class="card" style="flex-grow: 1;">
                    <h2> Rp. <%= place.getPrice() %> / night </h2>
                    <form action="../controllers/booking/createBooking.jsp" method="POST" style="display: flex; flex-direction: column;">
                        <input type="hidden" name="user_id" value="1" />
                        <input type="hidden" name="place_id" value="<%= detailId %>" />
                        <input type="hidden" name="payment_id" value="1" />
                        <option value="${payment.id}"
                            <c:if test="${payment.id eq selectedPauId}">selected="selected"</c:if>
                            >
                            ${payment.name}
                        </option>
                        <input type="date" name="start_date" id="start_date" style="margin-top: 1em"/>
                        <input type="date" name="end_date" id="end_date" style="margin-top: 1em"/>
                        <input type="submit" name="Book" value="Book" style="margin-top: 1em"/>
                    </form>
                </div>
        </div>
    </div>
    <jsp:include page="../components/footer.jsp" />
</body>
</html>