package com.tap.servlet;

import java.io.IOException;

import com.tap.daoImpl.UserDaoImpl;
import com.tap.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/updateProfile")
public class UserRegistrationServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        HttpSession session = req.getSession();

        // Get Updated Form Inputs
        String username = req.getParameter("userName");
        String email = req.getParameter("email");
        String phone = req.getParameter("phoneNumber");
        String address = req.getParameter("address");
        String role = req.getParameter("role");

        // Create User object
        User user = new User(username, email, phone, null, address, role);

        UserDaoImpl dao = new UserDaoImpl();
        boolean updated = dao.updateUser(user);

        if (updated) {

            // Update session values
            session.setAttribute("userName", username);
            session.setAttribute("email", email);
            session.setAttribute("phoneNumber", phone);
            session.setAttribute("address", address);
            session.setAttribute("role", role);

            resp.sendRedirect("profile.jsp");
        } else {
            resp.getWriter().println("Profile Update Failed. Try Again!");
        }
    }
}
