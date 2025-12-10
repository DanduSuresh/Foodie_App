package com.tap.servlet;

import java.io.IOException;
import com.tap.daoImpl.UserDaoImpl;
import com.tap.model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/login")
public class UserLoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws IOException, ServletException {

        HttpSession session = req.getSession();
        Integer attempts = (Integer) session.getAttribute("attempts");

        if (attempts == null) attempts = 3;
        if (attempts == 0) {
            resp.sendRedirect("blocked.jsp");
            return;
        }

        String email = req.getParameter("email");
        String password = req.getParameter("password");

        UserDaoImpl dao = new UserDaoImpl();
        User user = dao.loginUser(email, password);

        if (user != null) {

            session.setAttribute("user", user);
            session.setAttribute("userName", user.getUserName());
            session.setAttribute("userId", user.getUserId());
            session.setAttribute("email", user.getEmail());   // ⭐ MUST ADD THIS

            session.setAttribute("attempts", 3);

            resp.sendRedirect("home.jsp");
        } 
        else {

            attempts--;
            session.setAttribute("attempts", attempts);

            req.setAttribute("error", "Invalid Email/Password. Attempts left: " + attempts);
            req.getRequestDispatcher("login.jsp").forward(req, resp);
        }
    }
}
