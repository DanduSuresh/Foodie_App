package com.tap.model;

public class Restaurant {
	
	 	private int restaurantId;
	    private String restaurantName;
	    private String address;
	    private double rating;       
	    private String cuisine;
	    private String deliveryTime;
	    private boolean isActive;
	    private String imageUrl;
	    private int adminUserId;
	    


		public Restaurant(int restaurantId, String restaurantName, String address, double rating, String cuisine,
				String deliveryTime, boolean isActive, String imageUrl, int adminUserId) {
			super();
			this.restaurantId = restaurantId;
			this.restaurantName = restaurantName;
			this.address = address;
			this.rating = rating;
			this.cuisine = cuisine;
			this.deliveryTime = deliveryTime;
			this.isActive = isActive;
			this.imageUrl = imageUrl;
			this.adminUserId = adminUserId;
		}


		public int getRestaurantId() {
			return restaurantId;
		}


		public void setRestaurantId(int restaurantId) {
			this.restaurantId = restaurantId;
		}


		public String getRestaurantName() {
			return restaurantName;
		}


		public void setRestaurantName(String restaurantName) {
			this.restaurantName = restaurantName;
		}


		public String getAddress() {
			return address;
		}


		public void setAddress(String address) {
			this.address = address;
		}


		public double getRating() {
			return rating;
		}


		public void setRating(double rating) {
			this.rating = rating;
		}


		public String getCuisine() {
			return cuisine;
		}


		public void setCuisine(String cuisine) {
			this.cuisine = cuisine;
		}


		public String getDeliveryTime() {
			return deliveryTime;
		}


		public void setDeliveryTime(String deliveryTime) {
			this.deliveryTime = deliveryTime;
		}


		public boolean getIsActive() {
			return isActive;
		}


		public void setIsActive(boolean isActive) {
			this.isActive = isActive;
		}


		public String getImageUrl() {
			return imageUrl;
		}


		public void setImageUrl(String imageUrl) {
			this.imageUrl = imageUrl;
		}


		public int getAdminUserId() {
			return adminUserId;
		}


		public void setAdminUserId(int adminUserId) {
			this.adminUserId = adminUserId;
		}


		@Override
		public String toString() {
			return "Restaurant [restaurantId=" + restaurantId + ", restaurantName=" + restaurantName + ", address="
					+ address + ", rating=" + rating + ", cuisine=" + cuisine + ", deliveryTime=" + deliveryTime
					+ ", isActive=" + isActive + ", imageUrl=" + imageUrl + ", adminUserId=" + adminUserId + "]";
		}
		
		
	    
	    
	
	
	

}
