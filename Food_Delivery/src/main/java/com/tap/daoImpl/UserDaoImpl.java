package com.tap.daoImpl;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.tap.dao.UserDAO;
import com.tap.model.User;
import com.tap.util.DBConnection;

public class UserDaoImpl implements UserDAO {

    // QUERIES
    private static final String INSERT_QUERY =
            "INSERT INTO user (userName, email, phoneNumber, password, address, role) VALUES (?, ?, ?, ?, ?, ?)";

    private static final String GET_USER =
            "SELECT * FROM user WHERE userId = ?";

    private static final String GET_USER_BY_EMAIL =
            "SELECT * FROM user WHERE email = ?";

    private static final String SELECT_ALL_USERS =
            "SELECT * FROM user";

    private static final String UPDATE_USER =
            "UPDATE user SET userName = ?, email = ?, phoneNumber = ?, password = ?, address = ?, role = ? WHERE userId = ?";

    private static final String LOGIN_QUERY =
            "SELECT * FROM user WHERE email = ? AND password = ?";

    private static final String DELETE_USER =
            "DELETE FROM user WHERE userId = ?";


    // ------------------------- ADD USER -------------------------
    @Override
    public void addUser(User user) {
        try (Connection con = DBConnection.getConnection();
             PreparedStatement pstmt = con.prepareStatement(INSERT_QUERY)) {

            pstmt.setString(1, user.getUserName());
            pstmt.setString(2, user.getEmail());
            pstmt.setString(3, user.getPhoneNumber());
            pstmt.setString(4, user.getPassWord());
            pstmt.setString(5, user.getAddress());
            pstmt.setString(6, user.getRole());

            pstmt.executeUpdate();
            System.out.println("✅ User Added Successfully!");

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }


    // ------------------------- GET USER BY ID -------------------------
    @Override
    public User getUser(int id) {

        User user = null;

        try (Connection con = DBConnection.getConnection();
             PreparedStatement pstmt = con.prepareStatement(GET_USER)) {

            pstmt.setInt(1, id);
            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
                user = mapResultSetToUser(rs);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return user;
    }


    // ------------------------- GET USER BY EMAIL -------------------------
    @Override
    public User getUserByEmail(String email) {

        User user = null;

        try (Connection con = DBConnection.getConnection();
             PreparedStatement pstmt = con.prepareStatement(GET_USER_BY_EMAIL)) {

            pstmt.setString(1, email);
            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
                user = mapResultSetToUser(rs);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return user;
    }


    // ------------------------- GET ALL USERS -------------------------
    @Override
    public List<User> getAllUser() {

        List<User> list = new ArrayList<>();

        try (Connection con = DBConnection.getConnection();
             PreparedStatement pstmt = con.prepareStatement(SELECT_ALL_USERS);
             ResultSet rs = pstmt.executeQuery()) {

            while (rs.next()) {
                list.add(mapResultSetToUser(rs));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return list;
    }


    // ------------------------- UPDATE USER -------------------------
    @Override
    public boolean updateUser(User user) {

        try (Connection con = DBConnection.getConnection();
             PreparedStatement pstmt = con.prepareStatement(UPDATE_USER)) {

            pstmt.setString(1, user.getUserName());
            pstmt.setString(2, user.getEmail());
            pstmt.setString(3, user.getPhoneNumber());
            pstmt.setString(4, user.getPassWord());
            pstmt.setString(5, user.getAddress());
            pstmt.setString(6, user.getRole());
            pstmt.setInt(7, user.getUserId());

            int rows = pstmt.executeUpdate();

            return rows > 0;

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }


    // ------------------------- LOGIN USER -------------------------
    @Override
    public User loginUser(String email, String password) {

        User user = null;

        try (Connection con = DBConnection.getConnection();
             PreparedStatement pstmt = con.prepareStatement(LOGIN_QUERY)) {

            pstmt.setString(1, email);
            pstmt.setString(2, password);

            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
                user = mapResultSetToUser(rs);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return user;
    }


    // ------------------------- DELETE USER -------------------------
    @Override
    public void deleteUser(int userId) {

        try (Connection con = DBConnection.getConnection();
             PreparedStatement pstmt = con.prepareStatement(DELETE_USER)) {

            pstmt.setInt(1, userId);

            int rows = pstmt.executeUpdate();

            if (rows > 0) {
                System.out.println("✅ User Deleted Successfully!");
            } else {
                System.out.println("❌ No User Found with ID: " + userId);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }


    // ------------------------- MAPPING METHOD -------------------------
    private User mapResultSetToUser(ResultSet rs) throws SQLException {
        return new User(
                rs.getInt("userId"),
                rs.getString("userName"),
                rs.getString("email"),
                rs.getString("phoneNumber"),
                rs.getString("password"),
                rs.getString("address"),
                rs.getString("role")
        );
    }
}
