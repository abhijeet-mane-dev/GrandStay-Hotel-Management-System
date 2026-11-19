package com.hotel.controller;

import java.io.IOException;
import java.sql.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hotel.dao.PaymentDAO;
import com.hotel.dao.BookingDAO;
import com.hotel.model.Payment;
import com.hotel.model.Booking;

@WebServlet("/payment")
public class PaymentServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    // =========================
    // ADD / UPDATE PAYMENT
    // =========================

    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        try {

            String idParam = request.getParameter("id");

            int bookingId = Integer.parseInt(
                    request.getParameter("bookingId"));

            double amount = Double.parseDouble(
                    request.getParameter("amount"));

            String paymentMethod =
                    request.getParameter("paymentMethod");

            String paymentStatus =
                    request.getParameter("paymentStatus");

            Date paymentDate = Date.valueOf(
                    request.getParameter("paymentDate"));

            Payment payment = new Payment();

            payment.setBookingId(bookingId);
            payment.setAmount(amount);
            payment.setPaymentMethod(paymentMethod);
            payment.setPaymentStatus(paymentStatus);
            payment.setPaymentDate(paymentDate);

            PaymentDAO paymentDAO =
                    new PaymentDAO();

            boolean result;

            // UPDATE
            if (idParam != null && !idParam.isEmpty()) {

                int id = Integer.parseInt(idParam);

                payment.setId(id);

                result = paymentDAO.updatePayment(payment);

            }

            // ADD
            else {

                result = paymentDAO.addPayment(payment);
            }


            if (result) {

                response.sendRedirect(
                        request.getContextPath()
                        + "/payment"
                );

            } else {

                loadBookingData(request);

                request.setAttribute(
                        "error",
                        "Payment operation failed."
                );

                request.getRequestDispatcher(
                        "/payment.jsp"
                ).forward(request, response);
            }

        } catch (Exception e) {

            e.printStackTrace();

            loadBookingData(request);

            request.setAttribute(
                    "error",
                    "Invalid payment details."
            );

            request.getRequestDispatcher(
                    "/payment.jsp"
            ).forward(request, response);
        }
    }


    // =========================
    // LIST / NEW / EDIT
    // =========================

    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        String action =
                request.getParameter("action");


        // =========================
        // NEW PAYMENT
        // =========================

        if ("new".equals(action)) {

            loadBookingData(request);

            request.getRequestDispatcher(
                    "/payment.jsp"
            ).forward(request, response);

            return;
        }


        // =========================
        // EDIT PAYMENT
        // =========================

        if ("edit".equals(action)) {

            try {

                int id = Integer.parseInt(
                        request.getParameter("id"));

                PaymentDAO paymentDAO =
                        new PaymentDAO();

                Payment payment =
                        paymentDAO.getPaymentById(id);

                loadBookingData(request);

                request.setAttribute(
                        "payment",
                        payment
                );

                request.getRequestDispatcher(
                        "/payment-edit.jsp"
                ).forward(request, response);

                return;

            } catch (Exception e) {

                e.printStackTrace();

                response.sendRedirect(
                        request.getContextPath()
                        + "/payment"
                );

                return;
            }
        }


        // =========================
        // DELETE PAYMENT
        // =========================

        if ("delete".equals(action)) {

            try {

                int id = Integer.parseInt(
                        request.getParameter("id"));

                PaymentDAO paymentDAO =
                        new PaymentDAO();

                paymentDAO.deletePayment(id);

            } catch (Exception e) {

                e.printStackTrace();
            }

            response.sendRedirect(
                    request.getContextPath()
                    + "/payment"
            );

            return;
        }


        // =========================
        // PAYMENT LIST
        // =========================

        PaymentDAO paymentDAO =
                new PaymentDAO();

        List<Payment> payments =
                paymentDAO.getAllPayments();

        request.setAttribute(
                "payments",
                payments
        );

        request.getRequestDispatcher(
                "/payment-list.jsp"
        ).forward(request, response);
    }


    // =========================
    // LOAD BOOKINGS
    // =========================

    private void loadBookingData(
            HttpServletRequest request) {

        BookingDAO bookingDAO =
                new BookingDAO();

        List<Booking> bookings =
                bookingDAO.getAllBookings();

        request.setAttribute(
                "bookings",
                bookings
        );
    }
}