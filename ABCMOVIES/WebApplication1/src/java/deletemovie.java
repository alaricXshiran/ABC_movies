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

@WebServlet(urlPatterns = {"/deletemovie"})
public class deletemovie extends HttpServlet {


    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

        }
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String id=request.getParameter("delid");
        PrintWriter out=response.getWriter();
        
         Connection con=null;
         Statement st=null;
         try{
             //create connection
             Class.forName("com.mysql.jdbc.Driver");
             con=(Connection)DriverManager.getConnection("jdbc:mysql://localhost:3306/adminx","root","");
             st=con.createStatement();
             //execute quarry 
            String qry="DELETE FROM movieinfo WHERE movieid='"+id+"'";
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
