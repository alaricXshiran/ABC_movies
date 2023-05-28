<%-- 
    Document   : booking
    Created on : Jan 12, 2023, 1:26:20 AM
    Author     : Blood
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="./css/booking.css">
        <title>booking</title>
    </head>
    <body onload="getdata()">
        <h1>BOOKING</h1>

        <%
            Connection con = null;
            Statement st = null;
            ResultSet rs = null;
            int id = Integer.parseInt(request.getParameter("movieidx"));
            try {
                //form connection
                Class.forName("com.mysql.jdbc.Driver");
                con = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/adminx", "root", "");
                st = con.createStatement();
                //execute quary
                String qry = "select * from movieinfo where movieid='" + id + "'";
                rs = st.executeQuery(qry);
                //loop to get data from database
                while (rs.next()) {
                    String movietitle = rs.getString("movietitle");

                    String image = rs.getString("mimg");
                    String price = rs.getString("price");

        %><div class="container">
            <section class="movie" id="movie">

                <div class="movie-img">
                    <img src="IMAGEDATA/<%=image%>"
                </div>
                <br>
                <div class="movie-text">
                    <p style="font-size:30px"><B><%=movietitle%></B></p>
                    <div class="movie-price">
                        PRICE LKR=<%=price%>
                    </div>

                </div>
                <input type="hidden" id="movieid" name="movieid" value="<%=id%>">
                <input type="hidden" id="movieprice" value="<%=price%>">
            </section>
        </div>
        <%
                }
            } catch (Exception e) {
                out.print(e);
            }
        %>

        <section class="containx">

            <div>
                SELECT THE DATE OF THE MOVIE <input type="date" id="ticketselect" name="ticketdate" onchange="getdata()" value="2023-01-01">
            </div>
            <div id="demo">

            </div>
            <div>

            </div>

        </section>




        <div id="seatmain" style="display:none">





            <session class="container1">

                <span id="xx">0</span><br>
                <span id="xxx">0</span>

                &nbsp;&nbsp;&nbsp;<div class="seat-a">
                    <%
                        for (int x = 1; x <= 4; x++) {
                    %>


                    <input type="checkbox" id="seat<%=x%>" name="seatcheck" onclick="checkboxes()">
                    <label for="fat">🍕<%=x%></label>


                    <%
                        }
                    %>
                    ------------------------------------------------
                    <%
                        for (int x = 5; x <= 8; x++) {
                    %>


                    <input type="checkbox" id="seat<%=x%>" name="seatcheck" onclick="checkboxes()"  >
                    <label for="fat">🍕<%=x%></label>


                    <%
                        }
                    %>
                </div>

                &nbsp;&nbsp;&nbsp;<div class="seat-a">
                    <%
                        for (int x = 9; x <= 12; x++) {
                    %>


                    <input type="checkbox" id="seat<%=x%>" name="seatcheck" onclick="checkboxes()"  >
                    <label for="fat">🍕<%=x%></label>


                    <%
                        }
                    %>
                    ------------------------------------
                    <%
                        for (int x = 13; x <= 16; x++) {
                    %>


                    <input type="checkbox" id="seat<%=x%>" name="seatcheck" onclick="checkboxes()"  >
                    <label for="fat">🍕<%=x%></label>


                    <%
                        }
                    %>
                </div>

                &nbsp;&nbsp;&nbsp;<div class="seat-a">
                    <%
                        for (int x = 17; x <= 20; x++) {
                    %>


                    <input type="checkbox" id="seat<%=x%>" name="seatcheck" onclick="checkboxes()"  >

                    <label for="fat">🍕<%=x%></label>

                    <%
                        }
                    %>
                    ----------------------------------
                    <%
                        for (int x = 21; x <= 24; x++) {
                    %>


                    <input type="checkbox" id="seat<%=x%>" name="seatcheck" onclick="checkboxes()" >
                    <label for="fat">🍕<%=x%></label>


                    <%
                        }
                    %>
                </div>

                &nbsp;&nbsp;&nbsp;<div class="seat-a">
                    <%
                        for (int x = 25; x <= 28; x++) {
                    %>


                    <input type="checkbox" id="seat<%=x%>" name="seatcheck" onclick="checkboxes()" >
                    <label for="fat">🍕<%=x%></label>


                    <%
                        }
                    %>
                    ------------------------------------
                    <%
                        for (int x = 29; x <= 32; x++) {
                    %>


                    <input type="checkbox" id="seat<%=x%>" name="seatcheck" onclick="checkboxes()"   <%


                           %>>

                    <label for="fat">🍕<%=x%></label>


                    <%

                        }
                    %>
                </div>
            </session>

            <button type="button" onclick="seatbook()">BOOK</button>     





        </div> <a href="./index.jsp">  home</a><br>
    </body>
    <script src="js/booking.js"></script>
    <script>
                function clearcheck() {
                    var checkbx = document.getElementsByName("seatcheck");
                    //get all the checked boxes
                    var checkch = "";
                    document.getElementById("xx").innerHTML = "0";
                    document.getElementById("xxx").innerHTML = "0";

                    for (var i = 0; i < checkbx.length; i++) {
                        //get the value of checked boxes into array

                        checkbx[i].disabled = false;
                        checkbx[i].checked = false;

                    }
                }

                function checkboxseat() {
                    //checking seats
                    clearcheck();
                    var mdatex = document.getElementById("ticketselect").value;
                    var mid = document.getElementById("movieid").value;
                    var sel = document.getElementById("mtime");
                    var mtime = sel.options[sel.selectedIndex].value;


                    var xhttp = new XMLHttpRequest();
                    //specifies the function to be executed every time the status of the XMLHttpRequest object changes
                    xhttp.onreadystatechange = function () {
                        //check if the response is ready    
                        if (this.readyState == 4 && this.status == 200) { 
                            //return response text as String  


                            if (xhttp.responseText == "") {

                                alert("ERROR");
                            } else {

                                //location.reload();
                                var tx = xhttp.responseText;
                                var tx2 = tx.split(",");
                                for (var i = 0; i < tx2.length; i++) {
                                    document.getElementById("" + tx2[i]).disabled = true;
                                }

                            }
                        }
                    };
                    xhttp.open("GET", "/WebApplication1/seatcheck?ticketdate=" + mdatex + "&movieid=" + mid + "&tickettime=" + mtime, true);
                    xhttp.send();

                }
                function seatbook() {

                    var mid = document.getElementById("movieid").value;

                    var checkbx = document.getElementsByName("seatcheck");
                    //get all the checked boxes
                    var checkch = "";

                    for (var i = 0; i < checkbx.length; i++) {
                        //get the value of checked boxes into array
                        if (checkbx[i].checked) {
                            checkch += checkbx[i].getAttribute("id") + ",";
                        }

                    }

                    console.log(checkch);
                    var mdatex = document.getElementById("ticketselect").value;
                    var sel = document.getElementById("mtime");
                    var mtime = sel.options[sel.selectedIndex].value;

                    var totalp = document.getElementById("xxx").innerHTML;
                    var xhttp = new XMLHttpRequest();
                    //specifies the function to be executed every time the status of the XMLHttpRequest object changes
                    xhttp.onreadystatechange = function () {
                        //check if the response is ready    
                        if (this.readyState == 4 && this.status == 200) { 
                            //return response text as String  


                            if (xhttp.responseText != "") {

                                var orderid = xhttp.responseText;
                                alert("PLEASE proceed to pay");
                                window.location.href = "/WebApplication1/payments.jsp?id=" + orderid;
                            } else {
                                alert("ERROR");
                                location.reload();

                            }
                            clearcheck();
                            checkboxseat();
                        }
                    };
                    //open and get
                    xhttp.open("GET", "/WebApplication1/booking?ticketdate=" + mdatex + "&movieid=" + mid + "&seats=" + checkch + "&price=" + totalp + "&tickettime=" + mtime, true);
                    xhttp.send();

                }
                
                    //check if movie is avaiable

                function getdata() {
                    clearcheck();
                    var mid = document.getElementById("movieid").value;
                    var mdatex = document.getElementById("ticketselect").value
                    //creates an XMLHttpRequest object
                    var xhttp = new XMLHttpRequest();
                    //specifies the function to be executed every time the status of the XMLHttpRequest object changes
                    xhttp.onreadystatechange = function () {
                        //check if the response is ready    
                        if (this.readyState == 4 && this.status == 200) { 
                            //return response text as String  
                            document.getElementById("demo").innerHTML = xhttp.responseText;   

                            if (xhttp.responseText == "") {
                                document.getElementById("seatmain").style.display = "none";
                                alert("NO MOVIE IS AVAIABLE TO THIS DATE")
                            } else {
                                document.getElementById("seatmain").style.display = "block";
                                checkboxseat();

                            }
                        }
                    };
                    //open and get
                    xhttp.open("GET", "/WebApplication1/getmoviedate?ticketdate=" + mdatex + "&movieid=" + mid, true);
                    xhttp.send();

                }


    </script>

</html>
