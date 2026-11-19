<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.List" %>
<%@ page import="com.hotel.model.Booking" %>

<!DOCTYPE html>
<html>

<head>

    <meta charset="UTF-8">

    <title>Create Invoice - GrandStay</title>

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

        /* ================= FORM ================= */

        .form-card {
            max-width: 950px;
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
            font-size: 14px;
            outline: none;
            background: white;
        }

        input:focus,
        select:focus {
            border-color: #c9a227;
            box-shadow: 0 0 0 3px rgba(201,162,39,0.12);
        }

        input[readonly] {
            background: #f9fafb;
            color: #4b5563;
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

        /* ================= TOTAL ================= */

        .total-box {
            grid-column: 1 / -1;
            background: #f9fafb;
            border: 1px solid #e5e7eb;
            border-radius: 12px;
            padding: 20px;
        }

        .total-row {
            display: flex;
            justify-content: space-between;
            padding: 7px 0;
            font-size: 14px;
        }

        .total-row.final {
            border-top: 1px solid #d1d5db;
            margin-top: 8px;
            padding-top: 15px;
            font-size: 19px;
            font-weight: bold;
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

            .full-width,
            .total-box {
                grid-column: auto;
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

        <a href="<%= request.getContextPath() %>/payment">
            💳 Payments
        </a>

        <a href="<%= request.getContextPath() %>/invoice?action=new"
           class="active">
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
                Create Invoice
            </h1>

            <p>
                Generate an invoice for a hotel booking.
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
            BILLING &amp; FINANCE
        </small>

        <h2>
            Invoice Registration
        </h2>

        <p>
            Create a professional invoice from booking details.
        </p>

    </div>


    <!-- FORM CARD -->

    <div class="form-card">


        <div class="form-title">

            <h3>
                🧾 Invoice Information
            </h3>

            <p>
                Select a booking and enter the billing details.
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


        <form action="<%= request.getContextPath() %>/invoice"
              method="post"
              onsubmit="calculateTotal();">


            <div class="form-grid">


                <!-- BOOKING -->

                <div class="form-group full-width">

                    <label>

                        Booking

                        <span class="required">
                            *
                        </span>

                    </label>


                    <select
                        name="bookingId"
                        id="bookingId"
                        required
                        onchange="loadBookingDetails()">


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


                        <option
                            value="<%= booking.getId() %>"
                            data-customer="<%= booking.getCustomerName() %>"
                            data-room="<%= booking.getRoomNumber() %>"
                            data-checkin="<%= booking.getCheckIn() %>"
                            data-checkout="<%= booking.getCheckOut() %>">

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

                        Select the booking for which the invoice
                        will be generated.

                    </span>

                </div>


                <!-- CUSTOMER -->

                <div class="form-group">

                    <label>

                        Customer Name

                        <span class="required">
                            *
                        </span>

                    </label>


                    <input
                        type="text"
                        name="customerName"
                        id="customerName"
                        readonly
                        required>

                </div>


                <!-- ROOM -->

                <div class="form-group">

                    <label>

                        Room Number

                        <span class="required">
                            *
                        </span>

                    </label>


                    <input
                        type="text"
                        name="roomNumber"
                        id="roomNumber"
                        readonly
                        required>

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
                        readonly
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
                        readonly
                        required>

                </div>


                <!-- ROOM AMOUNT -->

                <div class="form-group">

                    <label>

                        Room Amount

                        <span class="required">
                            *
                        </span>

                    </label>


                    <input
                        type="number"
                        name="roomAmount"
                        id="roomAmount"
                        step="0.01"
                        min="0"
                        placeholder="Enter room amount"
                        required
                        oninput="calculateTotal()">

                    <span class="hint">

                        Enter the room charges.

                    </span>

                </div>


                <!-- TAX -->

                <div class="form-group">

                    <label>
                        Tax Amount
                    </label>


                    <input
                        type="number"
                        name="taxAmount"
                        id="taxAmount"
                        value="0"
                        step="0.01"
                        min="0"
                        oninput="calculateTotal()">


                    <span class="hint">

                        Enter applicable tax amount.

                    </span>

                </div>


                <!-- TOTAL -->

                <div class="total-box">

                    <div class="total-row">

                        <span>
                            Room Amount
                        </span>

                        <span id="roomAmountDisplay">
                            ₹ 0.00
                        </span>

                    </div>


                    <div class="total-row">

                        <span>
                            Tax
                        </span>

                        <span id="taxAmountDisplay">
                            ₹ 0.00
                        </span>

                    </div>


                    <div class="total-row final">

                        <span>
                            Total Amount
                        </span>

                        <span id="totalAmountDisplay">
                            ₹ 0.00
                        </span>

                    </div>

                </div>


                <!-- HIDDEN TOTAL -->

                <input
                    type="hidden"
                    name="totalAmount"
                    id="totalAmount"
                    value="0">


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

                </div>


                <!-- INVOICE DATE -->

                <div class="form-group">

                    <label>

                        Invoice Date

                        <span class="required">
                            *
                        </span>

                    </label>


                    <input
                        type="date"
                        name="invoiceDate"
                        id="invoiceDate"
                        required>

                </div>


            </div>


            <!-- BUTTONS -->

            <div class="buttons">

                <a
                    href="<%= request.getContextPath() %>/invoice"
                    class="btn cancel-btn">

                    Cancel

                </a>


                <button
                    type="submit"
                    class="btn save-btn">

                    ✓ Generate Invoice

                </button>

            </div>


        </form>

    </div>


</div>


<script>

/* =========================
   LOAD BOOKING DETAILS
========================= */

function loadBookingDetails() {

    const select =
        document.getElementById("bookingId");

    const option =
        select.options[select.selectedIndex];


    if (!option.value) {

        document.getElementById("customerName").value = "";
        document.getElementById("roomNumber").value = "";
        document.getElementById("checkIn").value = "";
        document.getElementById("checkOut").value = "";

        return;
    }


    document.getElementById("customerName").value =
        option.getAttribute("data-customer");

    document.getElementById("roomNumber").value =
        option.getAttribute("data-room");

    document.getElementById("checkIn").value =
        option.getAttribute("data-checkin");

    document.getElementById("checkOut").value =
        option.getAttribute("data-checkout");

}


/* =========================
   CALCULATE TOTAL
========================= */

function calculateTotal() {

    let roomAmount =
        parseFloat(
            document.getElementById("roomAmount").value
        ) || 0;


    let taxAmount =
        parseFloat(
            document.getElementById("taxAmount").value
        ) || 0;


    let total =
        roomAmount + taxAmount;


    document.getElementById("roomAmountDisplay").innerText =
        "₹ " + roomAmount.toFixed(2);


    document.getElementById("taxAmountDisplay").innerText =
        "₹ " + taxAmount.toFixed(2);


    document.getElementById("totalAmountDisplay").innerText =
        "₹ " + total.toFixed(2);


    document.getElementById("totalAmount").value =
        total.toFixed(2);

}


/* =========================
   TODAY'S DATE
========================= */

window.onload = function() {

    const today =
        new Date().toISOString().split("T")[0];

    document.getElementById("invoiceDate").value =
        today;

};

</script>


</body>
</html>