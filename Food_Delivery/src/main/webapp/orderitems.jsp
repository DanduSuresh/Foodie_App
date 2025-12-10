<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.tap.model.OrderItem" %>

<!DOCTYPE html>
<html>
<head>
<title>Order Details</title>

<link rel="stylesheet" href="Styles/restaurants.css?v=11">
<link href="https://cdn-icons-png.flaticon.com/128/14063/14063185.png" rel="icon" />
<link
	href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap"
	rel="stylesheet" />
</head>

<body>

<%
int orderId = (int) request.getAttribute("orderId");
List<OrderItem> allItems = (List<OrderItem>) request.getAttribute("orderItems");

double total = 0;
%>

<h2 class="section-title">Order #<%=orderId %> Details</h2>
<p class="section-subtitle">Your ordered items 🍕🍔</p>

<div class="restaurant-grid">

<%
for(OrderItem item : allItems) {
	if(item.getOrderId() == orderId) {
	    double itemTotal = item.getQuantity() * item.getUnitPrice();
	    total += itemTotal;
%>

	<div class="restaurant-card" style="cursor: default;">
		<p><strong>Item ID:</strong> <%=item.getMenuId() %></p>
		<p><strong>Quantity:</strong> <%=item.getQuantity() %></p>
		<p><strong>Price:</strong> ₹<%=item.getUnitPrice() %></p>
		<p><strong>Total:</strong> ₹<%=itemTotal %></p>
	</div>

<%
	}
}
%>

</div>

<h3 style="text-align:center; margin-top:20px;">Final Amount: ₹<%=total %></h3>

<div style="text-align:center; margin-top:20px;">
	<a href="myorders" class="nav-btn">⬅ Back to Orders</a>
</div>

<footer>© 2025 Foodly — Created by Suresh</footer>

</body>
</html>
