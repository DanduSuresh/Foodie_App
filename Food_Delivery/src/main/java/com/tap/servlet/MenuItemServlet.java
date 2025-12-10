
package com.tap.servlet;
import java.io.IOException;
import java.util.List;

import com.tap.daoImpl.MenuItemDaoImpl;
import com.tap.model.MenuItem;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/menu")
public class MenuItemServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String rid = req.getParameter("restaurantId");

        if (rid == null) {
            resp.getWriter().println("❌ restaurantId missing");
            return;
        }

        int restaurantId = Integer.parseInt(rid);

        MenuItemDaoImpl dao = new MenuItemDaoImpl();
        List<MenuItem> menuList = dao.getMenuByRestaurant(restaurantId);

        req.setAttribute("menuList", menuList);
        RequestDispatcher rd = req.getRequestDispatcher("menu.jsp");
        rd.forward(req, resp);
    }
}
