package com.hotel.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hotel.dao.RoomDAO;
import com.hotel.model.Room;

@WebServlet("/room/edit")
public class RoomEditServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("id"));

        RoomDAO roomDAO = new RoomDAO();

        Room room = roomDAO.getRoomById(id);

        if (room != null) {

            request.setAttribute("room", room);

            request.getRequestDispatcher("/room-edit.jsp")
                   .forward(request, response);

        } else {

            response.getWriter().println("Room not found.");
        }
    }
}