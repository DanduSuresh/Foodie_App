<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<title>Foodie | Register</title>
<link rel="stylesheet" href="Styles/login-signup.css">
<link
	href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap"
	rel="stylesheet" />
<link href="https://cdn-icons-png.flaticon.com/128/14063/14063185.png"
	rel="icon" />
</head>

<body>

	<%
	String loggedUser = (String) session.getAttribute("userName");
	%>

	<nav class="main-nav">

		<!-- LEFT → LOGO -->
		<div class="nav-left">
			<div class="logo">🍔 Foodie</div>
		</div>

		<!-- CENTER → MENU LINKS -->
		<div class="nav-center">
			<ul>
				<li><a href="home.jsp">Home</a></li>
				<li><a href="restaurants">Restaurants</a></li>
				<li><a href="offers.jsp">Offers</a></li>
				<li><a href="help.jsp">Help</a></li>
			</ul>
		</div>

		<!-- RIGHT → LOGIN/SIGNUP or USER OPTIONS -->
		<div class="nav-right">
			<%
			if (loggedUser == null) {
			%>
			<a href="login.jsp" class="nav-btn">Login</a>
			<%
			} else {
			%>
			<span class="welcome">Welcome, <%=loggedUser%> 👋
			</span> <a href="myorders.jsp" class="nav-btn">My Orders</a> <a
				href="logout" class="nav-btn logout-btn">Logout</a>
			<%
			}
			%>
		</div>

	</nav>

	<div class="container">
		<h2>User Registration</h2>

		<form action="register" method="post">

			<label>User Name</label> <input type="text" name="userName"
				placeholder="Enter your full name" required> <label>Email</label>
			<input type="email" name="email"
				placeholder="Enter your email address" required> <label>Phone</label>
			<input type="text" name="phoneNumber"
				placeholder="Enter your mobile number" required> <label>Password</label>
			<input type="password" name="password"
				placeholder="Create a strong password" required> <label>Address</label>
			<textarea name="address" rows="3"
				placeholder="Enter your full address"></textarea>

			<label>Role</label> <select name="role" required>
				<option value="" disabled selected>Select your role</option>
				<option value="customer">Customer</option>
				<option value="restaurant_admin">Restaurant Admin</option>
				<option value="delivery_boy">Delivery Boy</option>
				<option value="admin">Admin</option>
			</select>

			<button type="submit">Register</button>

		</form>

	</div>

</body>
</html>
