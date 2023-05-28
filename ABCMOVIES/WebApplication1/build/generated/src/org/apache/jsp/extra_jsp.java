package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class extra_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>JSP Page</title>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <h1>Hello World!</h1>\n");
      out.write("        <script type=\"text/javascript\" src=\"https://www.payhere.lk/lib/payhere.js\"></script>\n");
      out.write("<button type=\"submit\" id=\"payhere-payment\" >PayHere Pay</button>\n");
      out.write("<script>\n");
      out.write("    // Payment completed. It can be a successful failure.\n");
      out.write("    payhere.onCompleted = function onCompleted(orderId) {\n");
      out.write("        console.log(\"Payment completed. OrderID:\" + orderId);\n");
      out.write("        // Note: validate the payment and show success or failure page to the customer\n");
      out.write("    };\n");
      out.write("\n");
      out.write("    // Payment window closed\n");
      out.write("    payhere.onDismissed = function onDismissed() {\n");
      out.write("        // Note: Prompt user to pay again or show an error page\n");
      out.write("        console.log(\"Payment dismissed\");\n");
      out.write("    };\n");
      out.write("\n");
      out.write("    // Error occurred\n");
      out.write("    payhere.onError = function onError(error) {\n");
      out.write("        // Note: show an error page\n");
      out.write("        console.log(\"Error:\"  + error);\n");
      out.write("    };\n");
      out.write("\n");
      out.write("    // Put the payment variables here\n");
      out.write("    var payment = {\n");
      out.write("        \"sandbox\": true,\n");
      out.write("        \"merchant_id\": \"1221973\",    // Replace your Merchant ID\n");
      out.write("        \"return_url\": \"http://sample.com/notify\",     // Important\n");
      out.write("        \"cancel_url\": \"http://sample.com/notify\",     // Important\n");
      out.write("        \"notify_url\": \"http://sample.com/notify\",\n");
      out.write("        \"order_id\": \"ItemNo12345\",\n");
      out.write("        \"items\": \"Door bell wireles\",\n");
      out.write("        \"amount\": \"1000.00\",\n");
      out.write("        \"currency\": \"LKR\",\n");
      out.write("        \"hash\": \"45D3CBA93E9F2189BD630ADFE19AA6DC\", // *Replace with generated hash retrieved from backend\n");
      out.write("        \"first_name\": \"Saman\",\n");
      out.write("        \"last_name\": \"Perera\",\n");
      out.write("        \"email\": \"samanp@gmail.com\",\n");
      out.write("        \"phone\": \"0771234567\",\n");
      out.write("        \"address\": \"No.1, Galle Road\",\n");
      out.write("        \"city\": \"Colombo\",\n");
      out.write("        \"country\": \"Sri Lanka\",\n");
      out.write("        \"delivery_address\": \"No. 46, Galle road, Kalutara South\",\n");
      out.write("        \"delivery_city\": \"Kalutara\",\n");
      out.write("        \"delivery_country\": \"Sri Lanka\",\n");
      out.write("        \"custom_1\": \"\",\n");
      out.write("        \"custom_2\": \"\"\n");
      out.write("    };\n");
      out.write("\n");
      out.write("    // Show the payhere.js popup, when \"PayHere Pay\" is clicked\n");
      out.write("    document.getElementById('payhere-payment').onclick = function (e) {\n");
      out.write("        payhere.startPayment(payment);\n");
      out.write("    };\n");
      out.write("</script>\n");
      out.write("    </body>\n");
      out.write("</html>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
