package com.tap.dao;

import com.tap.model.Restaurant;
import java.util.List;

public interface RestaurantDAO {
    void addRestaurant(Restaurant r);
    Restaurant getRestaurantById(int id);
    List<Restaurant> getAllRestaurants();
    void updateRestaurant(Restaurant r);
    void deleteRestaurant(int id);
}
