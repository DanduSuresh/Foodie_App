<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="com.tap.model.User"%>

<%
User user = (User) request.getAttribute("user");
String loggedUser = (String) session.getAttribute("userName");

// Prevent null error
if (user == null) {
%>
    <h3 style="color:red; text-align:center; margin-top:50px;">
        User not found.
    </h3>
<%
    return;
}
%>

<!DOCTYPE html>
<html>
<head>
<title>Foodie | Profile</title>

<link rel="stylesheet" href="Styles/profile.css?v=1">

<link href="https://cdn-icons-png.flaticon.com/128/14063/14063185.png"
      rel="icon" />

<link
    href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap"
    rel="stylesheet" />
    
    <link href="Styles/profile.css" rel="stylesheet">
</head>

<body>

<!-- NAVBAR - SAME AS RESTAURANT PAGE -->
<nav class="main-nav">

    <div class="nav-left">
        <div class="logo">🍔 Foodie</div>
    </div>

    <div class="nav-center">
        <ul>
            <li><a href="home.jsp">Home</a></li>
            <li><a href="restaurant">Restaurants</a></li>
            <li><a href="offers.jsp">Offers</a></li>
            <li><a href="help.jsp">Help</a></li>
        </ul>
    </div>

    <div class="nav-right">
        <%
        if (loggedUser == null) {
        %>
            <a href="login.jsp" class="nav-btn">Login</a>
        <%
        } else {
        %>
            <span class="welcome">Welcome, <%=loggedUser%> 👋</span>
            <a href="logout" class="nav-btn logout-btn">Logout</a>
        <%
        }
        %>
    </div>

</nav>

<!-- PROFILE SECTION -->
<h2 class="section-title">Your Profile</h2>
<p class="section-subtitle">Account details and information</p>

<div class="profile-container">

    <div class="profile-card">

        <p><strong>Name:</strong> <%= user.getUserName() %></p>
        <p><strong>Email:</strong> <%= user.getEmail() %></p>
        <p><strong>Phone:</strong> <%= user.getPhoneNumber() %></p>
        <p><strong>Address:</strong> <%= user.getAddress() %></p>
        <p><strong>Role:</strong> <%= user.getRole() %></p>

    </div>

</div>

<pre>


 
</pre>



<footer>© 2025 Foodly — Created by Suresh</footer>

</body>
</html>
