<%-- 
    Document   : deletemovies
    Created on : Jan 13, 2023, 5:00:20 PM
    Author     : Blood
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>movie delete</title>
    </head>
    <body>
        <h1>DELETE MOVIES!</h1>
        <br>  <a href="./addmovies.jsp">  home</a><br><br>  <a href="./movietime.jsp">  home</a><br><a href="./checkbooking.jsp">  CHECK BOOKINGS</a><br>
        
        <form method="post" action="deletemovie">
            <b>ENTER MOVIE ID TO DELETE MOVIE FROM LIST</b><br>
            <input type="text" name="delid" required placeholder="MOVIE ID">
            <input type="submit" value="DELETE">
        </form>
        
        <%
            Connection con=null;
            Statement st=null;
            ResultSet rs=null;
            try{
                 Class.forName("com.mysql.jdbc.Driver");
                 con=(Connection)DriverManager.getConnection("jdbc:mysql://localhost:3306/adminx","root","");
                 st=con.createStatement();
                 
                 String qry="select movieid,movietitle from movieinfo";
                 rs=st.executeQuery(qry);
                 
                 while(rs.next())
                 {
                     
                     
                     
                     out.print("<br>");out.print("<br>");
                     
                     out.print("MOVIE TITLE  :");out.println(rs.getString(2));
                     out.print("_______");
                     out.print("MOVIE ID  :");out.println(rs.getString(1));
                     out.print("<br>");out.print("<br>");
                     
                     
                     
                 }
            }
            catch(Exception e){
                out.print(e);
            }
            
        %>
    </body>
</html>
