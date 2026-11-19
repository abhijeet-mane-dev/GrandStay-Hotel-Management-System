package com.hotel.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hotel.dao.CustomerDAO;
import com.hotel.model.Customer;

@WebServlet("/customer/update")
public class CustomerUpdateServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("id"));

        String name = request.getParameter("name");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        String idProof = request.getParameter("idProof");

        Customer customer = new Customer();

        customer.setId(id);
        customer.setName(name);
        customer.setPhone(phone);
        customer.setEmail(email);
        customer.setAddress(address);
        customer.setIdProof(idProof);

        CustomerDAO customerDAO = new CustomerDAO();

        boolean result = customerDAO.updateCustomer(customer);

        if (result) {
            response.sendRedirect("../customer");
        } else {
            response.getWriter().println("Customer update failed.");
        }
    }
}