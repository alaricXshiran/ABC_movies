<%-- 
    Document   : checkbooking
    Created on : Jan 16, 2023, 12:19:59 PM
    Author     : Blood
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>check bookings</h1>


        <form method="get" action="checkbooking.jsp">
            <div>
                <input type="date" name="xdate" id="xdate">
                <select name="xtime" id="xtime">
                    <option value="10am">10:00 AM</option>
                    <option value="1pm">01:00 P.M</option>
                    <option value="3pm">03:30 P.M</option>
                    <option value="7pm">07:00 P.M</option>
                    <option value="10pm">10:00 P.M</option>
                </select>
                <button type="submit" id="btn" >SEARCH ORDERS</button>
            </div>
        </form>
        <%
            Connection con = null;
            Statement st = null;
            ResultSet rs = null;

            String xdate = request.getParameter("xdate");
            String xtime = request.getParameter("xtime");
            try {
                Class.forName("com.mysql.jdbc.Driver");
                con = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/adminx", "root", "");
                st = con.createStatement();

                String qry = "select * from booking where mdate='" + xdate + "' and mtime='" + xtime + "' ";
                rs = st.executeQuery(qry);

                while (rs.next()) {
                    out.print("<br>");
                   out.print("order ID :");out.println(rs.getString(1));out.print("<br>");
                   out.print("MOVIE DATE :");out.println(rs.getString(2));out.print("<br>");
                   out.print("MOVIE TIME :");out.println(rs.getString(3));out.print("<br>");
                   out.print("SEAT NUMBER :");out.println(rs.getString(4));out.print("<br>");
                   out.print("MOVIE ID :");out.println(rs.getString(5));out.print("<br>");
                   out.print("<br>");

                }
            } catch (Exception e) {
                
            }

        %>
    </body>
</html>
