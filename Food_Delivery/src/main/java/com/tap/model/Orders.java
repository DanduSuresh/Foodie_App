package com.tap.model;

public class Orders {

	private int orderId;
	private String orderDate;
	private int restaurantId;
	private int userId;
	private double totalAmount;
	private String paymentMethod;
	private String status;
	private String deliveryAddress;

	public Orders() {
	}

	public Orders(int orderId, String orderDate, int restaurantId, int userId, double totalAmount, String paymentMethod,
			String status, String deliveryAddress) {

		this.orderId = orderId;
		this.orderDate = orderDate;
		this.restaurantId = restaurantId;
		this.userId = userId;
		this.totalAmount = totalAmount;
		this.paymentMethod = paymentMethod;
		this.status = status;
		this.deliveryAddress = deliveryAddress;
	}

	// getters & setters
	public int getOrderId() {
		return orderId;
	}

	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}

	public String getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(String orderDate) {
		this.orderDate = orderDate;
	}

	public int getRestaurantId() {
		return restaurantId;
	}

	public void setRestaurantId(int restaurantId) {
		this.restaurantId = restaurantId;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public double getTotalAmount() {
		return totalAmount;
	}

	public void setTotalAmount(double totalAmount) {
		this.totalAmount = totalAmount;
	}

	public String getPaymentMethod() {
		return paymentMethod;
	}

	public void setPaymentMethod(String paymentMethod) {
		this.paymentMethod = paymentMethod;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getDeliveryAddress() {
		return deliveryAddress;
	}

	public void setDeliveryAddress(String deliveryAddress) {
		this.deliveryAddress = deliveryAddress;
	}
}
