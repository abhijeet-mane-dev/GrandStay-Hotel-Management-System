package com.hotel.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hotel.dao.CustomerDAO;
import com.hotel.model.Customer;

@WebServlet("/customer")
public class CustomerServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;


    // =====================================================
    // ADD / UPDATE CUSTOMER
    // =====================================================

    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        try {

            String idParam =
                    request.getParameter("id");

            String name =
                    request.getParameter("name");

            String phone =
                    request.getParameter("phone");

            String email =
                    request.getParameter("email");

            String address =
                    request.getParameter("address");

            String idProof =
                    request.getParameter("idProof");

            String idProofNumber =
                    request.getParameter("idProofNumber");


            // =====================================================
            // TRIM DATA
            // =====================================================

            if (name != null) {
                name = name.trim();
            }

            if (phone != null) {
                phone = phone.trim();
            }

            if (email != null) {
                email = email.trim();
            }

            if (address != null) {
                address = address.trim();
            }

            if (idProof != null) {
                idProof = idProof.trim();
            }

            if (idProofNumber != null) {
                idProofNumber = idProofNumber.trim();
            }


            // =====================================================
            // BASIC VALIDATION
            // =====================================================

            if (name == null || name.isEmpty()) {

                sendError(
                        request,
                        response,
                        "Customer name is required."
                );

                return;
            }


            if (phone == null || phone.isEmpty()) {

                sendError(
                        request,
                        response,
                        "Phone number is required."
                );

                return;
            }


            if (idProof == null || idProof.isEmpty()) {

                sendError(
                        request,
                        response,
                        "ID proof is required."
                );

                return;
            }


            if (idProofNumber == null ||
                idProofNumber.isEmpty()) {

                sendError(
                        request,
                        response,
                        "ID proof number is required."
                );

                return;
            }


            // =====================================================
            // CREATE CUSTOMER OBJECT
            // =====================================================

            Customer customer =
                    new Customer();

            customer.setName(name);
            customer.setPhone(phone);
            customer.setEmail(email);
            customer.setAddress(address);
            customer.setIdProof(idProof);
            customer.setIdProofNumber(idProofNumber);


            CustomerDAO customerDAO =
                    new CustomerDAO();


            boolean result;


            // =====================================================
            // UPDATE CUSTOMER
            // =====================================================

            if (idParam != null &&
                !idParam.trim().isEmpty()) {

                int id =
                        Integer.parseInt(idParam);

                customer.setId(id);

                result =
                        customerDAO.updateCustomer(customer);

            }

            // =====================================================
            // ADD CUSTOMER
            // =====================================================

            else {

                result =
                        customerDAO.addCustomer(customer);

            }


            // =====================================================
            // SUCCESS
            // =====================================================

            if (result) {

                response.sendRedirect(
                        request.getContextPath()
                        + "/customer"
                );

            }

            // =====================================================
            // FAILED
            // =====================================================

            else {

                sendError(
                        request,
                        response,
                        "Customer operation failed."
                );
            }


        } catch (Exception e) {

            e.printStackTrace();

            sendError(
                    request,
                    response,
                    "Invalid customer details."
            );
        }
    }


    // =====================================================
    // GET REQUEST
    // =====================================================

    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {


        String action =
                request.getParameter("action");


        // =====================================================
        // EDIT CUSTOMER
        // =====================================================

        if ("edit".equals(action)) {

            try {

                int id =
                        Integer.parseInt(
                                request.getParameter("id")
                        );

                CustomerDAO customerDAO =
                        new CustomerDAO();

                Customer customer =
                        customerDAO.getCustomerById(id);


                request.setAttribute(
                        "customer",
                        customer
                );


                request.getRequestDispatcher(
                        "/customer-edit.jsp"
                ).forward(
                        request,
                        response
                );

                return;


            } catch (Exception e) {

                e.printStackTrace();

                response.sendRedirect(
                        request.getContextPath()
                        + "/customer"
                );

                return;
            }
        }


        // =====================================================
        // DELETE CUSTOMER
        // =====================================================

        if ("delete".equals(action)) {

            try {

                int id =
                        Integer.parseInt(
                                request.getParameter("id")
                        );

                CustomerDAO customerDAO =
                        new CustomerDAO();

                customerDAO.deleteCustomer(id);

            } catch (Exception e) {

                e.printStackTrace();
            }


            response.sendRedirect(
                    request.getContextPath()
                    + "/customer"
            );

            return;
        }


        // =====================================================
        // CUSTOMER LIST
        // =====================================================

        CustomerDAO customerDAO =
                new CustomerDAO();

        List<Customer> customers =
                customerDAO.getAllCustomers();


        request.setAttribute(
                "customers",
                customers
        );


        request.getRequestDispatcher(
                "/customer-list.jsp"
        ).forward(
                request,
                response
        );
    }


    // =====================================================
    // ERROR HANDLER
    // =====================================================

    private void sendError(
            HttpServletRequest request,
            HttpServletResponse response,
            String message)
            throws ServletException, IOException {


        request.setAttribute(
                "error",
                message
        );


        request.getRequestDispatcher(
                "/customers.jsp"
        ).forward(
                request,
                response
        );
    }
}