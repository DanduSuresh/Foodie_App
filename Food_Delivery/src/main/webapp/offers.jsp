<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="com.tap.model.Restaurant"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Foodie | Offers</title>

<!-- Using same styling as restaurants -->
<link rel="stylesheet" href="Styles/restaurants.css?v=22">

<link href="https://cdn-icons-png.flaticon.com/128/14063/14063185.png"
	rel="icon" />
<link
	href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap"
	rel="stylesheet" />
</head>

<body>

	<%
	String loggedUser = (String) session.getAttribute("userName");
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
			<%
			if (loggedUser == null) {
			%>
			<a href="login.jsp" class="nav-btn">Login</a>
			<%
			} else {
			%>
			<span class="welcome">Welcome, <%=loggedUser%> 👋
			</span> <a href="profile" class="nav-btn logout-btn">Profile</a>
			<%
			}
			%>
		</div>

	</nav>

	<!-- TITLE -->
	<h2 class="section-title">Exclusive Offers</h2>
	<p class="section-subtitle">Best discounts near you</p>

	<!-- ⭐ Replaced class offer-grid → restaurant-grid -->
	<div class="restaurant-grid">

		<%
		List<Restaurant> list = (List<Restaurant>) request.getAttribute("restaurantList");

		if (list != null && !list.isEmpty()) {
			for (Restaurant r : list) {
		%>

		<a href="menu?restaurantId=<%=r.getRestaurantId()%>" style="text-decoration: none; color: inherit;">

			<!-- ⭐ Replaced offer-card → restaurant-card -->
			<div class="restaurant-card">

				<img src="<%=r.getImageUrl()%>" alt="Offer">

				<h3><%=r.getRestaurantName()%></h3>
				<p><strong>Offer:</strong> Up to 50% OFF!</p>
				<p><strong>Cuisine:</strong> <%=r.getCuisine()%></p>

				<!-- ⭐ Added rating class like restaurants page -->
				<span class="rating">★ <%=r.getRating()%></span>

			</div>

		</a>

		<%
		}
		} else {
		%>

		<!-- Dummy Offers (Fallback Design) -->
<a href="#" style="text-decoration: none; color: inherit;">
    <div class="restaurant-card">
        <img src="https://t4.ftcdn.net/jpg/12/36/95/09/360_F_1236950902_WdmHKltisVpaQ3aJnfN5ag0IcAuKDNqs.jpg">
        <h3>Biryani Mega Offer</h3>
        <p><strong>50% OFF</strong></p>
        <p><strong>Cuisine:</strong> Andhra / Hyderabadi</p>
        <span class="rating">★ 4.5</span>
    </div>
</a>

<a href="#" style="text-decoration: none; color: inherit;">
    <div class="restaurant-card">
        <img src="https://images.unsplash.com/photo-1593560708927-8a99a9f2d3bd">
        <h3>Pizza Festival</h3>
        <p><strong>Buy 1 Get 1 Free</strong></p>
        <p><strong>Cuisine:</strong> Italian</p>
        <span class="rating">★ 4.7</span>
    </div>
</a>

<a href="#" style="text-decoration: none; color: inherit;">
    <div class="restaurant-card">
        <img src="https://t3.ftcdn.net/jpg/02/65/07/66/360_F_265076620_DgA1F4z2zFvT1j6Y3w8YT2v1sr1MSQe4.jpg">
        <h3>Burger Blast Deal</h3>
        <p><strong>Flat 40% OFF</strong></p>
        <p><strong>Cuisine:</strong> American</p>
        <span class="rating">★ 4.3</span>
    </div>
</a>

<a href="#" style="text-decoration: none; color: inherit;">
    <div class="restaurant-card">
        <img src="https://images.unsplash.com/photo-1562967914-608f82629710">
        <h3>Chinese Combo Pack</h3>
        <p><strong>₹99 Only</strong></p>
        <p><strong>Cuisine:</strong> Chinese</p>
        <span class="rating">★ 4.6</span>
    </div>
</a>

<a href="#" style="text-decoration: none; color: inherit;">
    <div class="restaurant-card">
        <img src="https://wallpapercat.com/w/full/b/d/2/595504-3840x2160-desktop-4k-cake-background.jpg">
        <h3>Dessert Carnival</h3>
        <p><strong>30% OFF</strong></p>
        <p><strong>Cuisine:</strong> Bakery / Sweets</p>
        <span class="rating">★ 4.8</span>
    </div>
</a>
		

		<%
		}
		%>

	</div>

	<footer>© 2025 Foodly — Created by Suresh</footer>

</body>
</html>
