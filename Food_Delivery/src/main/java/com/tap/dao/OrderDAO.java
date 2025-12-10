package com.tap.dao;

import com.tap.model.Orders;
import java.util.List;

public interface OrderDAO {

    void addOrder(Orders order);
    Orders getOrderById(int id);
    List<Orders> getAllOrders();
    void updateOrder(Orders order);
    void deleteOrder(int id);
}
