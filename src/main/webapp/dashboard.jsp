<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html>

<head>

    <meta charset="UTF-8">

    <title>GrandStay Hotel - Dashboard</title>

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <style>

        * {
            box-sizing: border-box;
        }

        html,
        body {
            margin: 0;
            padding: 0;
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
            min-height: 100vh;
            padding: 30px 35px;
        }


        /* =========================
           TOPBAR
        ========================= */

        .topbar {
            display: flex;
            align-items: center;
            justify-content: space-between;
            margin-bottom: 28px;
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
           WELCOME
        ========================= */

        .welcome {
            margin-bottom: 28px;
            padding: 34px;

            border-radius: 16px;

            color: #fff;

            background:
                linear-gradient(
                    90deg,
                    rgba(17,24,39,.96),
                    rgba(17,24,39,.72)
                ),
                url("https://images.unsplash.com/photo-1566073771259-6a8506099945?auto=format&fit=crop&w=1400&q=80");

            background-size: cover;
            background-position: center;
        }

        .welcome small {
            color: #d4af37;
            font-weight: 700;
            letter-spacing: 2px;
        }

        .welcome h2 {
            margin: 10px 0;
            font-size: 29px;
        }

        .welcome p {
            margin: 0;
            color: #d1d5db;
            font-size: 14px;
        }


    
        /* =========================
           MODULES
        ========================= */

        .section-title {
            margin-bottom: 16px;
        }

        .section-title h2 {
            margin: 0;
            font-size: 21px;
        }

        .section-title p {
            margin: 5px 0 0;
            color: #6b7280;
            font-size: 13px;
        }

        .modules {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 18px;
        }

        .module-card {
            padding: 23px;
            background: #fff;
            border: 1px solid #e5e7eb;
            border-radius: 13px;

            box-shadow:
                0 5px 20px rgba(0,0,0,.04);
        }

        .module-icon {
            margin-bottom: 10px;
            font-size: 29px;
        }

        .module-card h3 {
            margin: 0 0 7px;
            font-size: 17px;
        }

        .module-card p {
            min-height: 38px;
            margin: 0;

            color: #6b7280;

            font-size: 13px;
            line-height: 1.5;
        }

        .module-card a {
            display: inline-block;

            margin-top: 12px;

            padding: 9px 13px;

            border-radius: 7px;

            background: #111827;
            color: #fff;

            text-decoration: none;

            font-size: 12px;
            font-weight: 700;
        }

        .module-card a:hover {
            background: #d4af37;
            color: #111827;
        }


        /* =========================
           RESPONSIVE
        ========================= */

        @media (max-width: 1050px) {

            .stats {
                grid-template-columns: repeat(2, 1fr);
            }

            .modules {
                grid-template-columns: repeat(2, 1fr);
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

            .stats,
            .modules {
                grid-template-columns: 1fr;
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

        <a href="<%= request.getContextPath() %>/dashboard.jsp"
           class="active">

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

        <a href="<%= request.getContextPath() %>/report">

            <span class="nav-icon">
                📊
            </span>

            <span>
                Reports
            </span>

        </a>


    </nav>


    <!-- LOGOUT -->

    <div class="logout">

        <a href="<%= request.getContextPath() %>/login.jsp">
            Logout
        </a>

    </div>


</aside>


<!-- =========================
     MAIN DASHBOARD
========================= -->

<main class="main">


    <!-- TOPBAR -->

    <div class="topbar">

        <div>

            <h1>
                Dashboard
            </h1>

            <p>
                Welcome back, Admin. Here's your hotel overview.
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


    <!-- WELCOME -->

    <section class="welcome">

        <small>
            GRANDSTAY HOTEL
        </small>

        <h2>
            Welcome to Hotel Management System
        </h2>

        <p>
            Manage customers, rooms, bookings, payments,
            invoices and reports from one centralized dashboard.
        </p>

    </section>



    <!-- MODULE TITLE -->

    <section class="section-title">

        <h2>
            Management Modules
        </h2>

        <p>
            Select a module to manage hotel operations.
        </p>

    </section>


    <!-- MODULES -->

    <section class="modules">


        <div class="module-card">

            <div class="module-icon">
                👥
            </div>

            <h3>
                Customer Management
            </h3>

            <p>
                Add, view, edit and manage customer information.
            </p>

            <a href="<%= request.getContextPath() %>/customer">
                Open Customers →
            </a>

        </div>


        <div class="module-card">

            <div class="module-icon">
                🛏
            </div>

            <h3>
                Room Management
            </h3>

            <p>
                Manage rooms and track availability and occupancy.
            </p>

            <a href="<%= request.getContextPath() %>/room">
                Open Rooms →
            </a>

        </div>


        <div class="module-card">

            <div class="module-icon">
                📅
            </div>

            <h3>
                Booking Management
            </h3>

            <p>
                Create and manage hotel bookings and checkout.
            </p>

            <a href="<%= request.getContextPath() %>/booking">
                Open Bookings →
            </a>

        </div>


        <div class="module-card">

            <div class="module-icon">
                💳
            </div>

            <h3>
                Payment Management
            </h3>

            <p>
                Manage payment transactions and payment status.
            </p>

            <a href="<%= request.getContextPath() %>/payment">
                Open Payments →
            </a>

        </div>


        <div class="module-card">

            <div class="module-icon">
                🧾
            </div>

            <h3>
                Invoice Management
            </h3>

            <p>
                Create and manage invoices generated from bookings.
            </p>

            <a href="<%= request.getContextPath() %>/invoice">
                Open Invoices →
            </a>

        </div>


        <div class="module-card">

            <div class="module-icon">
                📊
            </div>

            <h3>
                Reports
            </h3>

            <p>
                View hotel operational and financial reports.
            </p>

            <a href="<%= request.getContextPath() %>/report">
                Open Reports →
            </a>

        </div>


    </section>


</main>


</body>

</html>