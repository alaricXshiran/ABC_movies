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
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = {"/seatcheck"})
public class seatcheck extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String ticketdate = request.getParameter("ticketdate");
        String tickettime = request.getParameter("tickettime");
        String movieid = request.getParameter("movieid");
        
        
        PrintWriter out = response.getWriter();

        Connection con = null;
        Statement st = null;

        try {
            //create connection
            Class.forName("com.mysql.jdbc.Driver");
            con = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/adminx", "root", "");
            st = con.createStatement();
            //execute quarry 
            //check if the seats are booked

            String qry = "select * from booking where mdate='"+ticketdate+"' and mtime='"+tickettime+"' and movieid='"+movieid+"'";
            ResultSet rs = st.executeQuery(qry);
            
            StringBuilder mtime = new StringBuilder();
            
            while(rs.next()){
                
                mtime.append(rs.getString("seat"));
                mtime.append(",");
                
            }
            
            
                    
            response.getWriter().write(mtime.toString().substring(0,mtime.toString().length()-1));

        } catch (Exception e) {
            out.print(e);
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
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
