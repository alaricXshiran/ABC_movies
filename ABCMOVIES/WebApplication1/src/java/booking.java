
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

@WebServlet(urlPatterns = {"/booking"})
public class booking extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String ticketdate = request.getParameter("ticketdate");
        String tickettime = request.getParameter("tickettime");
        String movieid = request.getParameter("movieid");
        String seats = request.getParameter("seats");
        String price = request.getParameter("price");
        seats = seats.substring(0, seats.length() - 1);
        String[] split = seats.split(",");
        PrintWriter out = response.getWriter();

        Connection con = null;
        Statement st = null;

        try {
            //create connection
            Class.forName("com.mysql.jdbc.Driver");
            con = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/adminx", "root", "");
            st = con.createStatement();
            //execute quarry 

            String qry = "insert into orders (mdate,mtime,seat,movieid,status,total) values ('" + ticketdate + "','" + tickettime + "','" + seats + "','" + movieid + "',0,'" + price + "')";
            st.executeUpdate(qry, Statement.RETURN_GENERATED_KEYS);
            ResultSet keys = st.getGeneratedKeys();
            keys.next();
            int executeUpdate = keys.getInt(1);

            response.getWriter().write(executeUpdate + "");

        } catch (Exception e) {
            out.print(e);
        }

    }

}
