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
import com.hotel.dao.CustomerDAO;
import com.hotel.dao.RoomDAO;
import com.hotel.model.Booking;
import com.hotel.model.Customer;
import com.hotel.model.Room;

@WebServlet("/booking")
public class BookingServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;


    // =====================================================
    // CREATE BOOKING
    // =====================================================

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        try {

            int customerId = Integer.parseInt(
                    request.getParameter("customerId"));

            int roomId = Integer.parseInt(
                    request.getParameter("roomId"));

            Date checkIn = Date.valueOf(
                    request.getParameter("checkIn"));

            Date checkOut = Date.valueOf(
                    request.getParameter("checkOut"));

            String status = request.getParameter("status");

            double totalAmount = Double.parseDouble(
                    request.getParameter("totalAmount"));


            BookingDAO bookingDAO = new BookingDAO();


            // Check Room Availability

            boolean available =
                    bookingDAO.isRoomAvailable(
                            roomId,
                            checkIn,
                            checkOut
                    );


            if (!available) {

                request.setAttribute(
                        "error",
                        "Room is not available for the selected dates."
                );

                loadBookingFormData(request);

                request.getRequestDispatcher(
                        "/booking.jsp"
                ).forward(request, response);

                return;
            }


            // Create Booking

            Booking booking = new Booking();

            booking.setCustomerId(customerId);
            booking.setRoomId(roomId);
            booking.setCheckIn(checkIn);
            booking.setCheckOut(checkOut);
            booking.setStatus(status);
            booking.setTotalAmount(totalAmount);


            // Save Booking

            boolean result =
                    bookingDAO.addBooking(booking);


            if (result) {

                response.sendRedirect(
                        request.getContextPath() + "/booking"
                );

            } else {

                request.setAttribute(
                        "error",
                        "Booking could not be added."
                );

                loadBookingFormData(request);

                request.getRequestDispatcher(
                        "/booking.jsp"
                ).forward(request, response);
            }


        } catch (Exception e) {

            e.printStackTrace();

            request.setAttribute(
                    "error",
                    "Invalid booking details."
            );

            loadBookingFormData(request);

            request.getRequestDispatcher(
                    "/booking.jsp"
            ).forward(request, response);
        }
    }


    // =====================================================
    // GET REQUEST
    // =====================================================

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");


        // =================================================
        // CHECKOUT
        // =================================================

        if ("checkout".equals(action)) {

            int bookingId = Integer.parseInt(
                    request.getParameter("id"));

            BookingDAO bookingDAO = new BookingDAO();

            boolean result =
                    bookingDAO.checkoutBooking(bookingId);


            if (result) {

                response.sendRedirect(
                        request.getContextPath() + "/booking"
                );

            } else {

                request.setAttribute(
                        "error",
                        "Checkout could not be completed."
                );

                List<Booking> bookings =
                        bookingDAO.getAllBookings();

                request.setAttribute(
                        "bookings",
                        bookings
                );

                request.getRequestDispatcher(
                        "/booking-list.jsp"
                ).forward(request, response);
            }

            return;
        }


        // =================================================
        // NEW BOOKING
        // =================================================

        if ("new".equals(action)) {

            loadBookingFormData(request);

            request.getRequestDispatcher(
                    "/booking.jsp"
            ).forward(request, response);

            return;
        }


        // =================================================
        // BOOKING LIST
        // =================================================

        BookingDAO bookingDAO = new BookingDAO();

        List<Booking> bookings =
                bookingDAO.getAllBookings();

        request.setAttribute(
                "bookings",
                bookings
        );

        request.getRequestDispatcher(
                "/booking-list.jsp"
        ).forward(request, response);
    }


    // =====================================================
    // LOAD CUSTOMER + ROOM DATA
    // =====================================================

    private void loadBookingFormData(
            HttpServletRequest request) {

        CustomerDAO customerDAO = new CustomerDAO();

        RoomDAO roomDAO = new RoomDAO();


        List<Customer> customers =
                customerDAO.getAllCustomers();

        List<Room> rooms =
                roomDAO.getAllRooms();


        request.setAttribute(
                "customers",
                customers
        );

        request.setAttribute(
                "rooms",
                rooms
        );
    }
}