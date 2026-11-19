<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.List" %>
<%@ page import="com.hotel.model.Payment" %>

<!DOCTYPE html>
<html>

<head>

    <meta charset="UTF-8">

    <title>Payment Management - GrandStay</title>

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

        /* ================= CARD ================= */

        .card {
            background: white;
            border-radius: 16px;
            padding: 25px;
            box-shadow: 0 8px 30px rgba(0,0,0,0.07);
        }

        .card-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
        }

        .card-header h3 {
            margin: 0;
            font-size: 20px;
        }

        .card-header p {
            margin: 5px 0 0;
            color: #6b7280;
            font-size: 13px;
        }

        .add-btn {
            background: #111827;
            color: white;
            text-decoration: none;
            padding: 11px 18px;
            border-radius: 8px;
            font-size: 13px;
            font-weight: bold;
        }

        .add-btn:hover {
            background: #c9a227;
            color: #111827;
        }

        /* ================= TABLE ================= */

        .table-wrapper {
            overflow-x: auto;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            min-width: 950px;
        }

        th {
            text-align: left;
            padding: 14px 12px;
            background: #f9fafb;
            color: #6b7280;
            font-size: 12px;
            text-transform: uppercase;
            letter-spacing: 0.5px;
            border-bottom: 1px solid #e5e7eb;
        }

        td {
            padding: 16px 12px;
            border-bottom: 1px solid #f0f0f0;
            font-size: 13px;
            vertical-align: middle;
        }

        tr:hover {
            background: #fafafa;
        }

        .payment-id {
            font-weight: bold;
        }

        .booking-id {
            font-weight: 600;
        }

        .customer {
            font-weight: 600;
        }

        .room {
            font-weight: 600;
        }

        .amount {
            font-weight: bold;
        }

        /* ================= STATUS ================= */

        .status {
            display: inline-block;
            padding: 6px 10px;
            border-radius: 20px;
            font-size: 11px;
            font-weight: bold;
        }

        .paid {
            background: #dcfce7;
            color: #166534;
        }

        .pending {
            background: #fef3c7;
            color: #92400e;
        }

        .refunded {
            background: #fee2e2;
            color: #991b1b;
        }

        /* ================= METHOD ================= */

        .method {
            display: inline-block;
            padding: 5px 9px;
            background: #f3f4f6;
            border-radius: 6px;
            font-size: 11px;
            font-weight: 600;
        }

        /* ================= ACTIONS ================= */

        .actions {
            display: flex;
            gap: 7px;
        }

        .action-btn {
            padding: 7px 10px;
            border-radius: 6px;
            text-decoration: none;
            font-size: 11px;
            font-weight: 600;
        }

        .edit {
            background: #e0f2fe;
            color: #0369a1;
        }

        .edit:hover {
            background: #bae6fd;
        }

        .delete {
            background: #fee2e2;
            color: #b91c1c;
        }

        .delete:hover {
            background: #fecaca;
        }

        /* ================= EMPTY ================= */

        .empty {
            text-align: center;
            padding: 55px 20px;
            color: #9ca3af;
        }

        .empty-icon {
            font-size: 45px;
            margin-bottom: 10px;
        }

        .empty h3 {
            margin: 5px 0;
            color: #374151;
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

            .card-header {
                flex-direction: column;
                align-items: flex-start;
                gap: 15px;
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

        <h2>GrandStay</h2>

        <p>HOTEL MANAGEMENT</p>

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


    <!-- TOPBAR -->

    <div class="topbar">

        <div>

            <h1>Payment Management</h1>

            <p>
                Manage hotel payments and transactions.
            </p>

        </div>


        <div class="admin">

            <div class="admin-avatar">
                A
            </div>

            <div>

                <strong>Admin</strong>

                <br>

                <small>Administrator</small>

            </div>

        </div>

    </div>


    <!-- PAGE HEADER -->

    <div class="page-header">

        <small>
            FINANCIAL SERVICES
        </small>

        <h2>
            Payment Directory
        </h2>

        <p>
            Manage customer payments, methods and payment status.
        </p>

    </div>


    <!-- PAYMENT CARD -->

    <div class="card">


        <div class="card-header">

            <div>

                <h3>
                    💳 Hotel Payments
                </h3>

                <p>
                    View and manage all payment transactions.
                </p>

            </div>


            <a href="<%= request.getContextPath() %>/payment?action=new"
               class="add-btn">

                + Add New Payment

            </a>

        </div>


        <%

            List<Payment> payments =

                (List<Payment>)
                request.getAttribute("payments");

            if (payments != null &&
                !payments.isEmpty()) {

        %>


        <div class="table-wrapper">

            <table>

                <thead>

                    <tr>

                        <th>ID</th>
                        <th>Booking</th>
                        <th>Customer</th>
                        <th>Room</th>
                        <th>Amount</th>
                        <th>Method</th>
                        <th>Status</th>
                        <th>Date</th>
                        <th>Actions</th>

                    </tr>

                </thead>


                <tbody>

                <%

                    for (Payment payment : payments) {

                        String status =
                            payment.getPaymentStatus();

                        String statusClass =
                            "pending";


                        if ("PAID".equalsIgnoreCase(status)) {

                            statusClass = "paid";

                        } else if (
                            "REFUNDED".equalsIgnoreCase(status)) {

                            statusClass = "refunded";

                        }

                %>


                <tr>


                    <!-- ID -->

                    <td>

                        <span class="payment-id">

                            #<%= payment.getId() %>

                        </span>

                    </td>


                    <!-- BOOKING -->

                    <td>

                        <span class="booking-id">

                            #<%= payment.getBookingId() %>

                        </span>

                    </td>


                    <!-- CUSTOMER -->

                    <td>

                        <span class="customer">

                            👤
                            <%= payment.getCustomerName() %>

                        </span>

                    </td>


                    <!-- ROOM -->

                    <td>

                        <span class="room">

                            🛏
                            <%= payment.getRoomNumber() %>

                        </span>

                    </td>


                    <!-- AMOUNT -->

                    <td>

                        <span class="amount">

                            ₹ <%= payment.getAmount() %>

                        </span>

                    </td>


                    <!-- METHOD -->

                    <td>

                        <span class="method">

                            <%= payment.getPaymentMethod() %>

                        </span>

                    </td>


                    <!-- STATUS -->

                    <td>

                        <span class="status <%= statusClass %>">

                            <%= status %>

                        </span>

                    </td>


                    <!-- DATE -->

                    <td>

                        <%= payment.getPaymentDate() %>

                    </td>


                    <!-- ACTIONS -->

                    <td>

                        <div class="actions">


                            <!-- EDIT -->

                            <a
                                href="<%= request.getContextPath() %>/payment?action=edit&id=<%= payment.getId() %>"
                                class="action-btn edit">

                                Edit

                            </a>


                            <!-- DELETE -->

                            <a
                                href="<%= request.getContextPath() %>/payment?action=delete&id=<%= payment.getId() %>"
                                class="action-btn delete"

                                onclick="return confirm('Are you sure you want to delete this payment?');">

                                Delete

                            </a>


                        </div>

                    </td>


                </tr>


                <%

                    }

                %>


                </tbody>

            </table>

        </div>


        <%

            } else {

        %>


        <!-- EMPTY STATE -->

        <div class="empty">

            <div class="empty-icon">
                💳
            </div>

            <h3>
                No payments found.
            </h3>

            <p>
                Add a payment to see it here.
            </p>

        </div>


        <%

            }

        %>


    </div>


</div>


</body>
</html>