<%-- 
    Document   : payments
    Created on : Jan 12, 2023, 11:41:42 AM
    Author     : Blood
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <!-- custom css file link  -->
        <link rel="stylesheet" href="./css/payment.css">

    </head>
    <body>

        <%
            //getting the necessary data for the mail and payments
            Connection con = null;

            Statement st = null;
            ResultSet rs = null;
            String total = "0";
            int id = Integer.parseInt(request.getParameter("id"));
            String seats = "";
            String mdate = "";
            String mtime = "";

            try {
                //form connection
                Class.forName("com.mysql.jdbc.Driver");
                con = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/adminx", "root", "");
                st = con.createStatement();
                //execute quary
                String qry = "select * from orders where id='" + id + "'";
                rs = st.executeQuery(qry);
                //loop to get data from database
                while (rs.next()) {
                    total = rs.getString("total");
                    seats = rs.getString("seat");
                    mtime = rs.getString("mtime");
                    mdate = rs.getString("mdate");

                }
            } catch (Exception e) {
                out.print(e);
            }
        %>

        <div class="container">

            <form action="">

                <div class="row">

                    <div class="col">



                        <div class="inputBox">
                            <span>First name :</span>
                            <input type="text" id="fname" >
                        </div>
                        <div class="inputBox">
                            <span>Last name :</span>
                            <input type="text"  id="lname">
                        </div>
                        <div class="inputBox">
                            <span>email :</span>
                            <input type="email" id="email" placeholder="example@example.com">
                        </div>

                        <div class="inputBox">
                            <span>AMOUNT :</span>
                            <input type="text" id="amountx" Value="<%=total%>" disabled>
                        </div>
                    </div>

                </div>
                <button type="button" id="payhere-payment" value="proceed to checkout" class="submit-btn">__PAY__</button>


            </form>
        </div>
        <input type="hidden"  value="<%=mtime%>" id="mtime">
        <input type="hidden"  value="<%=mdate%>" id="mdate">

        <br><br>


        <script type="text/javascript" src="https://www.payhere.lk/lib/payhere.js"></script>

        <script>
            // Payment completed. It can be a successful failure.
            payhere.onCompleted = function onCompleted(orderId) {
                console.log("Payment completed. OrderID:" + orderId);
                alert("PAYMENT SUCESSEFUL \n your Ticket will be sent to your Email");
                window.location.href = "/WebApplication1/index.jsp?";
                // Note: validate the payment and show success or failure page to the customer
            };

            // Payment window closed
            payhere.onDismissed = function onDismissed() {
                // Note: Prompt user to pay again or show an error page
                console.log("Payment dismissed");
                alert("payment dismissed");
            };

            // Error occurred
            payhere.onError = function onError(error) {
                // Note: show an error page
                console.log("Error:" + error);
                alert("something went wrong!");
            };





            document.getElementById('payhere-payment').onclick = function (e) {

                var fname = document.getElementById('fname').value;
                var lname = document.getElementById('lname').value;
                var email = document.getElementById('email').value;
                var amountx = document.getElementById('amountx').value;

                if (fname && lname && email && amountx) {
                    //building the mail details into one string
                    var msgbody = "Ticket ID: <%=id%><br>Booked Seats :<%=seats%>" + "<br>NAME :" + document.getElementById('fname').value + " " + document.getElementById('lname').value + "<br>Movie Date :" + document.getElementById('mdate').value + "<br>Movie Time :" + document.getElementById('mtime').value + "<br>Amount Paid :" + document.getElementById('amountx').value;
                    //payment deatails
                    var payment = {
                        "sandbox": true,
                        "merchant_id": "1221973", // Replace your Merchant ID
                        "return_url": 'https://poor-trams-allow-112-134-224-206.loca.lt', // Important
                        "cancel_url": 'https://poor-trams-allow-112-134-224-206.loca.lt', // Important
                        "notify_url": "https://poor-trams-allow-112-134-224-206.loca.lt/WebApplication1/notify",
                        "order_id": "<%=id%>",
                        "items": "seats",
                        "amount": "<%=total%>",
                        "currency": "LKR",
                        "first_name": "Alaric",
                        "last_name": "Shiran",
                        "email": "samanp@gmail.com",
                        "phone": "0769071716",
                        "address": "No.1, Galle Road",
                        "city": "Colombo",
                        "country": "Sri Lanka",
                        "delivery_address": "No. 46, Galle road, Kalutara South",
                        "delivery_city": "negombo",
                        "delivery_country": "Sri Lanka",
                        "custom_1": msgbody,
                        "custom_2": document.getElementById('email').value
                    };
                    payhere.startPayment(payment);
                } else {
                    alert("Fill all the fields")
                }
            };
        </script>
    </body>
</html>
