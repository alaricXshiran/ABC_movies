<%-- 
    Document   : movietime
    Created on : Dec 14, 2022, 1:07:02 AM
    Author     : Blood
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>MOVIE LIST</title>
    </head>
    <body>
        <h1>MOVIE TABLE</h1>
        <br>
        <br>
        <br>  <a href="./index.jsp">  home</a><br><a href="./addmovies.jsp">ADD MOVIE   </a><br><a href="./reviewcheck.jsp">REVIEW checking</a><br><br>  <a href="./deletemovies.jsp"> delete movies</a><br><br><br>
        <a href="./checkbooking.jsp">  CHECK BOOKINGS</a><br>
        <form method="post" action="timeconfig">
            
           THEATER DATE<input type="date" name="tdate" required><br>
            10:00 A.M<input type="text"  name="id1" required placeholder="MOVIE ID"><br>
           01:00 P.M<input type="text"  name="id2" required placeholder="MOVIE ID"><br>
           03:30 P.M<input type="text"  name="id3" required placeholder="MOVIE ID"><br>
           07:00 P.M<input type="text"  name="id4" required placeholder="MOVIE ID"><br>
           10:00 P.M<input type="text"  name="id5" required placeholder="MOVIE ID"><br>
            <input type="submit" value="Upload">
        </form> <br><br><br><br>
        
        <%
            Connection con=null;
            Statement st=null;
            ResultSet rs=null;
            try{
                 Class.forName("com.mysql.jdbc.Driver");
                 con=(Connection)DriverManager.getConnection("jdbc:mysql://localhost:3306/adminx","root","");
                 st=con.createStatement();
                 
                 String qry="select tabledate,10am,1pm,4pm,7pm,10pm from timeinfo";
                 
                 rs=st.executeQuery(qry);
                 
                 while(rs.next())
                 {
                     out.print("<br>");out.print("<br>");
                     out.print("MOVIE DATE  :");out.println(rs.getString(1));out.print("<br>");
                     out.print("MOVIE TIME 10:00AM :");out.println(rs.getString(2));out.print("<br>");
                     out.print("MOVIE TIME 01:00PM :");out.println(rs.getString(3));out.print("<br>");
                     out.print("MOVIE TIME 04:00PM :");out.println(rs.getString(4));out.print("<br>");
                     out.print("MOVIE TIME 07:00PM :");out.println(rs.getString(5));out.print("<br>");
                     out.print("MOVIE TIME 10:00PM :");out.println(rs.getString(6));out.print("<br>");
                     out.print("<br>");out.print("<br>");

                 }
            }
            catch(Exception e){
                out.print(e);
            }
            
        %>
        
        
    </body>
</html>