<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="com.hotel.model.Report" %>

<%
    Report report = (Report) request.getAttribute("report");

    if (report == null) {
        response.sendRedirect(
            request.getContextPath() + "/report"
        );
        return;
    }
%>

<!DOCTYPE html>
<html>

<head>

    <meta charset="UTF-8">

    <title>Reports - GrandStay Hotel</title>

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <style>

        * {
            box-sizing: border-box;
        }

        body {
            margin: 0;
            font-family: Arial, Helvetica, sans-serif;
            background: #f5f6f8;
            color: #1f2937;
        }

        /* =========================
           SIDEBAR
        ========================= */

        .sidebar {
            position: fixed;
            left: 0;
            top: 0;
            width: 240px;
            height: 100vh;
            background: #111827;
            color: white;
            padding: 25px 18px;
            box-shadow: 4px 0 20px rgba(0,0,0,0.08);
        }

        .logo {
            text-align: center;
            margin-bottom: 35px;
        }

        .logo-icon {
            font-size: 38px;
        }

        .logo h2 {
            margin: 8px 0 0;
            font-size: 20px;
        }

        .logo p {
            margin: 5px 0;
            font-size: 11px;
            color: #9ca3af;
            letter-spacing: 2px;
        }

        .nav a {
            display: block;
            text-decoration: none;
            color: #d1d5db;
            padding: 13px 15px;
            margin-bottom: 7px;
            border-radius: 9px;
            transition: 0.3s;
        }

        .nav a:hover {
            background: #1f2937;
            color: white;
            transform: translateX(4px);
        }

        .nav .active {
            background: linear-gradient(135deg, #c9a227, #e5c45a);
            color: #111827;
            font-weight: 700;
        }

        .logout {
            position: absolute;
            bottom: 25px;
            left: 18px;
            right: 18px;
        }

        .logout a {
            display: block;
            text-align: center;
            padding: 11px;
            border-radius: 8px;
            background: #dc3545;
            color: white;
            text-decoration: none;
        }


        /* =========================
           MAIN
        ========================= */

        .main {
            margin-left: 240px;
            padding: 30px 35px;
            min-height: 100vh;
        }


        /* =========================
           TOPBAR
        ========================= */

        .topbar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 25px;
        }

        .topbar h1 {
            margin: 0;
            font-size: 28px;
        }

        .topbar p {
            margin: 6px 0 0;
            color: #6b7280;
            font-size: 14px;
        }

        .admin {
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .admin-avatar {
            width: 42px;
            height: 42px;
            border-radius: 50%;

            display: flex;
            align-items: center;
            justify-content: center;

            background: #d4af37;
            color: #111827;

            font-weight: 700;
        }

        .admin small {
            color: #6b7280;
        }


        /* =========================
           PAGE HEADER
        ========================= */

        .page-header {
            background:
                linear-gradient(
                    90deg,
                    rgba(17,24,39,0.97),
                    rgba(17,24,39,0.78)
                ),
                url("https://images.unsplash.com/photo-1556761175-b413da4baf72?auto=format&fit=crop&w=1400&q=80");

            background-size: cover;
            background-position: center;

            color: white;

            padding: 32px;

            border-radius: 15px;

            margin-bottom: 25px;
        }

        .page-header small {
            color: #d4af37;

            font-size: 11px;

            font-weight: 700;

            letter-spacing: 2px;
        }

        .page-header h2 {
            margin: 10px 0 5px;

            font-size: 29px;
        }

        .page-header p {
            margin: 0;

            color: #d1d5db;

            font-size: 14px;
        }


        /* =========================
           REPORT GRID
        ========================= */

        .report-grid {
            display: grid;

            grid-template-columns:
                repeat(4, 1fr);

            gap: 18px;

            margin-bottom: 25px;
        }

        .report-card {
            background: white;

            padding: 22px;

            border-radius: 12px;

            border: 1px solid #e5e7eb;

            box-shadow:
                0 4px 15px rgba(0,0,0,0.04);
        }

        .report-label {
            color: #6b7280;

            font-size: 12px;

            font-weight: 600;

            text-transform: uppercase;

            letter-spacing: 0.5px;

            margin-bottom: 12px;
        }

        .report-value {
            font-size: 28px;

            font-weight: 700;

            color: #111827;
        }

        .report-description {
            margin-top: 7px;

            color: #9ca3af;

            font-size: 12px;
        }


        /* =========================
           REVENUE
        ========================= */

        .revenue-card {
            border-top: 3px solid #d4af37;
        }

        .revenue-value {
            color: #8a6d1d;

            font-size: 24px;

            font-weight: 700;
        }


        /* =========================
           SUMMARY
        ========================= */

        .summary {
            background: white;

            border: 1px solid #e5e7eb;

            border-radius: 12px;

            padding: 26px;

            box-shadow:
                0 4px 15px rgba(0,0,0,0.04);
        }

        .summary-header {
            display: flex;

            justify-content: space-between;

            align-items: center;

            margin-bottom: 18px;
        }

        .summary-header h3 {
            margin: 0;

            font-size: 19px;
        }

        .summary-header p {
            margin: 5px 0 0;

            color: #6b7280;

            font-size: 12px;
        }


        /* =========================
           PRINT
        ========================= */

        .print-btn {
            border: none;

            background: #111827;

            color: white;

            padding: 10px 16px;

            border-radius: 7px;

            cursor: pointer;

            font-size: 12px;

            font-weight: 600;
        }

        .print-btn:hover {
            background: #d4af37;

            color: #111827;
        }


        /* =========================
           SUMMARY ROW
        ========================= */

        .summary-row {
            display: flex;

            justify-content: space-between;

            align-items: center;

            padding: 14px 0;

            border-bottom: 1px solid #edf0f2;
        }

        .summary-row:last-child {
            border-bottom: none;
        }

        .summary-label {
            color: #6b7280;

            font-size: 13px;
        }

        .summary-value {
            font-size: 14px;

            font-weight: 700;
        }


        /* =========================
           ROOM STATUS
        ========================= */

        .room-status {
            display: grid;

            grid-template-columns: 1fr 1fr;

            gap: 18px;

            margin-top: 22px;
        }

        .status-box {
            padding: 20px;

            border: 1px solid #e5e7eb;

            border-radius: 10px;

            background: #fafafa;
        }

        .status-title {
            color: #6b7280;

            font-size: 12px;

            font-weight: 600;

            text-transform: uppercase;

            letter-spacing: 0.5px;
        }

        .status-number {
            margin-top: 8px;

            font-size: 28px;

            font-weight: 700;
        }


        /* =========================
           RESPONSIVE
        ========================= */

        @media (max-width: 1100px) {

            .report-grid {
                grid-template-columns:
                    repeat(2, 1fr);
            }

        }

        @media (max-width: 700px) {

            .sidebar {
                display: none;
            }

            .main {
                margin-left: 0;

                padding: 20px;
            }

            .report-grid {
                grid-template-columns: 1fr;
            }

            .room-status {
                grid-template-columns: 1fr;
            }

            .summary-header {
                flex-direction: column;

                align-items: flex-start;

                gap: 15px;
            }

        }


        /* =========================
           PRINT
        ========================= */

        @media print {

            .sidebar,
            .topbar,
            .print-btn {
                display: none;
            }

            .main {
                margin-left: 0;

                padding: 20px;
            }

            .page-header {
                background: none;

                color: black;

                border: 1px solid #ddd;
            }

        }

    </style>

</head>

<body>


<!-- =========================
     SIDEBAR
========================= -->

<aside class="sidebar">

    <div class="logo">

        <div class="logo-icon">
            🏨
        </div>

        <h2>
            GrandStay
        </h2>

        <p>
            HOTEL MANAGEMENT
        </p>

    </div>


    <nav class="nav">


        <!-- DASHBOARD -->

        <a href="<%= request.getContextPath() %>/dashboard.jsp">

            <span class="nav-icon">
                🏠
            </span>

            <span>
                Dashboard
            </span>

        </a>


        <!-- CUSTOMERS -->

        <a href="<%= request.getContextPath() %>/customer">

            <span class="nav-icon">
                👥
            </span>

            <span>
                Customers
            </span>

        </a>


        <!-- ROOMS -->

        <a href="<%= request.getContextPath() %>/room">

            <span class="nav-icon">
                🛏
            </span>

            <span>
                Rooms
            </span>

        </a>


        <!-- BOOKINGS -->

        <a href="<%= request.getContextPath() %>/booking">

            <span class="nav-icon">
                📅
            </span>

            <span>
                Bookings
            </span>

        </a>


        <!-- PAYMENTS -->

        <a href="<%= request.getContextPath() %>/payment">

            <span class="nav-icon">
                💳
            </span>

            <span>
                Payments
            </span>

        </a>


        <!-- INVOICES -->

        <a href="<%= request.getContextPath() %>/invoice">

            <span class="nav-icon">
                🧾
            </span>

            <span>
                Invoices
            </span>

        </a>


        <!-- REPORTS -->

        <a href="<%= request.getContextPath() %>/report"
           class="active">

            <span class="nav-icon">
                📊
            </span>

            <span>
                Reports
            </span>

        </a>


    </nav>


    <div class="logout">

        <a href="<%= request.getContextPath() %>/login.jsp">
            Logout
        </a>

    </div>

</aside>


<!-- =========================
     MAIN
========================= -->

<main class="main">


    <!-- TOPBAR -->

    <div class="topbar">

        <div>

            <h1>
                Reports
            </h1>

            <p>
                Hotel operational and financial overview
            </p>

        </div>


        <div class="admin">

            <div class="admin-avatar">
                A
            </div>

            <div>

                <strong>
                    Admin
                </strong>

                <br>

                <small>
                    Administrator
                </small>

            </div>

        </div>

    </div>


    <!-- PAGE HEADER -->

    <div class="page-header">

        <small>
            REPORTS &amp; ANALYTICS
        </small>

        <h2>
            Hotel Performance Report
        </h2>

        <p>
            Current operational and financial summary
            of GrandStay Hotel.
        </p>

    </div>


    <!-- REPORT CARDS -->

    <div class="report-grid">


        <div class="report-card">

            <div class="report-label">
                Total Customers
            </div>

            <div class="report-value">
                <%= report.getTotalCustomers() %>
            </div>

            <div class="report-description">
                Registered hotel customers
            </div>

        </div>


        <div class="report-card">

            <div class="report-label">
                Total Rooms
            </div>

            <div class="report-value">
                <%= report.getTotalRooms() %>
            </div>

            <div class="report-description">
                Rooms registered in the system
            </div>

        </div>


        <div class="report-card">

            <div class="report-label">
                Total Bookings
            </div>

            <div class="report-value">
                <%= report.getTotalBookings() %>
            </div>

            <div class="report-description">
                Reservations recorded
            </div>

        </div>


        <div class="report-card">

            <div class="report-label">
                Total Payments
            </div>

            <div class="report-value">
                <%= report.getTotalPayments() %>
            </div>

            <div class="report-description">
                Payment transactions recorded
            </div>

        </div>


        <div class="report-card">

            <div class="report-label">
                Total Invoices
            </div>

            <div class="report-value">
                <%= report.getTotalInvoices() %>
            </div>

            <div class="report-description">
                Billing records generated
            </div>

        </div>


        <div class="report-card">

            <div class="report-label">
                Available Rooms
            </div>

            <div class="report-value">
                <%= report.getAvailableRooms() %>
            </div>

            <div class="report-description">
                Rooms currently available
            </div>

        </div>


        <div class="report-card">

            <div class="report-label">
                Occupied Rooms
            </div>

            <div class="report-value">
                <%= report.getOccupiedRooms() %>
            </div>

            <div class="report-description">
                Rooms currently occupied
            </div>

        </div>


        <div class="report-card revenue-card">

            <div class="report-label">
                Total Revenue
            </div>

            <div class="revenue-value">

                ₹ <%= String.format(
                    "%.2f",
                    report.getTotalRevenue()
                ) %>

            </div>

            <div class="report-description">
                Revenue recorded from invoices
            </div>

        </div>


    </div>


    <!-- OPERATIONAL SUMMARY -->

    <div class="summary">


        <div class="summary-header">

            <div>

                <h3>
                    Operational Summary
                </h3>

                <p>
                    Current status of hotel operations
                </p>

            </div>


            <button
                type="button"
                class="print-btn"
                onclick="window.print()">

                Print Report

            </button>

        </div>


        <div class="summary-row">

            <span class="summary-label">
                Total Customers
            </span>

            <span class="summary-value">
                <%= report.getTotalCustomers() %>
            </span>

        </div>


        <div class="summary-row">

            <span class="summary-label">
                Total Rooms
            </span>

            <span class="summary-value">
                <%= report.getTotalRooms() %>
            </span>

        </div>


        <div class="summary-row">

            <span class="summary-label">
                Total Bookings
            </span>

            <span class="summary-value">
                <%= report.getTotalBookings() %>
            </span>

        </div>


        <div class="summary-row">

            <span class="summary-label">
                Total Payments
            </span>

            <span class="summary-value">
                <%= report.getTotalPayments() %>
            </span>

        </div>


        <div class="summary-row">

            <span class="summary-label">
                Total Invoices
            </span>

            <span class="summary-value">
                <%= report.getTotalInvoices() %>
            </span>

        </div>


        <div class="summary-row">

            <span class="summary-label">
                Total Revenue
            </span>

            <span class="summary-value">

                ₹ <%= String.format(
                    "%.2f",
                    report.getTotalRevenue()
                ) %>

            </span>

        </div>


        <div class="room-status">


            <div class="status-box">

                <div class="status-title">
                    Available Rooms
                </div>

                <div class="status-number">
                    <%= report.getAvailableRooms() %>
                </div>

            </div>


            <div class="status-box">

                <div class="status-title">
                    Occupied Rooms
                </div>

                <div class="status-number">
                    <%= report.getOccupiedRooms() %>
                </div>

            </div>


        </div>


    </div>


</main>


</body>

</html>