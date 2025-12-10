<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="com.tap.model.Cart"%>
<%@ page import="com.tap.model.CartItem"%>
<%@ page import="java.util.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Foodie | Your Cart</title>

<link rel="stylesheet" href="Styles/cart.css?v=11">

<link href="https://cdn-icons-png.flaticon.com/128/14063/14063185.png"
    rel="icon" />
<link
    href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap"
    rel="stylesheet" />
</head>

<body>

    <%
    String loggedUser = (String) session.getAttribute("userName");
    Cart cart = (Cart) session.getAttribute("cart");
    Integer restaurantId = (Integer) session.getAttribute("oldRestaurantId");
    double grandTotal = 0.0;
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

            <%
            if (loggedUser == null) {
            %>

            <a href="login.jsp" class="nav-btn">Login</a>

            <%
            } else {
            %>

            <span class="welcome">Welcome, <%=loggedUser%> 👋</span>
            <a href="myorders.jsp" class="nav-btn">My Orders</a>
            <a href="logout" class="nav-btn logout-btn">Logout</a>

            <%
            }
            %>
        </div>

    </nav>


    <!-- TITLE -->
    <h2 class="section-title">Your Order</h2>
    <p class="section-subtitle">Review your items before ordering</p>


    <!-- CART CONTAINER -->
    <div class="cart-container">

        <div class="cart-items">

            <%
            if (cart != null && !cart.getItems().isEmpty()) {

                for (CartItem item : cart.getItems().values()) {
                    double itemTotal = item.getPrice() * item.getQuantity();
                    grandTotal += itemTotal;
            %>

            <!-- ITEM CARD -->
            <div class="cart-item">

                <div>
                    <h3><%=item.getName()%></h3>
                    <span>₹ <%=item.getPrice()%></span>
                </div>

                <!-- Quantity Controller -->
                <form action="cart" method="post" class="qty-form">

                    <input type="hidden" name="menuId" value="<%=item.getItemId()%>">
                    <input type="hidden" name="restaurantId" value="<%=restaurantId%>">
                    <input type="hidden" name="action" value="update">

                    <!-- - -->
                    <button type="submit" class="qty-btn" name="quantity"
                        value="<%=item.getQuantity() - 1%>"
                        <%= item.getQuantity() <= 1 ? "disabled" : "" %>>
                        −
                    </button>

                    <!-- Qty -->
                    <span class="qty-display"><%=item.getQuantity()%></span>

                    <!-- + -->
                    <button type="submit" class="qty-btn" name="quantity"
                        value="<%=item.getQuantity() + 1%>">+</button>

                </form>

                <span class="item-total">₹ <%=itemTotal%></span>

                <!-- Remove -->
                <form action="cart" method="post">
                    <input type="hidden" name="menuId" value="<%=item.getItemId()%>">
                    <input type="hidden" name="restaurantId" value="<%=restaurantId%>">
                    <input type="hidden" name="action" value="delete">
                    <button class="remove-btn" type="submit">Remove</button>
                </form>

            </div>

            <%
                } // end loop
            %>

            <!-- Add More Items -->
            <div class="add-more-container">
                <a href="menu?restaurantId=<%=restaurantId%>" class="add-btn">+ Add More Items</a>
            </div>

            <%
            } else {
            %>

            <!-- EMPTY CART -->
            <div class="empty-cart">
                <h3>Your cart is empty 😞</h3>
                <a href="restaurant" class="add-btn">Browse Restaurants</a>
            </div>

            <%
            }
            %>

        </div>



        <!-- SUMMARY -->
        <%
        if (cart != null && !cart.getItems().isEmpty()) {
        %>
        <div class="cart-summary">

            <h3>Bill Details</h3>

            <div class="bill-row">
                <span>Item Total</span>
                <span>₹ <%=grandTotal%></span>
            </div>

            <div class="bill-row">
                <span>Delivery Fee</span>
                <span>₹ 30</span>
            </div>

            <hr>

            <div class="bill-row total">
                <span>To Pay</span>
                <span>₹ <%=grandTotal + 30%></span>
            </div>

            <a href="checkout.jsp" class="checkout-btn">PROCEED TO CHECKOUT</a>

        </div>
        <%
        }
        %>

    </div>


    <footer>© 2025 Foodly — Created by Suresh</footer>

</body>
</html>
