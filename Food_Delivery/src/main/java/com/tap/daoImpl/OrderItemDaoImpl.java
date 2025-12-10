package com.tap.daoImpl;

import com.tap.dao.OrderItemDAO;
import com.tap.model.OrderItem;
import com.tap.util.DBConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class OrderItemDaoImpl implements OrderItemDAO {

	private static final String INSERT = "INSERT INTO orderitems (orderId, menuId, quantity, unit_price) VALUES (?, ?, ?, ?)";

	private static final String SELECT_BY_ORDER_ID = "SELECT * FROM orderitems WHERE orderId = ?";

	private static final String SELECT_ALL = "SELECT OrderItemId, orderId, menuId, quantity, unit_price FROM orderitems";

	private static final String UPDATE = "UPDATE orderitems SET quantity = ? WHERE orderId = ?";

	private static final String DELETE = "DELETE FROM orderitems WHERE orderId = ?";

	@Override
	public void addOrderItem(OrderItem item) {
		try (Connection con = DBConnection.getConnection(); PreparedStatement ps = con.prepareStatement(INSERT)) {

			ps.setInt(1, item.getOrderId());
			ps.setInt(2, item.getMenuId()); // FIXED: menuId inserted
			ps.setInt(3, item.getQuantity());
			ps.setDouble(4, item.getUnitPrice());

			ps.executeUpdate();
			System.out.println("✔ Order Item Added");

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public OrderItem getOrderItemByOrderId(int orderId) {
		OrderItem item = null;

		try (Connection con = DBConnection.getConnection();
				PreparedStatement ps = con.prepareStatement(SELECT_BY_ORDER_ID)) {

			ps.setInt(1, orderId);
			ResultSet rs = ps.executeQuery();

			if (rs.next()) {
				item = new OrderItem(rs.getInt("OrderItemId"), rs.getInt("orderId"), rs.getInt("menuId"),
						rs.getInt("quantity"), rs.getDouble("unit_price"));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return item;
	}

	@Override
	public List<OrderItem> getAllOrderItems() {
		List<OrderItem> list = new ArrayList<>();

		try (Connection con = DBConnection.getConnection();
				PreparedStatement ps = con.prepareStatement(SELECT_ALL);
				ResultSet rs = ps.executeQuery()) {

			while (rs.next()) {

				OrderItem item = new OrderItem(rs.getInt("OrderItemId"), rs.getInt("orderId"), rs.getInt("menuId"),
						rs.getInt("quantity"), rs.getDouble("unit_price"));

				list.add(item);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return list;
	}

	@Override
	public void updateOrderItem(OrderItem item) {
		try (Connection con = DBConnection.getConnection(); PreparedStatement ps = con.prepareStatement(UPDATE)) {

			ps.setInt(1, item.getQuantity());
			ps.setInt(2, item.getOrderId());

			int updated = ps.executeUpdate();
			System.out.println(updated > 0 ? "✔ Order Item Updated" : "❌ Not Found");

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public void deleteOrderItem(int orderId) {
		try (Connection con = DBConnection.getConnection(); PreparedStatement ps = con.prepareStatement(DELETE)) {

			ps.setInt(1, orderId);
			int deleted = ps.executeUpdate();

			System.out.println(deleted > 0 ? "🗑 Order Item Deleted" : "❌ Not Found");

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
