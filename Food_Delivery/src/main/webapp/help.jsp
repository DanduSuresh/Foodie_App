<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Foodie | Help</title>

    <!-- Same styling as restaurants -->
    <link rel="stylesheet" href="Styles/restaurants.css?v=33">
    <link href="https://cdn-icons-png.flaticon.com/128/14063/14063185.png" rel="icon" />
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap"
          rel="stylesheet" />

</head>

<body>

<%
String loggedUser = (String) session.getAttribute("userName");
%>

<!-- NAVBAR SAME Class Names -->
<nav class="main-nav">

    <div class="nav-left">
        <div class="logo">🍔 Foodie</div>
    </div>

    <div class="nav-center">
        <ul>
            <li><a href="home.jsp">Home</a></li>
            <li><a href="restaurant">Restaurants</a></li>
            <li><a href="offers.jsp">Offers</a></li>
            <li><a href="help.jsp" class="active">Help</a></li>
        </ul>
    </div>

    <div class="nav-right">
        <% if (loggedUser == null) { %>
            <a href="login.jsp" class="nav-btn">Login</a>
        <% } else { %>
            <span class="welcome">Welcome, <%=loggedUser%> 👋</span>
            </span> <a href="profile" class="nav-btn logout-btn">Profile</a>
        <% } %>
    </div>

</nav>

<%
if (loggedUser == null) {
    response.sendRedirect("login.jsp");
    return;
}
%>

<!-- Same Page Title Design -->
<h2 class="section-title">Help & Support</h2>
<p class="section-subtitle">We are here 24/7 to help you</p>

<!-- Cards use SAME class: restaurant-card -->
<div class="restaurant-grid">

    <div class="restaurant-card">
        <h3>Order Issues</h3>
        <p>Late delivery, missing items</p>
    </div>

    <div class="restaurant-card">
        <h3>Refunds</h3>
        <p>Payment failed or refund pending</p>
    </div>

    <div class="restaurant-card">
        <h3>Restaurant Issues</h3>
        <p>Food quality or hygiene concerns</p>
    </div>

    <div class="restaurant-card">
        <h3>Account Issues</h3>
        <p>Login, password or profile issues</p>
    </div>

    <div class="restaurant-card">
        <h3>Delivery Support</h3>
        <p>Delivery partner behaviour / delay</p>
    </div>

    <div class="restaurant-card">
        <h3>Safety</h3>
        <p>Food safety or health complaints</p>
    </div>

</div>

<!-- Contact Box — Styled like offers grid card -->
<div class="restaurant-card" style="max-width: 700px; margin: 40px auto; text-align: center;">
    <h3>📞 Contact Customer Care</h3>
    <p>Email: support@foodly.com</p>
    <p>Phone: +91 99999 99999</p>
</div>

<footer>© 2025 Foodly — Created by Suresh</footer>

</body>
</html>
