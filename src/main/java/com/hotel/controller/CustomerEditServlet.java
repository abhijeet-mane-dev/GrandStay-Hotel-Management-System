package com.hotel.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hotel.dao.CustomerDAO;
import com.hotel.model.Customer;

@WebServlet("/customer/edit")
public class CustomerEditServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("id"));

        CustomerDAO customerDAO = new CustomerDAO();

        Customer customer = customerDAO.getCustomerById(id);

        if (customer != null) {

            request.setAttribute("customer", customer);

            // IMPORTANT: JSP is in src/main/webapp root
            request.getRequestDispatcher("/customer-edit.jsp")
                   .forward(request, response);

        } else {

            response.getWriter().println("Customer not found.");
        }
    }
}