<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<title>Foodie | Login</title>
<link rel="stylesheet" href="Styles/login-signup.css">
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet" />
<link href="https://cdn-icons-png.flaticon.com/128/14063/14063185.png" rel="icon" />
</head>

<body>

    <%
    String loggedUser = (String) session.getAttribute("userName");
    %>

    <nav class="main-nav">

        <div class="nav-left">
            <div class="logo">🍔 Foodie</div>
        </div>

        <div class="nav-center">
            <ul>
                <li><a href="home.jsp">Home</a></li>
                <li><a href="restaurants">Restaurants</a></li>
                <li><a href="offers.jsp">Offers</a></li>
                <li><a href="help.jsp">Help</a></li>
            </ul>
        </div>

        <div class="nav-right">
            <% if (loggedUser == null) { %>
                <a href="registration.jsp" class="nav-btn">SignUp</a>
            <% } else { %>
                <span class="welcome">Welcome, <%=loggedUser%> 👋</span>
                <a href="myorders.jsp" class="nav-btn">My Orders</a>
                <a href="logout" class="nav-btn logout-btn">Logout</a>
            <% } %>
        </div>

    </nav>

    <div class="container">

        <h2>User Login</h2>

        <%
        String error = (String) request.getAttribute("error");
        if (error != null) { %>
            <p class="error"><%=error%></p>
        <% } %>

        <form action="login" method="post">
            <label>Email</label>
            <input type="email" name="email" placeholder="Enter your email" required>

            <label>Password</label>
            <input type="password" name="password" placeholder="Enter the password" required>

            <button type="submit">Login</button>
        </form>

        <div class="bottom-text">
            <p>Don't have an account? <a href="registration.jsp">Register</a></p>
        </div>

    </div>

</body>
</html>
