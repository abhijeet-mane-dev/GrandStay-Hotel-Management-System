package com.hotel.controller;

import java.io.IOException;
import java.sql.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hotel.dao.BookingDAO;
import com.hotel.dao.InvoiceDAO;
import com.hotel.model.Booking;
import com.hotel.model.Invoice;

@WebServlet("/invoice")
public class InvoiceServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;


    // =========================
    // ADD / UPDATE INVOICE
    // =========================

    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        try {

            String idParam =
                    request.getParameter("id");

            int bookingId =
                    Integer.parseInt(
                            request.getParameter("bookingId"));

            String customerName =
                    request.getParameter("customerName");

            String roomNumber =
                    request.getParameter("roomNumber");

            Date checkIn =
                    Date.valueOf(
                            request.getParameter("checkIn"));

            Date checkOut =
                    Date.valueOf(
                            request.getParameter("checkOut"));

            double roomAmount =
                    Double.parseDouble(
                            request.getParameter("roomAmount"));

            double taxAmount =
                    Double.parseDouble(
                            request.getParameter("taxAmount"));

            double totalAmount =
                    Double.parseDouble(
                            request.getParameter("totalAmount"));

            String paymentStatus =
                    request.getParameter("paymentStatus");

            Date invoiceDate =
                    Date.valueOf(
                            request.getParameter("invoiceDate"));


            Invoice invoice = new Invoice();

            invoice.setBookingId(bookingId);
            invoice.setCustomerName(customerName);
            invoice.setRoomNumber(roomNumber);
            invoice.setCheckIn(checkIn);
            invoice.setCheckOut(checkOut);
            invoice.setRoomAmount(roomAmount);
            invoice.setTaxAmount(taxAmount);
            invoice.setTotalAmount(totalAmount);
            invoice.setPaymentStatus(paymentStatus);
            invoice.setInvoiceDate(invoiceDate);


            InvoiceDAO invoiceDAO =
                    new InvoiceDAO();

            boolean result;


            // =========================
            // UPDATE
            // =========================

            if (idParam != null &&
                !idParam.isEmpty()) {

                int id =
                        Integer.parseInt(idParam);

                invoice.setId(id);

                result =
                        invoiceDAO.updateInvoice(invoice);

            }

            // =========================
            // ADD
            // =========================

            else {

                result =
                        invoiceDAO.addInvoice(invoice);
            }


            if (result) {

                response.sendRedirect(
                        request.getContextPath()
                        + "/invoice"
                );

            } else {

                loadBookingData(request);

                request.setAttribute(
                        "error",
                        "Invoice operation failed."
                );

                request.getRequestDispatcher(
                        "/invoice.jsp"
                ).forward(request, response);
            }


        } catch (Exception e) {

            e.printStackTrace();

            loadBookingData(request);

            request.setAttribute(
                    "error",
                    "Invalid invoice details."
            );

            request.getRequestDispatcher(
                    "/invoice.jsp"
            ).forward(request, response);
        }
    }


    // =========================
    // LIST / NEW / EDIT / DELETE
    // =========================

    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        String action =
                request.getParameter("action");


        // =========================
        // NEW INVOICE
        // =========================

        if ("new".equals(action)) {

            loadBookingData(request);

            request.getRequestDispatcher(
                    "/invoice.jsp"
            ).forward(request, response);

            return;
        }


        // =========================
        // EDIT INVOICE
        // =========================

        if ("edit".equals(action)) {

            try {

                int id =
                        Integer.parseInt(
                                request.getParameter("id"));

                InvoiceDAO invoiceDAO =
                        new InvoiceDAO();

                Invoice invoice =
                        invoiceDAO.getInvoiceById(id);

                loadBookingData(request);

                request.setAttribute(
                        "invoice",
                        invoice
                );

                request.getRequestDispatcher(
                        "/invoice-edit.jsp"
                ).forward(request, response);

                return;

            } catch (Exception e) {

                e.printStackTrace();

                response.sendRedirect(
                        request.getContextPath()
                        + "/invoice"
                );

                return;
            }
        }


        // =========================
        // DELETE INVOICE
        // =========================

        if ("delete".equals(action)) {

            try {

                int id =
                        Integer.parseInt(
                                request.getParameter("id"));

                InvoiceDAO invoiceDAO =
                        new InvoiceDAO();

                invoiceDAO.deleteInvoice(id);

            } catch (Exception e) {

                e.printStackTrace();
            }

            response.sendRedirect(
                    request.getContextPath()
                    + "/invoice"
            );

            return;
        }


        // =========================
        // INVOICE LIST
        // =========================

        InvoiceDAO invoiceDAO =
                new InvoiceDAO();

        List<Invoice> invoices =
                invoiceDAO.getAllInvoices();

        request.setAttribute(
                "invoices",
                invoices
        );

        request.getRequestDispatcher(
                "/invoice-list.jsp"
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