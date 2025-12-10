<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Orders | Foodie</title>

<link rel="stylesheet" href="Styles/myorders.css">
<link href="https://cdn-icons-png.flaticon.com/128/14063/14063185.png"
	rel="icon" />
<link
	href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600;700&display=swap"
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

	<!-- 🔶 NAVBAR SAME THEME -->
	<nav class="main-nav">
		<div class="logo">🍔 Foodie</div>

		<ul>
			<li><a href="home.jsp">Home</a></li>
			<li><a href="restaurant">Restaurants</a></li>
			<li><a href="offers.jsp">Offers</a></li>
			<li><a href="help.jsp">Help</a></li>
			<li><a class="active" href="myorders.jsp">My Orders</a></li>
		</ul>

		<div class="right">
			<span class="welcome">👋 <%=loggedUser%></span> <a href="logout"
				class="nav-btn logout-btn">     </a>
		</div>
	</nav>

	<h2 class="section-title">Your Order Status</h2>
	<p class="section-subtitle">Tracking your recent orders</p>

	<div class="orders-container">

		<!-- ⭐ Dummy Sample Order -->
		<div class="order-card">
			<h3>Order #FD1025</h3>
			<p>Placed on: 27 Nov 2025</p>

			<div class="status-list">
				<div class="step active">✔ Order Confirmed</div>
				<div class="step active">🥘 Preparing Food</div>
				<div class="step">🏍️ Out for Delivery</div>
				<div class="step">📦 Delivered</div>
			</div>
		</div>

		<!-- ⭐ Sample Delivered Order -->
		<div class="order-card">
			<h3>Order #FD987</h3>
			<p>Placed on: 22 Nov 2025</p>

			<div class="status-list">
				<div class="step active">✔ Order Confirmed</div>
				<div class="step active">🥘 Preparing Food</div>
				<div class="step active">🏍️ Out for Delivery</div>
				<div class="step active">📦 Delivered</div>
			</div>
		</div>

	</div>

	<footer>© 2025 Foodly — Created by Suresh</footer>

</body>
</html>
