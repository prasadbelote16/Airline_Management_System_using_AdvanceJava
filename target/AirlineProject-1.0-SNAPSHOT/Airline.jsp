<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<html>
    <head>
        <title>AIRLINE</title>
        <link rel="stylesheet" href="CSS/Airline2.css">

        <!-- Bootstrap CSS-->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">

        <!-- Bootstrap JS -->
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" ></script>

        <!-- Bootstrap Select Picker -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-select@1.13.14/dist/css/bootstrap-select.min.css">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap-select@1.13.14/dist/js/bootstrap-select.min.js"></script>

        <link rel='stylesheet' type='text/css' media='screen' href='main.css'>
        <script src='script.js'></script>
        
        <script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
        
    </head>
    <body>
        <div class="main-box">
            <header class="main-header-container">
                <!--<div class="main-header-logo"></div>-->
                <img src='Images/Group4.png' class="main-header-logo">
                
                <ul class="main-header-container-lists">
                    <li class='main-header-container-list'><a href='#special-flight-offers'>Offers</a></li>
                    <%out.print("<li class='main-header-container-list'><a href='ViewTicket.jsp?username="+ request.getParameter("username") +"'>View Ticket</a></li>");%>
                    <li class='main-header-container-list'><a href='#recentblog'>Recent Blog</a></li>
                    <li class='main-header-container-list'><a href='Login.html'>Log Out</a></li>
                </ul>
                <div class="main-header-container-username">
                    <p><i class='far fa-user-circle' style='font-size:24px'></i><% out.print(request.getParameter("username")); %></p>
                </div>
            </header>
            <form method="GET" action="BookTicket">
            <% // out.print("<form method='GET' action='BookTicket" +  + "'>"); %>
                <div class="book-ticket-box">
                    <div class="book-ticket-box-heading">
                        <h2>Book International Flights</h2>
                    </div>
                    <div>
                        <ul class="book-ticket-lists">
                            <li class="book-ticket-list From">
                                <p class="book-ticket-list-From">From</p>
                                <div class="search_select_box">
                                    <select data-live-search="true" name="source">
                                        <option value="Delhi, India">Delhi, India</option>
                                        <option value="Banglore, India">Banglore, India</option>
                                        <option value="Mumbai, India">Mumbai, India</option>
                                        <option value="Kolkata, India">Kolkata, India</option>
                                        <option value="Channai, India">Channai, India</option>
                                        <option value="Hyderabad, India">Hyderabad, India</option>
                                        <option value="Pune, India">Pune, India</option>
                                        <option value="Jaipur, India">Jaipur, India</option>
                                        <option value="Chandigarh, India">Chandigarh, India</option>
                                        <option value="Goa, India">Goa, India</option>
                                    </select>
                                </div>
                                <p>From Source</p>
                            </li>
                            <li class="book-ticket-list To">
                                <p class="book-ticket-list-To">To</p>
                                <div class="search_select_box">
                                    <select data-live-search="true" name="destination">
                                        <option value="Delhi, India">Delhi, India</option>
                                        <option value="Banglore, India">Banglore, India</option>
                                        <option value="Mumbai, India">Mumbai, India</option>
                                        <option value="Kolkata, India">Kolkata, India</option>
                                        <option value="Channai, India">Channai, India</option>
                                        <option value="Hyderabad, India">Hyderabad, India</option>
                                        <option value="Pune, India">Pune, India</option>
                                        <option value="Jaipur, India">Jaipur, India</option>
                                        <option value="Chandigarh, India">Chandigarh, India</option>
                                        <option value="Goa, India">Goa, India</option>
                                    </select>
                                </div>
                                <p>To Destiny</p>
                            </li>
                            <li class="book-ticket-list Departure">
                                <p class="book-ticket-list-Departure">Departure</p>
                                <input type="date" name="departure">
                                <p>Day</p>
                            </li>
                            <li class="book-ticket-list Return">
                                <p class="book-ticket-list-Return">Return</p>
                                <input type="date" name="returntrip">
                                <p>Day</p>
                            </li>
                            <li class="book-ticket-list Class">
                                <p class="book-ticket-list-Class">Travellers & Class</p>
                                <input type="text" placeholder="Class" name="travelclass">
                                <p>Class</p>
                            </li>
                        </ul>
                    </div>
                    <input type="submit" value="Book Ticket" class="book-ticket-btn">
                </div>
            </form>
        </div>


        <div class="special-flight-offers" id='special-flight-offers'>
            <h3>Flight Special Offers</h3>
            <div class="special-flight-offers-lists">
                <ul>
                    <%
                        String username=request.getParameter("username");
                        Class.forName("com.mysql.jdbc.Driver");
                        java.sql.Connection con= DriverManager.getConnection("jdbc:mysql://localhost:3306/airlinedb", "root", "");
                        Statement st=con.createStatement();
                        ResultSet rs;
                        rs=st.executeQuery("select * from specialoffers;");
                        while(rs.next()){
                            out.print("<li>"
                                      + "<img src='Images/airo.png'>"
                                      + "  <b>" + rs.getString("source") + " - " + rs.getString("destination") + "</b>"
                                      + "  <p>Rs.2000</p>"
                                      + "  <p>Class: Buisness</p>"
                                      + "  <a href='BookTicket?username=" + username + "&source=" + rs.getString("source") + "&destination=" + rs.getString("destination") + "&departure=" + rs.getString("departure") + "&returntrip=" + rs.getString("returntrip") + "&travelclass=" + rs.getString("travelclass") + "&price=2000'>Select Ticket</a>"
                                      + "</li>");
                        }
                    %>
                </ul>
            </div>
        </div>

        <div class="recent-blog" id='recentblog'>
            <h3 class="recent-blog-heading">Recent Blog</h3>
            <div class="recent-blog-details">

                <div class="recent-blog-details-1">
                    <img src="Images/why-book-banner.jpg">
                    <p class="recent-blog-details-1-para">Travolook is a one step solution for all of your air ticket needs. We present and exclusive offers or deals on domestic flight tickets. You can avail the enchanting deals via using promo codes, gift coupons and rewards. Apart from affordable flight booking you also get round the clock customer service.</p>
                </div>

                <div class="recent-blog-details-2">
                    <img src="Images/Cheap-Flight.jpg">
                    <p class="recent-blog-details-2-para">Air travel is still a dream for many people and the reason is their small budget. That?s why we try to provide our customers affordable flight tickets. We give signup coupons, exclusive offers and rewards which makes your flight booking affordable. Before booking an air ticket you must check our offers.</p>
                </div>
                
                <div class="recent-blog-details-3">
                    <img src="Images/customer-service-BN.jpg">
                    <p class="recent-blog-details-3-para">Travolook has a 24x7 customer support team which resolves all kinds of flight book issues as soon as possible. We value our customers' time. So we try to resolve all our customer queries as soon as possible. To get more information about flight booking or its prices call our expert customer executives.</p>
                </div>

            </div>
        </div>
                
        <div class="footer-division">
            <footer>
                <div class="logo">
                    <img src="Images/Group4.png" width="260px" height="70px">
                </div>

                <ul class="social-icons"> 
                    <li><a href="https://www.facebook.com/"><ion-icon name="logo-facebook"></ion-icon></a></li>
                    <li><a href="https://twitter.com/"><ion-icon name="logo-twitter"></ion-icon></a></li>
                    <li><a href="https://www.linkedin.com/login"><ion-icon name="logo-linkedin"></ion-icon></a></li>
                    <li><a href="https://www.instagram.com/"><ion-icon name="logo-instagram"></ion-icon></a></li>


                    <div class="Credit-cards" >
                        <img  src="Images/Group1.jpg" width="250px" height="50px">        
                    </div>
                </ul>
                <p class="p1">Connect Us</p>
                <ul class="menu">
                    <li><a href="#">Flights</a></li>
                    <li><a href="#">Offers</a></li>
                    <li><a href="#">Terms&Condition</a></li>
                    <li><a href="#">Services</a></li>
                    <li><a href="#">Privacy Policy</a></li>
                </ul>
                <p>&copy; Airline Reservation System | Made By Viraj and Prasad | All Rights Reserved</p>
            </footer>
            <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
            <script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
        </div>
    </body>
</html>