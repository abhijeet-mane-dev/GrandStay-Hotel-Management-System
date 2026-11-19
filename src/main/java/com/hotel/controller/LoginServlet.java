package com.hotel.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.hotel.dao.UserDAO;
import com.hotel.model.User;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        UserDAO userDAO = new UserDAO();

        User user = userDAO.login(username, password);

        if (user != null) {

            HttpSession session = request.getSession();

            session.setAttribute("user", user);

            response.sendRedirect(
                    request.getContextPath() + "/dashboard.jsp"
            );

        } else {

            request.setAttribute(
                    "error",
                    "Invalid username or password"
            );

            request.getRequestDispatcher(
                    "/login.jsp"
            ).forward(request, response);
        }
    }
}