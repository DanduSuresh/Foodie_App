package com.tap.servlet;

import java.io.IOException;
import java.util.List;

import com.tap.daoImpl.OrderItemDaoImpl;
import com.tap.model.OrderItem;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/orderitems")
public class OrderItemsServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        int orderId = Integer.parseInt(req.getParameter("orderId"));

        OrderItemDaoImpl dao = new OrderItemDaoImpl();
        List<OrderItem> items = dao.getAllOrderItems();

        req.setAttribute("orderId", orderId);
        req.setAttribute("orderItems", items);

        req.getRequestDispatcher("orderitems.jsp").forward(req, resp);
    }
}
