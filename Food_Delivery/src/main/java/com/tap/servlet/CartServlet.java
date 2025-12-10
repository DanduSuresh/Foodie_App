package com.tap.servlet;

import java.io.IOException;

import com.tap.daoImpl.MenuItemDaoImpl;
import com.tap.model.Cart;
import com.tap.model.CartItem;
import com.tap.model.MenuItem;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/cart")
public class CartServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        HttpSession session = req.getSession();

        Cart cart = (Cart) session.getAttribute("cart");
        Integer oldRestaurantId = (Integer) session.getAttribute("oldRestaurantId");

        if (oldRestaurantId == null) {
            oldRestaurantId = -1;
        }

        String action = req.getParameter("action");

        if (action.equals("add")) {

            int newRestaurantId = Integer.parseInt(req.getParameter("restaurantId"));

            if (cart == null || oldRestaurantId != newRestaurantId) {
                cart = new Cart();
                session.setAttribute("cart", cart);
                session.setAttribute("oldRestaurantId", newRestaurantId);
            }

            addItemToCart(req, cart);
        }
        else if (action.equals("update")) {
            updateItemToCart(req, cart);
        }
        else if (action.equals("delete")) {
            deleteItemToCart(req, cart);
        }

        resp.sendRedirect("cart.jsp");
    }

    private void addItemToCart(HttpServletRequest req, Cart cart) {

        int menuId = Integer.parseInt(req.getParameter("menuId"));
        int quantity = Integer.parseInt(req.getParameter("quantity"));

        MenuItemDaoImpl menuItemDaoImpl = new MenuItemDaoImpl();
        MenuItem menu = menuItemDaoImpl.getMenuItemById(menuId);

        CartItem cartItem = new CartItem(menuId, menu.getMenuName(), quantity, menu.getPrice());
        cart.addItem(cartItem);
    }

    private void updateItemToCart(HttpServletRequest req, Cart cart) {
        int menuId = Integer.parseInt(req.getParameter("menuId"));
        int quantity = Integer.parseInt(req.getParameter("quantity"));

        cart.updateItem(menuId, quantity);
    }

    private void deleteItemToCart(HttpServletRequest req, Cart cart) {
        int menuId = Integer.parseInt(req.getParameter("menuId"));
        cart.deleteItem(menuId);
    }
}
