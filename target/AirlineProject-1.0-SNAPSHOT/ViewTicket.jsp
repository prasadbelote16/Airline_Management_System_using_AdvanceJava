
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="CSS/ViewTicket1.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>VIEW TICKET</title>
    </head>
    <body>
        <header class="main-header-container">
            <% out.print("<div class='main-header-logo'><a href='Airline.jsp?username="+ request.getParameter("username") +"'><img src='Images/Group4.png' width='180px' height='40px'></a></div>"); %>
            
            <ul class="main-header-container-lists">
                <%out.print("<li class='main-header-container-list'><a href='Airline.jsp?username="+ request.getParameter("username") +"'>Book Ticket</a></li>");%>
                <li class="main-header-container-list"><a href="Login.html">Log Out</a></li>
            </ul>
        </header>
        <h1>VIEW TICKET</h1>
        <div class="special-flight-offers">
            <div class="special-flight-offers-lists">
                <ul>
                    <%
                        String username=request.getParameter("username");
                        Class.forName("com.mysql.jdbc.Driver");
                        java.sql.Connection con= DriverManager.getConnection("jdbc:mysql://localhost:3306/airlinedb", "root", "");
                        Statement st=con.createStatement();
                        ResultSet rs;
                        rs=st.executeQuery("select * from booktickets where username='" + request.getParameter("username") + "';");
                        while(rs.next()){
                            out.print("<li>"
                                      + "<img src='Images/airo.png'>"
                                      + "  <b>" + rs.getString("source") + " - " + rs.getString("destination") + "</b>"
                                      + "  <p>Rs.2300</p>"
                                      + "  <p>Class: Eco</p>"
                                      + "  <a href='PrintTicket.jsp?username=" + username + "&source=" + rs.getString("source") + "&destination=" + rs.getString("destination") + "&departure=" + rs.getString("departure") + "&returntrip=" + rs.getString("returntrip") + "&travelclass=" + rs.getString("travelclass") + "&price=2000'>Print Ticket</a>"
                                      + "</li>");
                        }
                    %>
                </ul>
            </div>
        </div>
    </body>
</html>
