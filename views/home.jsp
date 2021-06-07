<<<<<<< HEAD
=======
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
     <section id="banner" style="text-align: center; padding: 3em 0;">
        <div style="padding: 20px; background-color: white; width: 40%; margin: 0 auto;">
            <h1 style="font-size: 50px;">After World</h1>
            <p style="font-size: 24px;">Life begins at the end of your comfort zone</p>
        </div>
    </section>
    <div class="container">
        <%@include file="../models/Place.jsp"%>
        <section id="categories"  style="display: flex; flex-direction: row; ">  
            <%
                Vector<String> categories = new Place().getAllCategoryNames();
                for(String category : categories){
            %>
                <div style="border: 1px solid gray; border-radius: 10px; margin-right: 10px; padding: 8px;">
                    <%= category %>
                </div>
            <%
                }
            %>
        </section>
        <h1 style="font-size: 24px; margin-top: 20px; margin-bottom: 20px;">Explore new Places with Us</h1>
        <div class="d-flex flex-center">
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
                    <div>
                        description: <%= place.getDescription() %>
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
>>>>>>> e168d16be271ff81e825348633456098b0c42c39
