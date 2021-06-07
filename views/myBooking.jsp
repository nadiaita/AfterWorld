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
            <%@include file="../models/Booking.jsp"%>
            <%
                Integer user_id = 1;
                Vector<Booking> allBookings = new Booking().getAllBookingsByUserId(user_id);
                if(allBookings.size() > 0) {
            %>
        <h2>Booking History</h2>
        <table style="margin-top: 1em;">
            <tr>
                <th>ID</th>
                <th>Place</th>
                <th>Payment</th>
                <th>Start Date</th>
                <th>End Date</th>
            </tr>
            <%
                    for(Booking booking : allBookings){
            %>
                <tr>
                    <td>
                        <%= booking.getBookingId() %>
                    </td>
                    <td>
                        <%= booking.getPlaceName(booking.getPlacesId()) %>
                    </td>
                    <td>
                        <%=booking.getPaymentName(booking.getPaymentId()) %>
                    </td>
                    <td>
                        <%= booking.getStartDate() %>
                    </td>
                    <td>
                        <%= booking.getEndDate() %>
                    </td>
                </tr>
            <%
                    }
                }
                else {
            %>
                <div style="padding: 2em; background-color: #E0FFFF; border-radius: 10px;">
                    <h3>No Bookings yet</h3>
                    <p style="margin-top: 1em;">Have you tried to book one of our places? Why don't you look around and see what we have</p>
                    <hr />
                    <a href="./place.jsp">See all wonderful places</a>
                </div>
            <%
                }
            %>
        </table>
    </div>
    <jsp:include page="../components/footer.jsp" />
</body>
</html>