package com.tap.servlet;

import java.io.IOException;
import java.util.List;

import com.tap.daoImpl.OrderDaoImpl;
import com.tap.model.Orders;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/myorders")
public class MyOrdersServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        HttpSession session = req.getSession();
        Integer userId = (Integer) session.getAttribute("userId");

        if (userId == null) {
            resp.sendRedirect("login.jsp");
            return;
        }

        OrderDaoImpl dao = new OrderDaoImpl();
        List<Orders> list = dao.getAllOrders(); // (Later we filter by user)

        req.setAttribute("myOrders", list);
        req.getRequestDispatcher("orders.jsp").forward(req, resp);
    }
}
