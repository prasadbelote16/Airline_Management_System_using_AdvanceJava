
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

public class Login extends HttpServlet {

    public void doGet(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
        res.setContentType("text/html");
        PrintWriter out = res.getWriter();
        int num = 0;
        try {
            String username, password;

            username = req.getParameter("username");
            password = req.getParameter("password");

            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/airlinedb", "root", "");
            String query = "Select * from Signup where username=? and password=?";

            PreparedStatement ps = con.prepareStatement(query);

            ps.setString(1, username);
            ps.setString(2, password);

            ResultSet rs=ps.executeQuery();

            while(rs.next()){
                if(username.equals(rs.getString("username"))){
                    if(password.equals(rs.getString("password"))){
                        HttpSession session = req.getSession();
                        session.setAttribute("username", username);
                        RequestDispatcher rd=req.getRequestDispatcher("/Airline.jsp");  
                        rd.forward(req, res);  
                    }
                }
            }
        } catch (Exception e) {
            out.println(e);
        }
    }
}
