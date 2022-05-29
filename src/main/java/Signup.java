import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

public class Signup extends HttpServlet {

    public void doGet(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
        res.setContentType("text/html");
        PrintWriter out = res.getWriter();

        try {
            String Username,Email, Password;

            Username = req.getParameter("username");
            Email= req.getParameter("email");
            Password = req.getParameter("password");
            
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/airlinedb", "root", "");
            String query = "insert into signup values(?,?,?)"; 

            PreparedStatement ps = con.prepareStatement(query);

            ps.setString(1, Username);
            ps.setString(2, Email);
            ps.setString(3, Password);

            ps.executeUpdate();
            con.close();

            RequestDispatcher rd=req.getRequestDispatcher("/Login.html");  
            rd.forward(req, res); 
        } catch (Exception e) {
            out.println(e);
        }
    }
}
