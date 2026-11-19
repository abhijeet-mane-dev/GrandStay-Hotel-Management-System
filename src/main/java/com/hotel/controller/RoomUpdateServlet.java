package com.hotel.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hotel.dao.RoomDAO;
import com.hotel.model.Room;

@WebServlet("/room/update")
public class RoomUpdateServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("id"));

        String roomNumber = request.getParameter("roomNumber");
        String category = request.getParameter("category");
        double price = Double.parseDouble(request.getParameter("price"));
        String status = request.getParameter("status");

        Room room = new Room();

        room.setId(id);
        room.setRoomNumber(roomNumber);
        room.setCategory(category);
        room.setPrice(price);
        room.setStatus(status);

        RoomDAO roomDAO = new RoomDAO();

        boolean result = roomDAO.updateRoom(room);

        if (result) {
            response.sendRedirect("../room");
        } else {
            response.getWriter().println("Room update failed.");
        }
    }
}