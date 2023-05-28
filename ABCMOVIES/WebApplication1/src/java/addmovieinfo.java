/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;

/**
 *
 * @author Blood
 */
@WebServlet(urlPatterns = {"/addmovieinfo"})
public class addmovieinfo extends HttpServlet {

   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

  
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //create variables
        String movietitle=request.getParameter("movietitle");
        String ontheaters=request.getParameter("datefrom");
        String mhrs=request.getParameter("moviehrs");
        String mmin=request.getParameter("moviemin");

        String img=request.getParameter("img");
        String price=request.getParameter("price");
        
        PrintWriter out=response.getWriter();
        
         Connection con=null;
         Statement st=null;
         
         try{
             //create connection
             Class.forName("com.mysql.jdbc.Driver");
             con=(Connection)DriverManager.getConnection("jdbc:mysql://localhost:3306/adminx","root","");
             st=con.createStatement();
             //execute quarry 
            String qry="insert into movieinfo (movietitle,ontheaters,mhrs,mmins,mimg,price) Value ('"+movietitle+"','"+ontheaters+"','"+mhrs+"','"+mmin+"','"+img+"','"+price+"')";
            st.executeUpdate(qry);
            //redirect to this page
            response.sendRedirect("addmovies.jsp");
            
         }
         catch(Exception e){
           out.print(e);
         }
    }

    
   

}
