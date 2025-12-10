package com.tap.servlet;

import java.io.IOException;
import com.tap.daoImpl.UserDaoImpl;
import com.tap.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/profile")
public class ProfileServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        HttpSession session = req.getSession(false);

        // If user not logged in
        if (session == null || session.getAttribute("email") == null) {
            resp.sendRedirect("login.jsp");
            return;
        }

        String email = (String) session.getAttribute("email");

        UserDaoImpl dao = new UserDaoImpl();
        User user = dao.getUserByEmail(email);

        req.setAttribute("user", user);
        req.getRequestDispatcher("profile.jsp").forward(req, resp);
    }
}
