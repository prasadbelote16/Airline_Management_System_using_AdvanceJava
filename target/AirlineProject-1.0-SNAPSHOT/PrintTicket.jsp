
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <link rel="stylesheet" href="CSS/PrintTicket.css">
        <title>PRINT TICKET</title>
    </head>
    <body>
        <header class="main-header-container">
            <% out.print("<div class='main-header-logo'><a href='Airline.jsp?username="+ request.getParameter("username") +"'><img src='Images/Group4.png' width='180px' height='40px'></a></div>"); %>
            
            <ul class="main-header-container-lists">
                <%out.print("<li class='main-header-container-list'><a href='Airline.jsp?username="+ request.getParameter("username") +"'>Book Ticket</a></li>");%>
                <%out.print("<li class='main-header-container-list'><a href='ViewTicket.jsp?username="+ request.getParameter("username") +"'>View Ticket</a></li>");%>
                <li class="main-header-container-list"><a href='Login.html'>Log Out</a></li>
            </ul>
        </header>

        <div class="ticket">
            <div class="ticket-header">International Flight Ticket</div>
            <div class="ticket-details">
                <div class="ticket-barcode"></div>
                <div class="ticket-details-main">
                    <p>Username: <% out.print("<i>"+request.getParameter("username")+"</i>"); %></p>
                    <p>Source:  <% out.print("<i>"+request.getParameter("source")+"</i>"); %></p>
                    <p>Destination: <% out.print("<i>"+request.getParameter("destination")+"</i>"); %></p>
                    <p>Class: <% out.print("<i>"+request.getParameter("travelclass")+"</i>"); %></p>
                    <b class="date">Departure: <% out.print("<i>"+request.getParameter("departure")+"</i>"); %></b><b class="date return">Return: <% out.print("<i>"+request.getParameter("returntrip")+"</i>"); %></b>
            </div>

        </div>
        <div class="small-ticket">
            <div class="small-ticket-header"><img src="Images/Group4.png" width="150px" height="30px"></div>
            <div class="small-ticket-details">
                <div class="small-ticket-details-main">
                    <p>Username: <% out.print("<i>"+request.getParameter("username")+"</i>"); %></p>
                    <p>Source: <% out.print("<i>"+request.getParameter("source")+"</i>"); %></p>
                    <p>Destination: <% out.print("<i>"+request.getParameter("destination")+"</i>"); %></p>
                    <p>Class: <% out.print("<i>"+request.getParameter("travelclass")+"</i>"); %></p>
                    <p class="date">Departure: <% out.print("<i>"+request.getParameter("departure")+"</i>"); %></p>
                    <div class="small-ticket-barcode"></div>
                </div>
            </div>
        </div>

    </body>
</html>
