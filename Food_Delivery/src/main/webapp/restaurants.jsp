<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="java.util.List"%>
<%@ page import="com.tap.model.Restaurant"%>

<!DOCTYPE html>
<html>
<head>
<title>Foodie | Restaurants</title>

<link rel="stylesheet" href="Styles/restaurants.css?v=11">

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
			<!--   <a href="registration.jsp" class="nav-btn signup-btn">Sign Up</a> -->

			<%
			} else {
			%>

			<span class="welcome">Welcome, <%=loggedUser%> 👋
			<a href="myorders"
				class="nav-btn logout-btn">MyOrders</a>
			
			

			<%
			}
			%>
		</div>

	</nav>



	<!-- TITLE -->
	<h2 class="section-title">Top Restaurants</h2>
	<p class="section-subtitle">Handpicked places to satisfy your
		cravings</p>

	<!-- RESTAURANT GRID -->
	<div class="restaurant-grid">

		<%
		List<Restaurant> allRestaurants = (List<Restaurant>) request.getAttribute("allRestaurants");

		if (allRestaurants != null) {
			for (Restaurant r : allRestaurants) {
		%>

		<a href="menu?restaurantId=<%=r.getRestaurantId()%>"
			style="text-decoration: none; color: inherit;">

			<div class="restaurant-card">

				<img src="<%=r.getImageUrl()%>" alt="Restaurant Image">

				<h3><%=r.getRestaurantName()%></h3>
				<p><%=r.getCuisine()%></p>

				<p>
					<strong>Location:</strong>
					<%=r.getAddress()%></p>
				<p>
					<strong>Delivery:</strong>
					<%=r.getDeliveryTime()%></p>

				<span class="rating">★ <%=r.getRating()%></span>

				<%
				if (!r.getIsActive()) {
				%>
				<p style="color: red; font-weight: bold;">Not Active</p>
				<%
				}
				%>

			</div>

		</a>

		<%
		}
		}
		%>

	</div>

	<footer>© 2025 Foodly — Created by Suresh</footer>

</body>
</html>
