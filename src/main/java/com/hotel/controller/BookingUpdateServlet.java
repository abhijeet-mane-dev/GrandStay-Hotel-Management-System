package com.hotel.controller;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hotel.dao.BookingDAO;
import com.hotel.model.Booking;

@WebServlet("/booking/update")
public class BookingUpdateServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("id"));

        int customerId =
                Integer.parseInt(request.getParameter("customerId"));

        int roomId =
                Integer.parseInt(request.getParameter("roomId"));

        Date checkIn =
                Date.valueOf(request.getParameter("checkIn"));

        Date checkOut =
                Date.valueOf(request.getParameter("checkOut"));

        String status =
                request.getParameter("status");

        double totalAmount =
                Double.parseDouble(request.getParameter("totalAmount"));

        Booking booking = new Booking();

        booking.setId(id);
        booking.setCustomerId(customerId);
        booking.setRoomId(roomId);
        booking.setCheckIn(checkIn);
        booking.setCheckOut(checkOut);
        booking.setStatus(status);
        booking.setTotalAmount(totalAmount);

        BookingDAO bookingDAO = new BookingDAO();

        boolean result = bookingDAO.updateBooking(booking);

        if (result) {

            response.sendRedirect(
                    request.getContextPath() + "/booking"
            );

        } else {

            response.getWriter().println(
                    "Booking update failed."
            );
        }
    }
}
