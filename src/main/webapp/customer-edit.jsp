<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="com.hotel.model.Customer" %>

<%
    Customer customer =
        (Customer) request.getAttribute("customer");
%>

<!DOCTYPE html>

<html>

<head>

    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <title>Edit Customer - GrandStay Hotel</title>

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
            font-size: 10px;
            color: #9ca3af;
            letter-spacing: 2px;
        }

        .nav a {
            display: flex;
            align-items: center;
            gap: 11px;
            text-decoration: none;
            color: #d1d5db;
            padding: 13px 15px;
            margin-bottom: 7px;
            border-radius: 9px;
            font-size: 14px;
            transition: 0.2s;
        }

        .nav a:hover {
            background: #1f2937;
            color: white;
        }

        .nav a.active {
            background: #d4af37;
            color: #111827;
            font-weight: 700;
        }

        .nav-icon {
            width: 22px;
            text-align: center;
            font-size: 16px;
        }

        .logout {
            position: absolute;
            left: 18px;
            right: 18px;
            bottom: 25px;
        }

        .logout a {
            display: block;
            padding: 11px;
            border-radius: 8px;
            background: #dc3545;
            color: white;
            text-align: center;
            text-decoration: none;
            font-size: 13px;
            font-weight: 600;
        }

        .logout a:hover {
            background: #b91c1c;
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
            background: #d4af37;
            display: flex;
            align-items: center;
            justify-content: center;
            font-weight: bold;
            color: #111827;
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
                url("https://images.unsplash.com/photo-1540575467063-178a50c2df87?auto=format&fit=crop&w=1400&q=80");

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
            font-weight: bold;
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
           FORM CARD
        ========================= */

        .form-card {
            max-width: 850px;
            margin: auto;
            background: white;
            padding: 32px;
            border-radius: 15px;
            border: 1px solid #e5e7eb;
            box-shadow: 0 8px 30px rgba(0,0,0,0.07);
        }

        .form-title {
            margin-bottom: 25px;
        }

        .form-title h3 {
            margin: 0;
            font-size: 20px;
        }

        .form-title p {
            margin: 6px 0 0;
            color: #6b7280;
            font-size: 13px;
        }

        /* =========================
           CUSTOMER ID
        ========================= */

        .customer-id-box {
            display: flex;
            align-items: center;
            justify-content: space-between;
            background: #f9fafb;
            border: 1px solid #e5e7eb;
            border-radius: 9px;
            padding: 12px 14px;
            margin-bottom: 22px;
        }

        .customer-id-label {
            color: #6b7280;
            font-size: 12px;
            font-weight: 600;
            text-transform: uppercase;
        }

        .customer-id-value {
            font-weight: 700;
            color: #111827;
        }

        /* =========================
           FORM GRID
        ========================= */

        .form-grid {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 20px;
        }

        .form-group {
            display: flex;
            flex-direction: column;
        }

        label {
            margin-bottom: 8px;
            font-size: 13px;
            font-weight: 700;
            color: #374151;
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
            font-family: Arial, sans-serif;
            outline: none;
            background: white;
            transition: 0.2s;
        }

        input:focus,
        select:focus {
            border-color: #d4af37;
            box-shadow: 0 0 0 3px rgba(212,175,55,0.12);
        }

        .hint {
            margin-top: 6px;
            color: #9ca3af;
            font-size: 11px;
        }

        /* =========================
           BUTTONS
        ========================= */

        .buttons {
            display: flex;
            justify-content: flex-end;
            gap: 10px;
            margin-top: 28px;
            padding-top: 22px;
            border-top: 1px solid #eeeeee;
        }

        .btn {
            padding: 12px 22px;
            border-radius: 8px;
            border: none;
            cursor: pointer;
            text-decoration: none;
            font-size: 13px;
            font-weight: 700;
        }

        .update-btn {
            background: #111827;
            color: white;
        }

        .update-btn:hover {
            background: #d4af37;
            color: #111827;
        }

        .cancel-btn {
            background: #e5e7eb;
            color: #374151;
        }

        .cancel-btn:hover {
            background: #d1d5db;
        }

        /* =========================
           MOBILE
        ========================= */

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

            .buttons {
                flex-direction: column;
            }

            .btn {
                width: 100%;
                text-align: center;
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

        <a href="<%= request.getContextPath() %>/dashboard.jsp">

            <span class="nav-icon">⌂</span>
            <span>Dashboard</span>

        </a>


        <a href="<%= request.getContextPath() %>/customer"
           class="active">

            <span class="nav-icon">♙</span>
            <span>Customers</span>

        </a>


        <a href="<%= request.getContextPath() %>/room">

            <span class="nav-icon">▣</span>
            <span>Rooms</span>

        </a>


        <a href="<%= request.getContextPath() %>/booking">

            <span class="nav-icon">▦</span>
            <span>Bookings</span>

        </a>


        <a href="<%= request.getContextPath() %>/payment">

            <span class="nav-icon">₹</span>
            <span>Payments</span>

        </a>


        <a href="<%= request.getContextPath() %>/invoice">

            <span class="nav-icon">▤</span>
            <span>Invoices</span>

        </a>


        <a href="<%= request.getContextPath() %>/report">

            <span class="nav-icon">▥</span>
            <span>Reports</span>

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
                Customer Management
            </h1>

            <p>
                Update registered customer information.
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
            GUEST SERVICES
        </small>

        <h2>
            Edit Customer
        </h2>

        <p>
            Update the customer's personal and identification details.
        </p>

    </div>


    <!-- FORM CARD -->

    <div class="form-card">


        <div class="form-title">

            <h3>
                Customer Information
            </h3>

            <p>
                Make the required changes and save the customer record.
            </p>

        </div>


        <!-- CUSTOMER ID -->

        <div class="customer-id-box">

            <span class="customer-id-label">
                Customer ID
            </span>

            <span class="customer-id-value">

                #<%= customer.getId() %>

            </span>

        </div>


        <!-- FORM -->

        <form
            action="<%= request.getContextPath() %>/customer"
            method="post">


            <!-- HIDDEN ID -->

            <input
                type="hidden"
                name="id"
                value="<%= customer.getId() %>">


            <div class="form-grid">


                <!-- NAME -->

                <div class="form-group">

                    <label>

                        Name

                        <span class="required">
                            *
                        </span>

                    </label>

                    <input
                        type="text"
                        name="name"
                        value="<%= customer.getName() %>"
                        placeholder="Enter customer name"
                        required>

                </div>


                <!-- PHONE -->

                <div class="form-group">

                    <label>

                        Phone

                        <span class="required">
                            *
                        </span>

                    </label>

                    <input
                        type="text"
                        name="phone"
                        value="<%= customer.getPhone() %>"
                        placeholder="Enter mobile number"
                        required>

                </div>


                <!-- EMAIL -->

                <div class="form-group">

                    <label>

                        Email

                        <span class="required">
                            *
                        </span>

                    </label>

                    <input
                        type="email"
                        name="email"
                        value="<%= customer.getEmail() %>"
                        placeholder="Enter email address"
                        required>

                </div>


                <!-- ADDRESS -->

                <div class="form-group">

                    <label>

                        Address

                        <span class="required">
                            *
                        </span>

                    </label>

                    <input
                        type="text"
                        name="address"
                        value="<%= customer.getAddress() %>"
                        placeholder="Enter customer address"
                        required>

                </div>


                <!-- ID PROOF -->

                <div class="form-group">

                    <label>

                        ID Proof

                        <span class="required">
                            *
                        </span>

                    </label>


                    <select
                        name="idProof"
                        required>

                        <option value="">
                            Select ID Proof
                        </option>


                        <option
                            value="Aadhaar"
                            <%= "Aadhaar".equalsIgnoreCase(
                                customer.getIdProof())
                                ? "selected"
                                : "" %>>

                            Aadhaar

                        </option>


                        <option
                            value="PAN"
                            <%= "PAN".equalsIgnoreCase(
                                customer.getIdProof())
                                ? "selected"
                                : "" %>>

                            PAN

                        </option>


                        <option
                            value="Passport"
                            <%= "Passport".equalsIgnoreCase(
                                customer.getIdProof())
                                ? "selected"
                                : "" %>>

                            Passport

                        </option>


                        <option
                            value="Driving License"
                            <%= "Driving License".equalsIgnoreCase(
                                customer.getIdProof())
                                ? "selected"
                                : "" %>>

                            Driving License

                        </option>

                    </select>

                </div>


                <!-- ID PROOF NUMBER -->

                <div class="form-group">

                    <label>

                        ID Proof Number

                        <span class="required">
                            *
                        </span>

                    </label>

                    <input
                        type="text"
                        name="idProofNumber"
                        value="<%= customer.getIdProofNumber() %>"
                        placeholder="Enter ID proof number"
                        required>

                    <span class="hint">

                        Enter the identification number associated
                        with the selected ID proof.

                    </span>

                </div>


            </div>


            <!-- BUTTONS -->

            <div class="buttons">


                <a
                    href="<%= request.getContextPath() %>/customer"
                    class="btn cancel-btn">

                    Cancel

                </a>


                <button
                    type="submit"
                    class="btn update-btn">

                    ✓ Update Customer

                </button>


            </div>


        </form>

    </div>


</main>


</body>

</html>