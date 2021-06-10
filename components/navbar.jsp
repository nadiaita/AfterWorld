<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<style>
    *{
        margin: 0;
        padding: 0;
        font-family: Arial, Helvetica, sans-serif;
    }
    .container {
        padding: 20px 100px;
        min-height: 65vh;
    }
    .d-flex{
        display: flex;
    }
    .navbar {
        padding: 0 20px;
        background-color: grey
    }
    a {
        text-decoration: none;
    }
    .navbar > a, .navbar > .dropdown {
        padding: 20px 0;
        margin-right: 1.5em;
        color: white;
    }
    .navbar > a:nth-child(2){
        margin-left: auto;
    }
    a:last-child{
        margin-right: 0;
    }
    .dropdown{
        position: relative;
    }
    .dropdown-content {
        position: absolute;
        display: flex;
        flex-direction: column;
        color: black;
        background-color: black;
    }
    .flex-column{
        flex-direction: column;
    }
    .dropdown .dropbtn {
        color: white;
        outline: none;
        border: none;
        background-color: inherit;
        cursor: pointer;
        font: inherit;
    }
    .dropdown-content{
        /* bottom: 20px; */
        visibility: hidden;
        background-color: white;
        box-shadow: 5px 5px 8px grey;
    }
    .dropdown:nth-child(n+5) .dropdown-content{
        right: 0;
    }
    .dropdown-content a{
        display: block;
        padding: 10px;
        padding-top: 10px;
        white-space: nowrap;
        color: black;
        min-width: 100px;
    }
    .dropdown-content a:hover{
       background-color: grey;
    }

    .dropdown:hover .dropdown-content{
        visibility: visible;
    }
</style>
<body>
    <div class="navbar d-flex">
            <a href="../views/home.jsp">Afterworld</a>
            <a href="#">Date</a>
            <a href="../views/place.jsp">Places</a>
            <div class="dropdown">
                <button class="dropbtn">Manage &#9663;</button>
                <div class="dropdown-content">
                    <a href="../views/manageUser.jsp">Users</a>
                    <a href="../views/managePlace.jsp">Places</a>
                    <a href="../views/managePayment.jsp">Payment Type</a>
                    <a href="../views/manageCategory.jsp">Categories</a>
                </div>
            </div>
            <a href="../views/register.jsp">Register</a>
            <a href="../views/login.jsp">Login</a>
            <div class="dropdown">
                <button class="dropbtn">Nadibo &#9663;</button>
                <div class="dropdown-content" style="right: 0;">
                    <a href="#">Logout</a>
                    <a href="../views/myBooking.jsp">My Booking</a>
                    <a href="">Profile</a>
                </div>
            </div>
    </div>
</body>
</html>