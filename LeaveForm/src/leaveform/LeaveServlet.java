package leaveform;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class LeaveServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        response.sendRedirect("success.jsp");
    }
}
