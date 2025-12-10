<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<title>Order Successful | Foodie</title>

<!-- Import Restaurant CSS using @import -->
<link rel="stylesheet" href="Styles/orderSuccess.css?v=1">

<link href="https://cdn-icons-png.flaticon.com/128/14063/14063185.png" rel="icon" />
<link
    href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap"
    rel="stylesheet" />
</head>

<body>

<%
String loggedUser = (String) session.getAttribute("userName");
Integer lastOrderId = (Integer) session.getAttribute("lastOrderId");
%>

<!-- NAVBAR -->
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
        <span class="welcome">Welcome, <%=loggedUser%> 👋</span>
        <a href="logout" class="nav-btn logout-btn">Logout</a>
    </div>

</nav>


<!-- SUCCESS MESSAGE BOX -->
<div class="success-container">
    <h1>🎉 Order Placed Successfully!</h1>

    <p>Thank you for ordering with Foodly.</p>
    <p>Your food is being prepared 🍳 and will be delivered soon 🚴‍♂️</p>

    <a href="home.jsp" class="btn">Go to Home</a>

    <a href="myorders" class="btn">
        View Order Details
    </a>
</div>


<footer>© 2025 Foodly — Created by Suresh</footer>

</body>
</html>
