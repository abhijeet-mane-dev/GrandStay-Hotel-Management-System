<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.List" %>
<%@ page import="com.hotel.model.Payment" %>
<%@ page import="com.hotel.model.Booking" %>

<%
    Payment payment = (Payment) request.getAttribute("payment");

    List<Booking> bookings =
        (List<Booking>) request.getAttribute("bookings");

    if (payment == null) {
        response.sendRedirect(
            request.getContextPath() + "/payment"
        );
        return;
    }
%>

<!DOCTYPE html>
<html>

<head>

    <meta charset="UTF-8">

    <title>Edit Payment - GrandStay</title>

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

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
        }

        .nav a:hover {
            background: #1f2937;
            color: white;
        }

        .nav .active {
            background: linear-gradient(135deg, #c9a227, #e5c45a);
            color: #111827;
            font-weight: bold;
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
                    rgba(17,24,39,0.72)
                ),
                url("https://images.unsplash.com/photo-1556742049-0cfed4f6a45d?auto=format&fit=crop&w=1400&q=80");

            background-size: cover;
            background-position: center;

            color: white;
            padding: 30px;
            border-radius: 16px;
            margin-bottom: 25px;
        }

        .page-header small {
            color: #e5c45a;
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
        }

        /* ================= FORM CARD ================= */

        .form-card {
            max-width: 900px;
            margin: auto;
            background: white;
            padding: 32px;
            border-radius: 16px;
            box-shadow: 0 8px 30px rgba(0,0,0,0.07);
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

        .form-grid {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 22px;
        }

        .form-group {
            display: flex;
            flex-direction: column;
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
            font-size: 14px;
            background: white;
            outline: none;
        }

        input:focus,
        select:focus {
            border-color: #c9a227;
            box-shadow: 0 0 0 3px rgba(201,162,39,0.12);
        }

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

        .update-btn {
            background: #111827;
            color: white;
        }

        .update-btn:hover {
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

        <a href="<%= request.getContextPath() %>/payment"
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
                Edit Payment
            </h1>

            <p>
                Update payment transaction details.
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
            Update Payment
        </h2>

        <p>
            Modify the selected payment information.
        </p>

    </div>


    <div class="form-card">


        <div class="form-title">

            <h3>
                💳 Payment Information
            </h3>

            <p>
                Payment ID: #<%= payment.getId() %>
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


            <input
                type="hidden"
                name="id"
                value="<%= payment.getId() %>">


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

                            if (bookings != null) {

                                for (Booking booking : bookings) {

                        %>


                        <option
                            value="<%= booking.getId() %>"
                            <%= booking.getId() == payment.getBookingId()
                                ? "selected"
                                : "" %>>

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
                        value="<%= payment.getAmount() %>"
                        required>

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

                        <option value="CASH"
                            <%= "CASH".equals(payment.getPaymentMethod())
                                ? "selected"
                                : "" %>>

                            Cash

                        </option>


                        <option value="UPI"
                            <%= "UPI".equals(payment.getPaymentMethod())
                                ? "selected"
                                : "" %>>

                            UPI

                        </option>


                        <option value="CARD"
                            <%= "CARD".equals(payment.getPaymentMethod())
                                ? "selected"
                                : "" %>>

                            Card

                        </option>


                        <option value="NET BANKING"
                            <%= "NET BANKING".equals(payment.getPaymentMethod())
                                ? "selected"
                                : "" %>>

                            Net Banking

                        </option>

                    </select>

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

                        <option value="PAID"
                            <%= "PAID".equals(payment.getPaymentStatus())
                                ? "selected"
                                : "" %>>

                            PAID

                        </option>


                        <option value="PENDING"
                            <%= "PENDING".equals(payment.getPaymentStatus())
                                ? "selected"
                                : "" %>>

                            PENDING

                        </option>


                        <option value="REFUNDED"
                            <%= "REFUNDED".equals(payment.getPaymentStatus())
                                ? "selected"
                                : "" %>>

                            REFUNDED

                        </option>

                    </select>

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
                        value="<%= payment.getPaymentDate() %>"
                        required>

                </div>


            </div>


            <div class="buttons">

                <a
                    href="<%= request.getContextPath() %>/payment"
                    class="btn cancel-btn">

                    Cancel

                </a>


                <button
                    type="submit"
                    class="btn update-btn">

                    ✓ Update Payment

                </button>

            </div>


        </form>

    </div>


</div>

</body>
</html>