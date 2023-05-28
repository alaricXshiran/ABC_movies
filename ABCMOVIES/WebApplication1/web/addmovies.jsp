<%-- 
    Document   : addmovies
    Created on : Dec 13, 2022, 6:19:52 PM
    Author     : Blood
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ADD Movies</title>
    </head>
    <body>
        <h1>Add Movies!</h1><a href="./movietime.jsp">GOTO MOVIE Time</a><br><br>  <a href="./index.jsp">  home</a><br><a href="./reviewcheck.jsp">REVIEW checking</a><br>
        <form method="post" action="addmovieinfo">
            MOVIE TITLE<input type="text" name="movietitle" required><br>
            ON THEATERS 
            FROM<input type="date"  name="datefrom"required > <br>
            
            MOVIE DURATION  Hours<input type="number" name="moviehrs" max="24" min="0" 
                                        required> Minutes<input type="number" name="moviemin"
                                        max="60" min="0" required><br>
            
            ADD MOVIE POSTER<input  type="file" id="imgx" name="img" accept="img,jpg"><br>
            Movie Price LKR :<input type="text"  name="price"required placeholder="PRICE"> <br>
            <input type="submit" value="Upload">
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

