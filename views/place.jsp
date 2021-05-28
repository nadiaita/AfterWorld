<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<style>
    body {
        padding: 0 100px
    }
    .d-flex {
        display: flex;
        flex-direction: row;
        flex-wrap: wrap;
        justify-content: center;
        align-items: center;
    }
    .flex-1{
        margin-top: 30px;
        flex-grow: 1;
        min-width: 400px;
    }
</style>
<body>
    <div>Testing apakah place bakal muncul</div>
    <div class="d-flex">
        <%@include file="../models/Place.jsp"%>
        <%
            Vector<Place> allPlaces = new Place().getAllPlaces();
            for(Place place : allPlaces){
            
        %>
            <div class="flex-1">
                <div>
                    Nama: <%= place.getName() %>
                </div>
                <div>
                    Harga: <%= place.getPrice() %>
                </div>
                <div>
                    Location: <%= place.getLocation() %>
                </div>
                <div>
                    description: <%= place.getDescription() %>
                </div>
            </div>
            
       <%
        }
        %>
    </div>
</body>
</html>