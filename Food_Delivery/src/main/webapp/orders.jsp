<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.*" %>
<%@ page import="com.tap.model.Orders" %>

<!DOCTYPE html>
<html>
<head>
<title>Foodie | My Orders</title>

<link rel="stylesheet" href="Styles/restaurants.css?v=11">
<link href="https://cdn-icons-png.flaticon.com/128/14063/14063185.png" rel="icon" />
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap"
    rel="stylesheet" />
</head>

<body>

<%
String loggedUser = (String) session.getAttribute("userName");
if(loggedUser == null) {
    response.sendRedirect("login.jsp");
    return;
}
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


<!-- TITLE -->
<h2 class="section-title">My Orders</h2>
<p class="section-subtitle">Track your recent orders 🍽</p>


<!-- ORDER GRID -->
<div class="restaurant-grid">

<%
List<Orders> myOrders = (List<Orders>) request.getAttribute("myOrders");

if (myOrders == null || myOrders.isEmpty()) {
%>

    <h3 style="text-align:center; width:100%;">No Orders Found 😔</h3>

<%
} else {

    for (Orders o : myOrders) {
%>

    <div class="restaurant-card" style="cursor: default;">

        <h3>Order ID: <%=o.getOrderId()%></h3>
        <p><strong>Date: </strong><%=o.getOrderDate()%></p>
        <p><strong>Total Amount:</strong> ₹<%=o.getTotalAmount()%></p>
        <p><strong>Payment:</strong> <%=o.getPaymentMethod()%></p>
        <p><strong>Status:</strong> <%=o.getStatus()%></p>
        <p><strong>Address:</strong> <%=o.getDeliveryAddress()%></p>

        <a href="orderitems?orderId=<%=o.getOrderId()%>" class="nav-btn" style="margin-top:10px;">
            View Items
        </a>
    </div>

<%
    }
}
%>

</div>


<footer>© 2025 Foodly — Created by Suresh</footer>

</body>
</html>
