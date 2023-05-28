/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



/**
 *
 * @author Blood
 */
@WebServlet(urlPatterns = {"/adminconfig"})
public class adminconfig extends HttpServlet {
    
    


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        
        //get variables
        PrintWriter out=response.getWriter();
        String username=request.getParameter("adminid");
        String password=request.getParameter("adminpass");
 
        try{
            //create connection
            Connection con=null;
            
            Class.forName("com.mysql.jdbc.Driver");
            con=(Connection)DriverManager.getConnection("jdbc:mysql://localhost:3306/adminx","root","");
            java.sql.Statement stm= con.createStatement();
            //create quary
            ResultSet rs= stm.executeQuery("select * from admininfo where user='"+username+"' and pass='"+password+"'");
            //execute quary in loop to check credientials
            if(rs.next()){
                //redirect to this page
                response.sendRedirect("addmovies.jsp");
            }
            else{
                out.print("LOGIN FAILED");
            }
           
            
        }
        catch(Exception e)
        {
            out.println(e);
        }
        
        
        
        

    }

   
   

}
