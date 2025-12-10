package com.tap.servlet;

import java.io.IOException;
import java.util.List;

import com.tap.daoImpl.RestaurantDaoImpl;
import com.tap.model.Restaurant;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/restaurant")
public class RestaurantServlet extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		RestaurantDaoImpl impl = new RestaurantDaoImpl();
		List<Restaurant> allRestaurants = impl.getAllRestaurants();
		req.setAttribute("allRestaurants", allRestaurants);
		
		RequestDispatcher rd = req.getRequestDispatcher("restaurants.jsp");
		rd.forward(req, resp);
	}
	

}
