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

/**
 *
 * @author Blood
 */
@WebServlet(urlPatterns = {"/getmoviedate"})
public class getmoviedate extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //response.setContentType("text/html;charset=UTF-8");

        String mdate = request.getParameter("ticketdate");
        String movieid = request.getParameter("movieid");

        try {
            //form connection
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/adminx", "root", "");
            Statement st = con.createStatement();
            //execute quary
            String qry = "select * from timeinfo where tabledate='" + mdate + "' and ("
                    + " 10am='" + movieid + "' or 1pm='" + movieid + "' or  4pm='" + movieid + "' or  7pm='" + movieid + "' or  10pm='" + movieid + "') ";
            ResultSet rs = st.executeQuery(qry);
            //loop to get data from database
            //create string builder
            System.out.println(qry);

            StringBuilder mtime = new StringBuilder();
            if (rs.isBeforeFirst()) {
                mtime.append("<select name=\"mtime\" onchange=\"checkboxseat()\" id=\"mtime\">");

                while (rs.next()) {
                    if (rs.getString(2).equals(movieid)) {
                        mtime.append("<option value=\"10am\">10:00 AM</option>");
                    }
                    if (rs.getString(3).equals(movieid)) {
                        mtime.append("<option value=\"1pm\">01:00 PM</option>");
                    }
                    if (rs.getString(4).equals(movieid)) {
                        mtime.append("<option value=\"4pm\">04:00 PM</option>");
                    }
                    if (rs.getString(5).equals(movieid)) {
                        mtime.append("<option value=\"7pm\">07:00 AM</option>");
                    }
                    if (rs.getString(6).equals(movieid)) {
                        mtime.append("<option value=\"10pm\">10:00 PM</option>");
                    }

                    //mtime.append(rs.getString(1));mtime.append("<br>");
                }
                mtime.append("</select>");
           }

            response.getWriter().write(mtime.toString());

        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
