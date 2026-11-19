<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.List" %>
<%@ page import="com.hotel.model.Customer" %>
<%@ page import="com.hotel.model.Room" %>

<!DOCTYPE html>
<html>

<head>

    <meta charset="UTF-8">

    <title>Add Booking - GrandStay</title>

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
                url("https://images.unsplash.com/photo-1551882547-ff40c63fe5fa?auto=format&fit=crop&w=1400&q=80");

            background-size: cover;
            background-position: center;

            color: white;
            padding: 32px;
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

        <a href="<%= request.getContextPath() %>/customer"
           class="active">
            👥 Customers
        </a>

        <a href="<%= request.getContextPath() %>/room">
            🛏 Rooms
        </a>

        <a href="<%= request.getContextPath() %>/booking">
            📅 Bookings
        </a>

        <a href="<%= request.getContextPath() %>/payment">
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

            <h1>
                Add Booking
            </h1>

            <p>
                Create a new hotel reservation.
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


    <!-- HEADER -->

    <div class="page-header">

        <small>
            RESERVATION SERVICES
        </small>

        <h2>
            Booking Registration
        </h2>

        <p>
            Enter customer, room and reservation details.
        </p>

    </div>


    <!-- FORM CARD -->

    <div class="form-card">


        <div class="form-title">

            <h3>
                📅 Booking Information
            </h3>

            <p>
                Complete all booking details carefully.
            </p>

        </div>


        <!-- ERROR -->

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


        <!-- FORM -->

        <form
            action="<%= request.getContextPath() %>/booking"
            method="post">


            <div class="form-grid">


                <!-- CUSTOMER ID -->

                <div class="form-group">

                    <label>

                        Customer ID

                        <span class="required">
                            *
                        </span>

                    </label>


                    <select
                        name="customerId"
                        required>

                        <option value="">

                            -- Select Customer --

                        </option>


                        <%

                            List<Customer> customers =
                                (List<Customer>)
                                request.getAttribute("customers");


                            if (customers != null &&
                                !customers.isEmpty()) {

                                for (Customer customer : customers) {

                        %>


                        <option
                            value="<%= customer.getId() %>">

                            #<%= customer.getId() %>
                            -
                            <%= customer.getName() %>

                        </option>


                        <%

                                }

                            }

                        %>


                    </select>

                </div>


                <!-- ROOM ID -->

                <div class="form-group">

                    <label>

                        Room ID

                        <span class="required">
                            *
                        </span>

                    </label>


                    <select
                        name="roomId"
                        required>

                        <option value="">

                            -- Select Room --

                        </option>


                        <%

                            List<Room> rooms =
                                (List<Room>)
                                request.getAttribute("rooms");


                            if (rooms != null &&
                                !rooms.isEmpty()) {

                                for (Room room : rooms) {

                        %>


                        <option
                            value="<%= room.getId() %>">

                            Room <%= room.getRoomNumber() %>
                            -
                            ₹ <%= room.getPrice() %>

                        </option>


                        <%

                                }

                            }

                        %>


                    </select>

                </div>


                <!-- CHECK IN -->

                <div class="form-group">

                    <label>

                        Check-in Date

                        <span class="required">
                            *
                        </span>

                    </label>


                    <input
                        type="date"
                        name="checkIn"
                        id="checkIn"
                        required>

                </div>


                <!-- CHECK OUT -->

                <div class="form-group">

                    <label>

                        Check-out Date

                        <span class="required">
                            *
                        </span>

                    </label>


                    <input
                        type="date"
                        name="checkOut"
                        id="checkOut"
                        required>

                </div>


                <!-- STATUS -->

                <div class="form-group">

                    <label>

                        Booking Status

                        <span class="required">
                            *
                        </span>

                    </label>


                    <select
                        name="status"
                        required>

                        <option value="CONFIRMED">
                            Confirmed
                        </option>

                        <option value="PENDING">
                            Pending
                        </option>

                        <option value="CANCELLED">
                            Cancelled
                        </option>

                    </select>

                </div>


                <!-- TOTAL AMOUNT -->

                <div class="form-group">

                    <label>

                        Total Amount

                        <span class="required">
                            *
                        </span>

                    </label>


                    <input
                        type="number"
                        name="totalAmount"
                        step="0.01"
                        min="0"
                        placeholder="Enter total amount"
                        required>

                </div>


            </div>


            <!-- BUTTONS -->

            <div class="buttons">

                <a
                    href="<%= request.getContextPath() %>/booking"
                    class="btn cancel-btn">

                    Cancel

                </a>


                <button
                    type="submit"
                    class="btn save-btn">

                    ✓ Add Booking

                </button>

            </div>


        </form>

    </div>


</div>


<script>

    const checkIn =
        document.getElementById("checkIn");

    const checkOut =
        document.getElementById("checkOut");


    checkIn.addEventListener(
        "change",
        function() {

            checkOut.min =
                checkIn.value;

            if (
                checkOut.value &&
                checkOut.value < checkIn.value
            ) {

                checkOut.value = "";

            }

        }
    );

</script>


</body>

</html>