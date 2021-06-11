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
            <%@include file="../models/Payment.jsp"%>
            <%
                Vector<Payment> payments = new Payment().getAllPayment();
            %>
        <table style="margin-top: 1em;">
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th></th>
            </tr>
            <%
                for(Payment payment : payments){
            %>
                <tr>
                    <td>
                        <%= payment.getPaymentsId() %>
                    </td>
                    <td>
                        <%= payment.getName() %>
                    </td>
                    <td>
                        <button style="padding: 4px;">
                            <a href="./editUser.jsp?userId=<%= payment.getPaymentId() %>">Edit</a>
                        </button>
                        <form action="../controllers/payment/deletePayment.jsp" method="POST">
                            <input type="hidden" name="payment_id" value="<%= payment.getPaymentId() %>" />                    
                            <input type="submit" value="Delete" name="Delete"/>   
                        </form>
                    </td>
                </tr>
            <%
            }
            %>
        </table>
        <div class="card" style="padding: 2em; margin-top: 2em;">
            <h2 style="text-align:center;">Insert Payment Type</h2>
            <form action="../controllers/payment.createPayment.jsp" method="POST" id="createPayment" style="flex-direction: column;">
                <label for="name" style="display: block;">Name</label>
                <input type="text" name="name" id="name" style="display: block; width: 100%; margin-top"/>
                <input type="submit" value="Insert" style="display: block; width: 100%;"/>
            </form>
        </div>
    </div>
    <jsp:include page="../components/footer.jsp" />
</body>
</html>