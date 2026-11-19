<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.List" %>
<%@ page import="com.hotel.model.Booking" %>

<!DOCTYPE html>
<html>

<head>

    <meta charset="UTF-8">

    <title>Add Payment - GrandStay</title>

    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <style>

        * {
            box-sizing: border-box;
        }

        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background: #f5f6f8;
            color: #1f2937;
        }

        /* ================= SIDEBAR ================= */

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

        /* ================= MAIN ================= */

        .main {
            margin-left: 240px;
            padding: 30px 35px;
        }

        /* ================= TOPBAR ================= */

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
            margin: 6px 0;
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
            background: linear-gradient(135deg, #c9a227, #f0d477);
            display: flex;
            align-items: center;
            justify-content: center;
            font-weight: bold;
        }

        /* ================= HEADER ================= */

        .page-header {
            background:
                linear-gradient(
                    90deg,
                    rgba(17,24,39,0.96),
                    rgba(17,24,39,0.70)
                ),
                url("https://images.unsplash.com/photo-1556742049-0cfed4f6a45d?auto=format&fit=crop&w=1400&q=80");

            background-size: cover;
            background-position: center;

            color: white;

            padding: 32px;

            border-radius: 16px;

            margin-bottom: 25px;

            box-shadow:
                0 12px 35px rgba(0,0,0,0.12);
        }

        .page-header small {
            color: #e5c45a;
            font-weight: 700;
            letter-spacing: 2px;
        }

        .page-header h2 {
            margin: 10px 0 5px;
            font-size: 30px;
        }

        .page-header p {
            margin: 0;
            color: #d1d5db;
        }

        /* ================= FORM CARD ================= */

        .form-card {
            max-width: 900px;
            margin: auto;
            background: white;
            padding: 32px;
            border-radius: 16px;
            box-shadow:
                0 8px 30px rgba(0,0,0,0.07);
        }

        .form-title {
            margin-bottom: 25px;
        }

        .form-title h3 {
            margin: 0 0 5px;
            font-size: 20px;
        }

        .form-title p {
            margin: 0;
            color: #6b7280;
            font-size: 13px;
        }

        /* ================= FORM GRID ================= */

        .form-grid {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 22px;
        }

        .form-group {
            display: flex;
            flex-direction: column;
        }

        .full-width {
            grid-column: 1 / -1;
        }

        label {
            font-size: 13px;
            font-weight: 700;
            margin-bottom: 8px;
        }

        .required {
            color: #dc3545;
        }

        input,
        select {
            width: 100%;
            padding: 12px 13px;
            border: 1px solid #d1d5db;
            border-radius: 8px;
            font-family: Arial, sans-serif;
            font-size: 14px;
            background: white;
            outline: none;
            transition: 0.2s;
        }

        input:focus,
        select:focus {
            border-color: #c9a227;
            box-shadow:
                0 0 0 3px rgba(201,162,39,0.12);
        }

        .hint {
            margin-top: 6px;
            font-size: 11px;
            color: #9ca3af;
        }

        /* ================= ERROR ================= */

        .error {
            background: #fee2e2;
            color: #991b1b;
            padding: 12px 15px;
            border-radius: 8px;
            margin-bottom: 20px;
            font-size: 13px;
        }

        /* ================= BUTTONS ================= */

        .buttons {
            display: flex;
            justify-content: flex-end;
            gap: 12px;
            margin-top: 28px;
            padding-top: 22px;
            border-top: 1px solid #eee;
        }

        .btn {
            padding: 12px 22px;
            border-radius: 8px;
            border: none;
            cursor: pointer;
            text-decoration: none;
            font-size: 14px;
            font-weight: 600;
        }

        .save-btn {
            background: #111827;
            color: white;
        }

        .save-btn:hover {
            background: #c9a227;
            color: #111827;
        }

        .cancel-btn {
            background: #e5e7eb;
            color: #374151;
        }

        .cancel-btn:hover {
            background: #d1d5db;
        }

        /* ================= MOBILE ================= */

        @media (max-width: 700px) {

            .sidebar {
                display: none;
            }

            .main {
                margin-left: 0;
                padding: 20px;
            }

            .form-grid {
                grid-template-columns: 1fr;
            }

            .full-width {
                grid-column: auto;
            }

            .buttons {
                justify-content: stretch;
            }

            .btn {
                flex: 1;
                text-align: center;
            }

        }

    </style>

</head>

<body>

<!-- ================= SIDEBAR ================= -->

<div class="sidebar">

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

    <div class="nav">

        <a href="<%= request.getContextPath() %>/dashboard.jsp">
            🏠 Dashboard
        </a>

        <a href="<%= request.getContextPath() %>/customer">
            👥 Customers
        </a>

        <a href="<%= request.getContextPath() %>/room">
            🛏 Rooms
        </a>

        <a href="<%= request.getContextPath() %>/booking">
            📅 Bookings
        </a>

        <a href="<%= request.getContextPath() %>/payment?action=new"
           class="active">
            💳 Payments
        </a>

        <a href="<%= request.getContextPath() %>/invoice">
            🧾 Invoices
        </a>

        <a href="<%= request.getContextPath() %>/report">
            📊 Reports
        </a>

    </div>

    <div class="logout">

        <a href="<%= request.getContextPath() %>/login.jsp">
            Logout
        </a>

    </div>

</div>

<!-- ================= MAIN ================= -->

<div class="main">

    <div class="topbar">

        <div>

            <h1>
                Add Payment
            </h1>

            <p>
                Record and manage hotel payments.
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

    <div class="page-header">

        <small>
            FINANCIAL SERVICES
        </small>

        <h2>
            Payment Registration
        </h2>

        <p>
            Record payment details for hotel bookings.
        </p>

    </div>

    <div class="form-card">

        <div class="form-title">

            <h3>
                Payment Information
            </h3>

            <p>
                Enter the payment details carefully.
            </p>

        </div>

        <%
            String error =
                (String) request.getAttribute("error");

            if (error != null) {
        %>

        <div class="error">
            <%= error %>
        </div>

        <%
            }
        %>

        <form
            action="<%= request.getContextPath() %>/payment"
            method="post">

            <div class="form-grid">

                <!-- BOOKING -->

                <div class="form-group">

                    <label>

                        Booking

                        <span class="required">
                            *
                        </span>

                    </label>

                    <select
                        name="bookingId"
                        required>

                        <option value="">
                            -- Select Booking --
                        </option>

                        <%

                            List<Booking> bookings =
                                (List<Booking>)
                                request.getAttribute("bookings");

                            if (bookings != null &&
                                !bookings.isEmpty()) {

                                for (Booking booking : bookings) {

                        %>

                        <option value="<%= booking.getId() %>">

                            #<%= booking.getId() %>
                            -
                            <%= booking.getCustomerName() %>
                            -
                            Room <%= booking.getRoomNumber() %>

                        </option>

                        <%

                                }

                            }

                        %>

                    </select>

                    <span class="hint">

                        Select the booking for which payment
                        is being recorded.

                    </span>

                </div>

                <!-- AMOUNT -->

                <div class="form-group">

                    <label>

                        Amount

                        <span class="required">
                            *
                        </span>

                    </label>

                    <input
                        type="number"
                        name="amount"
                        step="0.01"
                        min="0"
                        placeholder="Enter payment amount"
                        required>

                    <span class="hint">

                        Enter the amount received from the customer.

                    </span>

                </div>

                <!-- PAYMENT METHOD -->

                <div class="form-group">

                    <label>

                        Payment Method

                        <span class="required">
                            *
                        </span>

                    </label>

                    <select
                        name="paymentMethod"
                        required>

                        <option value="">
                            -- Select Payment Method --
                        </option>

                        <option value="CASH">
                            Cash
                        </option>

                        <option value="UPI">
                            UPI
                        </option>

                        <option value="CARD">
                            Card
                        </option>

                        <option value="NET BANKING">
                            Net Banking
                        </option>

                    </select>

                    <span class="hint">

                        Select the customer's payment method.

                    </span>

                </div>

                <!-- PAYMENT STATUS -->

                <div class="form-group">

                    <label>

                        Payment Status

                        <span class="required">
                            *
                        </span>

                    </label>

                    <select
                        name="paymentStatus"
                        required>

                        <option value="PAID">
                            PAID
                        </option>

                        <option value="PENDING">
                            PENDING
                        </option>

                        <option value="REFUNDED">
                            REFUNDED
                        </option>

                    </select>

                    <span class="hint">

                        Select the current payment status.

                    </span>

                </div>

                <!-- PAYMENT DATE -->

                <div class="form-group">

                    <label>

                        Payment Date

                        <span class="required">
                            *
                        </span>

                    </label>

                    <input
                        type="date"
                        name="paymentDate"
                        id="paymentDate"
                        required>

                    <span class="hint">

                        Select the date on which payment was received.

                    </span>

                </div>

            </div>

            <!-- BUTTONS -->

            <div class="buttons">

                <a href="<%= request.getContextPath() %>/payment"
                   class="btn cancel-btn">

                    Cancel

                </a>

                <button
                    type="submit"
                    class="btn save-btn">

                    Save Payment

                </button>

            </div>

        </form>

    </div>

</div>

<script>

    // Set today's date automatically

    const today =
        new Date().toISOString().split("T")[0];

    document.getElementById("paymentDate").value =
        today;

</script>

</body>
</html>