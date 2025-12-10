package com.tap.servlet;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import com.tap.daoImpl.OrderDaoImpl;
import com.tap.daoImpl.OrderItemDaoImpl;
import com.tap.model.Cart;
import com.tap.model.CartItem;
import com.tap.model.OrderItem;
import com.tap.model.Orders;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/checkout")
public class OrderServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		HttpSession session = req.getSession();

		Cart cart = (Cart) session.getAttribute("cart");
		Integer userId = (Integer) session.getAttribute("userId");

		if (userId == null || cart == null || cart.getItems().isEmpty()) {
			resp.sendRedirect("cart.jsp");
			return;
		}

		String address = req.getParameter("address");
		String paymentMethod = req.getParameter("paymentMethod");

		// Create Order (same logic)
		Orders order = new Orders();
		order.setRestaurantId(1); // you don't have restaurantId → temporary value
		order.setUserId(userId);

		double totalAmount = 0;

		for (Map.Entry<Integer, CartItem> entry : cart.getItems().entrySet()) {
			CartItem ci = entry.getValue();
			totalAmount += ci.getPrice() * ci.getQuantity();
		}

		order.setTotalAmount(totalAmount);
		order.setPaymentMethod(paymentMethod);
		order.setStatus("Pending");
		order.setDeliveryAddress(address);

		OrderDaoImpl orderDao = new OrderDaoImpl();
		orderDao.addOrder(order);

		List<Orders> allOrders = orderDao.getAllOrders();
		int orderId = allOrders.get(allOrders.size() - 1).getOrderId();

		OrderItemDaoImpl orderItemDao = new OrderItemDaoImpl();

		// Same logic using Map
		for (Map.Entry<Integer, CartItem> entry : cart.getItems().entrySet()) {
			CartItem ci = entry.getValue();
			OrderItem item = new OrderItem();
			item.setOrderId(orderId);
			item.setMenuId(ci.getItemId()); // menuId = itemId
			item.setQuantity(ci.getQuantity());
			item.setUnitPrice(ci.getPrice());
			orderItemDao.addOrderItem(item);
		}

		session.removeAttribute("cart");
		
		resp.sendRedirect("myorders");


	}
}
