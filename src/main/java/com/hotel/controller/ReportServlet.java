package com.hotel.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hotel.dao.ReportDAO;
import com.hotel.model.Report;

@WebServlet("/report")
public class ReportServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        ReportDAO reportDAO = new ReportDAO();

        Report report = reportDAO.getReportData();

        request.setAttribute("report", report);

        request.getRequestDispatcher("report.jsp")
               .forward(request, response);
    }
}
