<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Checkout | Foodie</title>

<link rel="stylesheet" href="Styles/checkout.css">
<link href="https://cdn-icons-png.flaticon.com/128/14063/14063185.png" rel="icon" />

<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap"
      rel="stylesheet" />
</head>

<body>

<%
String loggedUser = (String) session.getAttribute("userName");
if (loggedUser == null) {
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
            <li><a href="cart.jsp">Cart</a></li>
        </ul>
    </div>

    <div class="nav-right">
        <span class="welcome">Welcome, <%=loggedUser%> 👋</span>
        <a href="logout" class="nav-btn logout-btn">Logout</a>
    </div>
</nav>

<h2 class="section-title">Checkout</h2>
<p class="section-subtitle">Enter delivery details to place order</p>

<div class="checkout-container">

    <!-- 👉 Redirect to success page -->
    <form action="orderSuccess.jsp" method="post">

        <label for="address">Delivery Address:</label>
        <textarea id="address" name="address" required></textarea>

        <label>Payment Method:</label>
        <select name="paymentMethod" required>
            <option value="Credit Card">Credit Card</option>
            <option value="Debit Card">Debit Card</option>
            <option value="Cash on Delivery">Cash on Delivery</option>
        </select>

        <input type="submit" value="Place Order">
    </form>

</div>

<pre> 

</pre>

<footer>© 2025 Foodly — Created by Suresh</footer>

</body>
</html>
