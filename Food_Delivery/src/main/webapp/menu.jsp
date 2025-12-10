<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*, com.tap.model.MenuItem"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Foodie | Menu Items</title>

<!-- SAME CSS AS RESTAURANTS -->
<link rel="stylesheet" href="Styles/restaurants.css?v=44">
<link href="https://cdn-icons-png.flaticon.com/128/14063/14063185.png" rel="icon" />
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap"
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
			<% if (loggedUser == null) { %>
			<a href="login.jsp" class="nav-btn">Login</a>
			<% } else { %>
			<span class="welcome">Welcome, <%=loggedUser%> 👋</span>
			<!-- <a href="myorders.jsp" class="nav-btn">My Orders</a> -->
			<a href="logout" class="nav-btn logout-btn">Logout</a>
			<% } %>
		</div>

	</nav>

	<!-- TITLE -->
	<h2 class="section-title">Menu Items</h2>
	<p class="section-subtitle">Delicious dishes from this restaurant</p>

	<!-- ⭐ Changed: menu-grid ➝ restaurant-grid -->
	<div class="restaurant-grid">

		<%
		List<MenuItem> menuList = (List<MenuItem>) request.getAttribute("menuList");

		if (menuList != null && !menuList.isEmpty()) {
			for (MenuItem m : menuList) {
		%>

		<!-- ⭐ menu-card ➝ restaurant-card -->
		<div class="restaurant-card">

			<img src="<%=m.getImageUrl()%>" alt="<%=m.getMenuName()%>">

			<h3><%=m.getMenuName()%></h3>
			<p><%=m.getDescription()%></p>

			<!-- ⭐ price ➝ rating style reused -->
			<span class="rating">₹ <%=m.getPrice()%></span>

			<% if (loggedUser != null) { %>
			<form action="cart" method="post">
				<input type="hidden" name="menuId" value="<%=m.getMenuId()%>">
				<input type="hidden" name="quantity" value="1">
				<input type="hidden" name="restaurantId" value="<%=m.getRestaurantId()%>">
				<input type="hidden" name="action" value="add">
				<button type="button" class="add-btn"
					onclick="confirmCart(<%=m.getRestaurantId()%>, this.form)">
					Add To Cart
				</button>
			</form>
			<% } %>

			<% if (!m.isAvailable()) { %>
			<p style="color: red; font-weight: bold;">Not Available</p>
			<% } %>

		</div>

		<%
		}
		} else {
		%>

		<p style="text-align:center;color:red;font-size:20px;">No menu items found!</p>

		<%
		}
		%>

	</div>

	<footer>© 2025 Foodly — Created by Suresh</footer>

	<script>
	function confirmCart(newRestId, form) {
	    var oldRestId = "<%= session.getAttribute("oldRestaurantId") %>";

	    if (oldRestId === "null" || oldRestId == newRestId) {
	        form.submit();
	    } else {
	        if (confirm("Your cart contains items from another restaurant.\nDo you want to reset your cart?")) {
	            form.submit();
	        }
	    }
	}
	</script>

</body>
</html>
