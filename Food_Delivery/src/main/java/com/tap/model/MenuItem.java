package com.tap.model;

public class MenuItem {

	private int menuId;
	private int restaurantId;
	private String menuName;
	private String description;
	private double price;
	private String imageUrl;
	private boolean available;
	private int quantity;

	public MenuItem(int menuId, int restaurantId, String menuName, String description, double price, String imageUrl,
			boolean available) {

		this.menuId = menuId;
		this.restaurantId = restaurantId;
		this.menuName = menuName;
		this.description = description;
		this.price = price;
		this.imageUrl = imageUrl;
		this.available = available;
		this.quantity = 1;
	}

	public int getMenuId() {
		return menuId;
	}

	public int getRestaurantId() {
		return restaurantId;
	}

	public String getMenuName() {
		return menuName;
	}

	public String getDescription() {
		return description;
	}

	public double getPrice() {
		return price;
	}

	public String getImageUrl() {
		return imageUrl;
	}

	public boolean isAvailable() {
		return available;
	}
	public int getQuantity() {
	    return quantity;
	}

	public void setQuantity(int quantity) {
	    this.quantity = quantity;
	}
}
