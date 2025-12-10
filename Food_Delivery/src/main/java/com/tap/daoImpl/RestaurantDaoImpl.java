package com.tap.daoImpl;

import com.tap.dao.RestaurantDAO;
import com.tap.model.Restaurant;
import com.tap.util.DBConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class RestaurantDaoImpl implements RestaurantDAO {

    // SQL Queries
    private static final String INSERT =
            "INSERT INTO restaurant (restaurantName, address, rating, cuisine, deliveryTime, isActive, imageUrl, adminUserId) " +
            "VALUES (?, ?, ?, ?, ?, ?, ?, ?)";

    private static final String SELECT_BY_ID =
            "SELECT * FROM restaurant WHERE restaurantId = ?";

    private static final String SELECT_ALL =
            "SELECT * FROM restaurant";

    private static final String UPDATE =
            "UPDATE restaurant SET restaurantName=?, address=?, rating=?, cuisine=?, deliveryTime=?, isActive=?, imageUrl=?, adminUserId=? " +
            "WHERE restaurantId=?";

    private static final String DELETE =
            "DELETE FROM restaurant WHERE restaurantId=?";
    

    // Add new restaurant
    @Override
    public void addRestaurant(Restaurant r) {
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(INSERT)) {

            ps.setString(1, r.getRestaurantName());
            ps.setString(2, r.getAddress());
            ps.setDouble(3, r.getRating());
            ps.setString(4, r.getCuisine());
            ps.setString(5, r.getDeliveryTime());
            ps.setBoolean(6, r.getIsActive());
            ps.setString(7, r.getImageUrl());
            ps.setInt(8, r.getAdminUserId());

            ps.executeUpdate();
            System.out.println("✔ Restaurant Added Successfully");
        } 
        catch (SQLException e) {
            e.printStackTrace();
        }
    }


    // Get restaurant by ID
    @Override
    public Restaurant getRestaurantById(int id) {
        Restaurant r = null;

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(SELECT_BY_ID)) {

            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                r = extractRestaurant(rs);
            }

        } 
        catch (SQLException e) {
            e.printStackTrace();
        }

        return r;
    }


    // Get all restaurants
    @Override
    public List<Restaurant> getAllRestaurants() {
        List<Restaurant> list = new ArrayList<>();

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(SELECT_ALL);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                list.add(extractRestaurant(rs));
            }

        } 
        catch (SQLException e) {
            e.printStackTrace();
        }

        return list;
    }


    // Update restaurant details
    @Override
    public void updateRestaurant(Restaurant r) {
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(UPDATE)) {

            ps.setString(1, r.getRestaurantName());
            ps.setString(2, r.getAddress());
            ps.setDouble(3, r.getRating());
            ps.setString(4, r.getCuisine());
            ps.setString(5, r.getDeliveryTime());
            ps.setBoolean(6, r.getIsActive());
            ps.setString(7, r.getImageUrl());
            ps.setInt(8, r.getAdminUserId());
            ps.setInt(9, r.getRestaurantId());

            int rows = ps.executeUpdate();
            System.out.println(rows > 0 ? "✔ Restaurant Updated" : "❌ Restaurant Not Found");

        } 
        catch (SQLException e) {
            e.printStackTrace();
        }
    }


    // Delete restaurant
    @Override
    public void deleteRestaurant(int id) {
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(DELETE)) {

            ps.setInt(1, id);
            int rows = ps.executeUpdate();

            System.out.println(rows > 0 ? "🗑 Restaurant Deleted" : "❌ Restaurant Not Found");

        } 
        catch (SQLException e) {
            e.printStackTrace();
        }
    }


    // Extract Restaurant object from ResultSet
    private Restaurant extractRestaurant(ResultSet rs) throws SQLException {
        return new Restaurant(
                rs.getInt("restaurantId"),
                rs.getString("restaurantName"),
                rs.getString("address"),
                rs.getDouble("rating"),
                rs.getString("cuisine"),
                rs.getString("deliveryTime"),
                rs.getBoolean("isActive"),
                rs.getString("imageUrl"),
                rs.getInt("adminUserId")
        );
    }
}
