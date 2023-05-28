<%-- 
    Document   : reviewcheck
    Created on : Jan 12, 2023, 2:03:43 PM
    Author     : Blood
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>review check</title>
    </head>
    <body>
        <h1>REVIEWS</h1>
        <a href="./movietime.jsp">GOTO MOVIE Time</a><br><br>  <a href="./index.jsp">  home</a><br><a href="./addmovies.jsp">  Add movies</a>
        
        
        <%
            Connection con=null;
            Statement st=null;
            ResultSet rs=null;
            try{
                 Class.forName("com.mysql.jdbc.Driver");
                 con=(Connection)DriverManager.getConnection("jdbc:mysql://localhost:3306/adminx","root","");
                 st=con.createStatement();
                 
                 String qry="select stars,fname,lname,email,phone,msg from reviews";
                 rs=st.executeQuery(qry);
                 
                 while(rs.next())
                 {
                     
                     
                     
                     %><div class="reviewx"><%
                     out.print("<br>");out.print("<br>");
                     
                     out.print("STARS__:");out.println(rs.getString(1));out.print("<br>");
                     out.print("NAME__:");out.println(rs.getString(2));
                     out.print("_");out.println(rs.getString(3));out.print("<br>");
                     out.print("EMAIL__:");out.println(rs.getString(4));out.print("<br>");
                     out.print("PHONE__:");out.println(rs.getString(5));out.print("<br><br>");
                     out.print("__REVIEW MESSAGE__");out.print("<br><br>");out.println(rs.getString(6));out.print("<br>");
                     
                     
                     out.print("<br>");out.print("<br>");
                     
                     %></div><%
                     
                 }
            }
            catch(Exception e){
                out.print(e);
            }
            
        %>
    </body>
</html>
