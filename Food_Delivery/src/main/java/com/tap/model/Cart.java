package com.tap.model;

import java.util.HashMap;
import java.util.Map;


public class Cart {
	private Map<Integer,CartItem> items;
	
	
	public Cart() {
		
		this.items = new HashMap<>();
		
	}
	
	public void addItem(CartItem item) {
		
		int itemId = item.getItemId();
		
		if(items.containsKey(itemId)) {
			CartItem existingItem = items.get(itemId);
			int newQua = item.getQuantity();
			
			int oldQua = existingItem.getQuantity();
			
			int sumQua = newQua + oldQua;
			
			existingItem.setQuantity(sumQua);
			
//			existingItem.setQuantity(existingItem.getQuantity()+item.getQuantity());
		}
		else {
			items.put(itemId, item);
		}
	}
	
	
	public Map<Integer, CartItem> getItems() {
		return items;
	}

	public void updateItem(int itemId, int quantity) {
		if(items.containsKey(itemId)) {
			CartItem existing = items.get(itemId);
			existing.setQuantity(quantity);
		}
	}

	public void deleteItem(int itemId) {
		items.remove(itemId);
	}

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}
