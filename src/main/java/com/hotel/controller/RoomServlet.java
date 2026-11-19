package com.hotel.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hotel.dao.RoomDAO;
import com.hotel.model.Room;

@WebServlet("/room")
public class RoomServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;


    // =========================
    // ADD ROOM
    // =========================

    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        String roomNumber =
                request.getParameter("roomNumber");

        String category =
                request.getParameter("category");

        double price =
                Double.parseDouble(
                    request.getParameter("price")
                );

        String status =
                request.getParameter("status");


        Room room = new Room();

        room.setRoomNumber(roomNumber);
        room.setCategory(category);
        room.setPrice(price);
        room.setStatus(status);


        RoomDAO roomDAO = new RoomDAO();

        boolean result =
                roomDAO.addRoom(room);


        if (result) {

            // Room added successfully
            // Go through servlet so list is loaded
            response.sendRedirect(
                    request.getContextPath() + "/room"
            );

        } else {

            request.setAttribute(
                    "error",
                    "Room could not be added."
            );

            request.getRequestDispatcher(
                    "/rooms.jsp"
            ).forward(request, response);
        }
    }


    // =========================
    // DISPLAY ALL ROOMS
    // =========================

    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        RoomDAO roomDAO =
                new RoomDAO();


        List<Room> rooms =
                roomDAO.getAllRooms();


        request.setAttribute(
                "rooms",
                rooms
        );


        request.getRequestDispatcher(
                "/room-list.jsp"
        ).forward(request, response);
    }
}