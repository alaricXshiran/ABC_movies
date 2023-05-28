<%-- 
    Document   : index
    Created on : Dec 13, 2022, 5:04:17 PM
    Author     : Blood
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>

    <head>
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="./css/index.css">
    <a href="../../../../Downloads/adminx.sql"></a>
        <title>ABC HOME</title>
    </head>
    <body>
        <header>
            <h1 align="center">ABC Movies HOME</h1>
        <div class="navigationitem">
            <a href="./adminlog.jsp">ADMIN</a><br>
        </div>
            
            <a href="./contactus.jsp">Contact US/REVIEW</a><br>
        </header>
        
         <%
             
            Connection con=null;
            Statement st=null;
            ResultSet rs=null;
            try{
                //form connection
                 Class.forName("com.mysql.jdbc.Driver");
                 con=(Connection)DriverManager.getConnection("jdbc:mysql://localhost:3306/adminx","root","");
                 st=con.createStatement();
                 //execute quary
                 String qry="select movieid,movietitle,ontheaters,mhrs,mmins,mimg,price from movieinfo";
                 rs=st.executeQuery(qry);
         //loop to get data from database
                 while(rs.next()) 
                 {
         
                     int id = rs.getInt("movieid");
                     String movietitle=rs.getString("movietitle");
                     String ontheater= rs.getString("ontheaters");
                     String hours=(rs.getString("mhrs"));
                     String mins= rs.getString("mmins");
                     String image=rs.getString("mimg");
                     String price=rs.getString("price");
                     
                     %><div class="container-a">
                         <form method="get" action="booking.jsp">
                             <button type="submit" class="button">
                             <section class="moviex">
                                 
                                 <div class="movie-img">
                                     <img src="IMAGEDATA/<%=image%>"
                                 </div>
                                 <br>
                                 <div class="movie-text">
                                     <p style="font-size:30px"><B><%=movietitle%></B></p>
                                     <div class="movie-price">
                                         PRICE LKR=<%=price%>
                                     </div>
                                     <div class="movie-time">
                                         ON THEATERS FROM =<%=ontheater%>
                                     </div>
                                     <div class="movie-time">
                                         MOVIE TIMES=<%=hours%>:<%=mins%> hours
                                     </div>
                                 </div>
                                    <input type="hidden" name="movieidx" value="<%=id%>">
                             </section>
                            </button>    
                          </form>
                                    
                     </div>
         <%
                 }
            }
            catch(Exception e){
                out.print(e);
            }
        %>
    </body>
