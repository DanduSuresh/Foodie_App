package com.tap.dao;

import com.tap.model.MenuItem;
import java.util.List;

public interface MenuItemDAO {

    void addMenuItem(MenuItem item);
    MenuItem getMenuItemById(int id);
    List<MenuItem> getMenuByRestaurant(int restaurantId);
    void updateMenuItem(MenuItem item);
    void deleteMenuItem(int id);
}
