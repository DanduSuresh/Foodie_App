package com.tap.daoImpl;

import com.tap.dao.MenuItemDAO;
import com.tap.model.MenuItem;
import com.tap.util.DBConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class MenuItemDaoImpl implements MenuItemDAO {

	private static final String INSERT = "INSERT INTO menu (menuName, price, isAvailable, description, imageUrl, restaurantId) VALUES (?, ?, ?, ?, ?, ?)";

	private static final String SELECT_BY_ID = "SELECT * FROM menu WHERE menuId = ?";

	private static final String SELECT_BY_RESTAURANT = "SELECT * FROM menu WHERE restaurantId = ?";;

	private static final String UPDATE = "UPDATE menu SET menuName=?, price=?, isAvailable=?, description=?, imageUrl=? WHERE menuId=?";

	private static final String DELETE = "DELETE FROM menu WHERE menuId=?";

	@Override
	public void addMenuItem(MenuItem item) {
		try (Connection con = DBConnection.getConnection(); PreparedStatement ps = con.prepareStatement(INSERT)) {

			ps.setString(1, item.getMenuName());
			ps.setDouble(2, item.getPrice());
			ps.setBoolean(3, item.isAvailable());
			ps.setString(4, item.getDescription());
			ps.setString(5, item.getImageUrl());
			ps.setInt(6, item.getRestaurantId());

			ps.executeUpdate();
			System.out.println("✔ Menu Item Added");

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public MenuItem getMenuItemById(int id) {
		MenuItem item = null;

		try (Connection con = DBConnection.getConnection(); PreparedStatement ps = con.prepareStatement(SELECT_BY_ID)) {

			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();

			if (rs.next()) {
				item = extractMenuItem(rs);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return item;
	}

	@Override
	public List<MenuItem> getMenuByRestaurant(int restaurantId) {
		List<MenuItem> list = new ArrayList<>();

		try (Connection con = DBConnection.getConnection();
				PreparedStatement ps = con.prepareStatement(SELECT_BY_RESTAURANT)) {

			ps.setInt(1, restaurantId);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				list.add(extractMenuItem(rs));
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	@Override
	public void updateMenuItem(MenuItem item) {
		try (Connection con = DBConnection.getConnection(); PreparedStatement ps = con.prepareStatement(UPDATE)) {

			ps.setString(1, item.getMenuName());
			ps.setDouble(2, item.getPrice());
			ps.setBoolean(3, item.isAvailable());
			ps.setString(4, item.getDescription());
			ps.setString(5, item.getImageUrl());
			ps.setInt(6, item.getMenuId());

			ps.executeUpdate();
			System.out.println("✔ Menu Item Updated");

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void deleteMenuItem(int id) {
		try (Connection con = DBConnection.getConnection(); PreparedStatement ps = con.prepareStatement(DELETE)) {

			ps.setInt(1, id);
			ps.executeUpdate();
			System.out.println("✔ Menu Item Deleted");

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	private MenuItem extractMenuItem(ResultSet rs) throws SQLException {
	    return new MenuItem(
	            rs.getInt("menuId"),
	            rs.getInt("restaurantId"),
	            rs.getString("menuName"),
	            rs.getString("description"),
	            rs.getDouble("price"),
	            rs.getString("imageUrl"),
	            rs.getBoolean("isAvailable")
	    );
	}


}
