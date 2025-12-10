package com.tap.daoImpl;

import com.tap.dao.OrderDAO;
import com.tap.model.Orders;
import com.tap.util.DBConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class OrderDaoImpl implements OrderDAO {

	private static final String INSERT = "INSERT INTO orders (orderDate, restaurantId, userId, totalAmount, paymentMethod, status, deliveryAddress) "
			+ "VALUES (NOW(), ?, ?, ?, ?, ?, ?)";

	private static final String SELECT_BY_ID = "SELECT * FROM orders WHERE orderId = ?";

	private static final String SELECT_ALL = "SELECT * FROM orders";

	private static final String UPDATE = "UPDATE orders SET restaurantId=?, userId=?, totalAmount=?, paymentMethod=?, status=?, deliveryAddress=? WHERE orderId=?";

	private static final String DELETE = "DELETE FROM orders WHERE orderId=?";

	@Override
	public void addOrder(Orders order) {
		try (Connection con = DBConnection.getConnection(); PreparedStatement ps = con.prepareStatement(INSERT)) {

			ps.setInt(1, order.getRestaurantId());
			ps.setInt(2, order.getUserId());
			ps.setDouble(3, order.getTotalAmount());
			ps.setString(4, order.getPaymentMethod());
			ps.setString(5, order.getStatus());
			ps.setString(6, order.getDeliveryAddress());

			ps.executeUpdate();
			System.out.println("✔ Order Added");

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public Orders getOrderById(int id) {
		Orders order = null;

		try (Connection con = DBConnection.getConnection(); PreparedStatement ps = con.prepareStatement(SELECT_BY_ID)) {

			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();

			if (rs.next()) {
				order = new Orders(rs.getInt("orderId"), rs.getString("orderDate"), rs.getInt("restaurantId"),
						rs.getInt("userId"), rs.getDouble("totalAmount"), rs.getString("paymentMethod"),
						rs.getString("status"), rs.getString("deliveryAddress"));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return order;
	}

	@Override
	public List<Orders> getAllOrders() {
		List<Orders> list = new ArrayList<>();

		try (Connection con = DBConnection.getConnection();
				PreparedStatement ps = con.prepareStatement(SELECT_ALL);
				ResultSet rs = ps.executeQuery()) {

			while (rs.next()) {
				Orders order = new Orders(rs.getInt("orderId"), rs.getString("orderDate"), rs.getInt("restaurantId"),
						rs.getInt("userId"), rs.getDouble("totalAmount"), rs.getString("paymentMethod"),
						rs.getString("status"), rs.getString("deliveryAddress"));
				list.add(order);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return list;
	}

	@Override
	public void updateOrder(Orders order) {
		try (Connection con = DBConnection.getConnection(); PreparedStatement ps = con.prepareStatement(UPDATE)) {

			ps.setInt(1, order.getRestaurantId());
			ps.setInt(2, order.getUserId());
			ps.setDouble(3, order.getTotalAmount());
			ps.setString(4, order.getPaymentMethod());
			ps.setString(5, order.getStatus());
			ps.setString(6, order.getDeliveryAddress());
			ps.setInt(7, order.getOrderId());

			int updated = ps.executeUpdate();
			System.out.println(updated > 0 ? "✔ Order Updated" : "❌ Not Found");

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public void deleteOrder(int id) {
		try (Connection con = DBConnection.getConnection(); PreparedStatement ps = con.prepareStatement(DELETE)) {

			ps.setInt(1, id);
			int deleted = ps.executeUpdate();

			System.out.println(deleted > 0 ? "🗑 Order Deleted" : "❌ Not Found");

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
