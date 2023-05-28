
import java.io.IOException;
import java.math.BigInteger;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Enumeration;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = {
    "/notify"
})
public class notify extends HttpServlet {

    public static String getMd5(String input) {
        try {

            // Static getInstance method is called with hashing MD5
            MessageDigest md = MessageDigest.getInstance("MD5");

            // digest() method is called to calculate message digest
            // of an input digest() return array of byte
            byte[] messageDigest = md.digest(input.getBytes());

            // Convert byte array into signum representation
            BigInteger no = new BigInteger(1, messageDigest);

            // Convert message digest into hex value
            String hashtext = no.toString(16);
            while (hashtext.length() < 32) {
                hashtext = "0" + hashtext;
            }
            return hashtext;
        } // For specifying wrong message digest algorithms
        catch (NoSuchAlgorithmException e) {
            throw new RuntimeException(e);
        }
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        //payment option parameter requests
        Enumeration< String> headerNames = request.getParameterNames();
        while (headerNames.hasMoreElements()) {
            String headerName = headerNames.nextElement();
            System.out.println("Header Name - " + headerName + ", Value - " + request.getParameter(headerName));
        }
        String custom_1 = request.getParameter("custom_1");
        String custom_2 = request.getParameter("custom_2");

        String order_id = request.getParameter("order_id");

        String status_code = request.getParameter("status_code");
        String merchant_id = request.getParameter("merchant_id");

        String payhere_amount = request.getParameter("payhere_amount");
        String payhere_currency = request.getParameter("payhere_currency");
        String hidethis = "NTY3MDM4MDE4MzM0NTAyNjMyMjE0MzA2NzUxMDcyMzk2MDQ1OTE5";
        try {
            String hash = merchant_id + order_id + payhere_amount + payhere_currency + status_code + getMd5(hidethis).toUpperCase();

            String genmd5sig = getMd5(hash).toUpperCase();
            System.out.println(genmd5sig);
            if ("2".equals(status_code)) {
                Connection con = null;
                Statement st = null;

                try {
                    //create connection
                    Class.forName("com.mysql.jdbc.Driver");
                    con = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/adminx", "root", "");
                    st = con.createStatement();
                    String qry = "select * from orders where id='" + order_id + "'";
                    ResultSet rs = st.executeQuery(qry);
                    if (rs.first()) {
                        String seats = rs.getString("seat");
                        String movieid = rs.getString("movieid");
                        String mdate = rs.getString("mdate");
                        String mtime = rs.getString("mtime");
                        String[] split = seats.split(",");
                        for (int i = 0; i < split.length; i++) {
                            qry = "insert into booking (mdate,mtime,seat,movieid) values ('" + mdate + "','" + mtime + "','" + split[i] + "','" + movieid + "')";
                            st.executeUpdate(qry);
                        }
                        //sending email
                        ///////////////////////////////////////////////////////////////////
                        ////////////////////////////////////////////////////////////////////////////////////
                        ////////////////////////////////////////////////////////////////////////////////////
                        mailsend.send(custom_2, "MOVIE TICKETS ON ABCmovies", custom_1);
                    }
                } catch (Exception e) {
                    System.out.println(e);

                }

            }
        } catch (Exception e) {
            System.out.println(e);
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

}
