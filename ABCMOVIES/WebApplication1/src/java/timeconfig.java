/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Blood
 */
@WebServlet(urlPatterns = {"/timeconfig"})
public class timeconfig extends HttpServlet {

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            
        }
    }

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out=response.getWriter();
        //get variables
        String tdate=request.getParameter("tdate");
        String aa=request.getParameter("id1");
        String bb=request.getParameter("id2");
        String cc=request.getParameter("id3");
        String dd=request.getParameter("id4");
        String ee=request.getParameter("id5");
        
        Connection con=null;
         Statement st=null;
         try{
             //create connection
             Class.forName("com.mysql.jdbc.Driver");
             con=(Connection)DriverManager.getConnection("jdbc:mysql://localhost:3306/adminx","root","");
             st=con.createStatement();
             //create sql quary
             String qry="insert into timeinfo Value ('"+tdate+"','"+aa+"','"+bb+"','"+cc+"','"+dd+"','"+ee+"')";
             //execute quary
            st.executeUpdate(qry);
            //redirect to this page
            response.sendRedirect("movietime.jsp");
         }
         catch(Exception e){
             out.print(e);
         }
    }

    
    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
