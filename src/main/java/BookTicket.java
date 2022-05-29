
import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.http.HttpSession;

public class BookTicket extends HttpServlet {

    public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

        res.setContentType("text/html");
        PrintWriter out = res.getWriter();

        try {

            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/airlinedb", "root", "");
//            String username=req.getParameter("username");
//            HttpSession session = req.getSession();
            HttpSession session= req.getSession();
            String username = (String) session.getAttribute("username");
            String source = req.getParameter("source");
            String destination = req.getParameter("destination");
            String departure = req.getParameter("departure");
            String returntrip = req.getParameter("returntrip");
            String travelclass = req.getParameter("travelclass");

            PreparedStatement ps = con.prepareStatement("insert into booktickets values(?,?,?,?,?,?);");
            ps.setString(1, username);
            ps.setString(2, source);
            ps.setString(3, destination);
            ps.setString(4, departure);
            ps.setString(5, returntrip);
            ps.setString(6, travelclass);
            ps.executeUpdate();

            RequestDispatcher rd = req.getRequestDispatcher("/Airline.jsp?username="+ username);
            rd.forward(req, res);

        } catch (Exception e) {

            out.println("Error: " + e);

        }
    }
}
