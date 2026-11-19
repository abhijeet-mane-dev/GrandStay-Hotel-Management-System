package com.hotel.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hotel.dao.BookingDAO;
import com.hotel.model.Booking;

@WebServlet("/booking/edit")
public class BookingEditServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("id"));

        BookingDAO bookingDAO = new BookingDAO();

        Booking booking = bookingDAO.getBookingById(id);

        if (booking != null) {

            request.setAttribute("booking", booking);

            request.getRequestDispatcher("/booking-edit.jsp")
                   .forward(request, response);

        } else {

            response.getWriter().println("Booking not found.");
        }
    }
}
