<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
String loggedUser = (String) session.getAttribute("userName");
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Foodie | Home</title>

<!-- Google Font -->
<link
	href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap"
	rel="stylesheet" />

<link href="https://cdn-icons-png.flaticon.com/128/14063/14063185.png"
	rel="icon" />

<!-- External CSS -->
<link rel="stylesheet" href="Styles/home.css?v=10" />

</head>

<body>

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
			</span> <a href="profile" class="nav-btn">Profile</a>
			<%
			}
			%>
		</div>

	</nav>





	<!-- HERO SECTION -->
	<div class="hero">
		<div class="hero-text">
			<h1>Delicious Food Delivered Fast</h1>
			<p>Order from the best restaurants around you. Fast delivery,
				great prices, and top-quality food.</p>

			<div class="search-box">
				<input type="text" placeholder="Search for dishes or restaurants..." />
				<a href="restaurant"><button>Search</button></a>
			</div>
		</div>

		<!-- <img class="logo-btn"
			src="https://foodly.delivery/wp-content/uploads/2025/07/Foodly-High-Res-Logo-1-scaled.webp" alt="Logo"/> -->
	</div>


	<!-- CATEGORIES -->
	<h2 class="title">What's on your mind?</h2>

	<div class="category-grid">

		<div class="category">
			<a href="restaurant"> <img
				src="https://images.unsplash.com/photo-1604382354936-07c5d9983bd3" />
			</a>
				<p>Pizza</p>
		</div>

		<div class="category">
			<a href="restaurant"> <img
				src="https://img.freepik.com/premium-photo/chicken-biryani-kerala-style-chicken-dhum-biriyani-made-using-jeera-rice-spices-arranged_667286-4606.jpg" />
			</a>
				<p>Biryani</p>
		</div>

		<div class="category">
			<a href="restaurant"> <img
				src="https://upload.wikimedia.org/wikipedia/commons/thumb/4/4d/Cheeseburger.jpg/1200px-Cheeseburger.jpg" />
			</a>
				<p>Burgers</p>
		</div>

		<div class="category">
			<a href="restaurant"> <img
				src="https://mummykitchen.in/wp-content/uploads/2025/01/Veg-Chinese-bhel.jpg" />
			</a>
				<p>Chinese</p>
		</div>

		<div class="category">
			<a href="restaurant"> <img
				src="https://i.guim.co.uk/img/media/698fd183dc12485059346ec795d4b1325d5b25bc/275_1424_2872_2872/master/2872.jpg?width=465&dpr=1&s=none&crop=none" />
			</a>
				<p>Shawarma</p>
		</div>

		<div class="category">
			<a href="restaurant"> <img
				src="https://t3.ftcdn.net/jpg/03/01/97/86/360_F_301978652_O0aPwap1JaEVaAhj3mIlbqNnJGmRyCzC.jpg" />
			</a>
				<p>Desserts</p>
		</div>

		<div class="category">
			<a href="restaurant"> <img
				src="https://img.freepik.com/free-photo/penne-pasta-tomato-sauce-with-chicken-tomatoes-wooden-table_2829-19739.jpg" />
			</a>
				<p>Pasta</p>
		</div>

		<div class="category">
			<a href="restaurant"> <img
				src="https://images.unsplash.com/photo-1585032226651-759b368d7246" />
			</a>
				<p>Noodles</p>
		</div>

	</div>
























































	<!-- OFFERS -->
	<h2 class="title">Exclusive Offers</h2>

	<div class="offers">
		<div class="offer">
			<a href="offers.jsp"><img
				src="https://pixelz.cc/wp-content/uploads/2018/10/pizza-uhd-4k-wallpaper.jpg"></a>
		</div>
		<div class="offer">
			<a href="offers.jsp"><img
				src="https://t4.ftcdn.net/jpg/13/24/40/25/360_F_1324402503_blOJb5tsALKMSuHuljoIZbdrASKInWY0.jpg" /></a>
		</div>
		<div class="offer">
			<a href="offers.jsp"><img
				src="https://wallpapercat.com/w/full/b/d/2/595504-3840x2160-desktop-4k-cake-background.jpg" /></a>
		</div>
	</div>


	<!-- WHY CHOOSE US -->
	<div class="why">
		<h2 class="title">Why Choose Foodly?</h2>

		<div class="why-grid">
			<div class="why-box">
				<h3>⚡ Fast Delivery</h3>
				<p>Your food delivered within 30 minutes.</p>
			</div>
			<div class="why-box">
				<h3>🍱 Fresh & Hygienic</h3>
				<p>Only high-quality and fresh food.</p>
			</div>
			<div class="why-box">
				<h3>📦 Live Tracking</h3>
				<p>Track your food in realtime.</p>
			</div>
		</div>
	</div>


	<!-- APP DOWNLOAD -->
	<div class="app-section">
		<h2>Download Our App</h2>
		<p>Better, faster ordering experience.</p>

		<div class="app-btns">
			<img src="https://cdn-icons-png.flaticon.com/128/9561/9561839.png" />
			<img src="https://cdn-icons-png.flaticon.com/128/9425/9425742.png" />
			<img src="https://cdn-icons-png.flaticon.com/128/10009/10009249.png" />
		</div>
	</div>

	<footer>© 2025 Foodly — Created by Suresh</footer>

</body>
</html>
