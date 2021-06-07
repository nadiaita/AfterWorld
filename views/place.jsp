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
       
    }
    .flex-center {
        justify-content: center;
        align-items: center;
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
        <div class="d-flex flex-center">
            <%@include file="../models/Place.jsp"%>
            <%
                Vector<Place> allPlaces = new Place().getAllPlaces();
                for(Place place : allPlaces){
            %>
                <div class="flex-1 card">
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
                    <a href="./detailPlace.jsp?placeId=<%= place.getPlacesId() %>">View Detail</a>
                </div>
                
        <%
            }
            %>
        </div>
    </div>
    <jsp:include page="../components/footer.jsp" />
</body>
</html>