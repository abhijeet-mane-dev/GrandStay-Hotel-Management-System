<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.List" %>
<%@ page import="com.hotel.model.Customer" %>

<!DOCTYPE html>
<html>

<head>

    <meta charset="UTF-8">

    <title>Customer Management - GrandStay</title>

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <link rel="preconnect"
          href="https://fonts.googleapis.com">

    <link rel="preconnect"
          href="https://fonts.gstatic.com"
          crossorigin>

    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap"
          rel="stylesheet">

    <style>

        /* =========================
           GLOBAL
        ========================= */

        * {
            box-sizing: border-box;
        }

        body {
            margin: 0;
            font-family: 'Inter', Arial, sans-serif;
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


        /* =========================
           NAVIGATION
        ========================= */

        .nav a {
            display: block;
            text-decoration: none;
            color: #d1d5db;
            padding: 13px 15px;
            margin-bottom: 7px;
            border-radius: 9px;
            transition: 0.25s;
        }

        .nav a:hover {
            background: #1f2937;
            color: white;
            transform: translateX(4px);
        }

        .nav .active {
            background: linear-gradient(
                135deg,
                #c9a227,
                #e5c45a
            );
            color: #111827;
            font-weight: 700;
        }


        /* =========================
           LOGOUT
        ========================= */

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
            padding: 30px 35px;
        }


        /* =========================
           TOP BAR
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
            background: linear-gradient(
                135deg,
                #c9a227,
                #f0d477
            );
            display: flex;
            align-items: center;
            justify-content: center;
            font-weight: bold;
        }


        /* =========================
           HEADER CARD
        ========================= */

        .page-header {
            background:
                linear-gradient(
                    90deg,
                    rgba(17,24,39,0.96),
                    rgba(17,24,39,0.78)
                ),
                url("https://images.unsplash.com/photo-1556742049-0cfed4f6a45d?auto=format&fit=crop&w=1400&q=80");

            background-size: cover;
            background-position: center;

            color: white;

            padding: 30px;

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


        /* =========================
           ACTION BAR
        ========================= */

        .action-bar {
            display: flex;
            justify-content: space-between;
            align-items: center;

            background: white;

            padding: 18px 20px;

            border-radius: 12px;

            margin-bottom: 20px;

            box-shadow:
                0 5px 20px rgba(0,0,0,0.05);
        }

        .customer-count {
            font-weight: 600;
        }

        .add-btn {
            background: #111827;
            color: white;

            padding: 11px 18px;

            border-radius: 8px;

            text-decoration: none;

            font-size: 13px;
            font-weight: 600;

            transition: 0.25s;
        }

        .add-btn:hover {
            background: #c9a227;
            color: #111827;
        }


        /* =========================
           TABLE
        ========================= */

        .table-card {
            background: white;

            border-radius: 15px;

            padding: 20px;

            box-shadow:
                0 5px 25px rgba(0,0,0,0.06);

            overflow-x: auto;
        }

        table {
            width: 100%;
            border-collapse: collapse;

            min-width: 1050px;
        }

        th {
            background: #111827;
            color: white;

            padding: 14px 12px;

            text-align: left;

            font-size: 12px;

            white-space: nowrap;
        }

        td {
            padding: 14px 12px;

            border-bottom: 1px solid #eee;

            font-size: 13px;

            vertical-align: middle;
        }

        tr {
            transition: 0.2s;
        }

        tr:hover {
            background: #faf9f4;
        }


        /* =========================
           CUSTOMER
        ========================= */

        .customer-name {
            font-weight: 700;
            white-space: nowrap;
        }

        .customer-id {
            color: #9ca3af;
            font-size: 12px;
        }


        /* =========================
           ID PROOF
        ========================= */

        .id-proof-type {
            font-weight: 600;
            font-size: 12px;
            color: #374151;
        }

        .id-proof-number {
            margin-top: 4px;
            font-family: monospace;
            font-size: 12px;
            font-weight: 600;
            color: #111827;
            letter-spacing: 0.5px;
            white-space: nowrap;
        }


        /* =========================
           ACTION BUTTONS
        ========================= */

        .edit-btn {
            background: #f0c94a;
            color: #111827;

            padding: 7px 12px;

            text-decoration: none;

            border-radius: 6px;

            font-size: 12px;
            font-weight: 600;

            margin-right: 5px;

            display: inline-block;
        }

        .edit-btn:hover {
            background: #d4a900;
        }

        .delete-btn {
            background: #dc3545;
            color: white;

            padding: 7px 12px;

            text-decoration: none;

            border-radius: 6px;

            font-size: 12px;
            font-weight: 600;

            display: inline-block;
        }

        .delete-btn:hover {
            background: #b91c1c;
        }


        /* =========================
           EMPTY
        ========================= */

        .no-data {
            text-align: center;

            padding: 50px;

            color: #9ca3af;

            font-size: 14px;
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

            .topbar {
                align-items: flex-start;
            }

            .page-header h2 {
                font-size: 24px;
            }

            .action-bar {
                gap: 15px;
                flex-direction: column;
                align-items: stretch;
            }

        }

    </style>

</head>

<body>


<!-- =========================
     SIDEBAR
========================= -->

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


        <!-- DASHBOARD -->

        <a href="<%= request.getContextPath() %>/dashboard.jsp">

            🏠 Dashboard

        </a>


        <!-- CUSTOMERS -->

        <a href="<%= request.getContextPath() %>/customer"
           class="active">

            👥 Customers

        </a>


        <!-- ROOMS -->

        <a href="<%= request.getContextPath() %>/room">

            🛏 Rooms

        </a>


        <!-- BOOKINGS -->

        <a href="<%= request.getContextPath() %>/booking">

            📅 Bookings

        </a>


        <!-- PAYMENTS -->

        <a href="<%= request.getContextPath() %>/payment">

            💳 Payments

        </a>


        <!-- INVOICES -->

        <a href="<%= request.getContextPath() %>/invoice">

            🧾 Invoices

        </a>


        <!-- REPORTS -->

        <a href="<%= request.getContextPath() %>/report">

            📊 Reports

        </a>


    </div>


    <!-- LOGOUT -->

    <div class="logout">

        <a href="<%= request.getContextPath() %>/login.jsp">

            Logout

        </a>

    </div>

</div>


<!-- =========================
     MAIN
========================= -->

<div class="main">


    <!-- TOP BAR -->

    <div class="topbar">

        <div>

            <h1>
                Customer Management
            </h1>

            <p>
                Manage guest information and customer records.
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
            GUEST SERVICES
        </small>

        <h2>
            Customer Directory
        </h2>

        <p>
            View and manage all registered hotel customers
            from one place.
        </p>

    </div>


    <!-- ACTION BAR -->

    <div class="action-bar">

        <div class="customer-count">

            👥 Registered Customers

        </div>


        <a href="customers.jsp"
           class="add-btn">

            + Add New Customer

        </a>

    </div>


    <!-- CUSTOMER TABLE -->

    <div class="table-card">

        <table>

            <thead>

                <tr>

                    <th>
                        ID
                    </th>

                    <th>
                        Customer
                    </th>

                    <th>
                        Phone
                    </th>

                    <th>
                        Email
                    </th>

                    <th>
                        Address
                    </th>

                    <th>
                        ID Proof
                    </th>

                    <th>
                        ID Proof Number
                    </th>

                    <th>
                        Actions
                    </th>

                </tr>

            </thead>


            <tbody>


            <%

                List<Customer> customers =

                    (List<Customer>)
                    request.getAttribute("customers");


                if (customers != null &&
                    !customers.isEmpty()) {


                    for (Customer customer : customers) {

            %>


                <tr>


                    <!-- CUSTOMER ID -->

                    <td>

                        <span class="customer-id">

                            #<%= customer.getId() %>

                        </span>

                    </td>


                    <!-- CUSTOMER NAME -->

                    <td>

                        <div class="customer-name">

                            <%= customer.getName() %>

                        </div>

                    </td>


                    <!-- PHONE -->

                    <td>

                        <%= customer.getPhone() %>

                    </td>


                    <!-- EMAIL -->

                    <td>

                        <%= customer.getEmail() %>

                    </td>


                    <!-- ADDRESS -->

                    <td>

                        <%= customer.getAddress() %>

                    </td>


                    <!-- ID PROOF TYPE -->

                    <td>

                        <span class="id-proof-type">

                            <%= customer.getIdProof() %>

                        </span>

                    </td>


                    <!-- ID PROOF NUMBER -->

                    <td>

                        <span class="id-proof-number">

                            <%= customer.getIdProofNumber() %>

                        </span>

                    </td>


                    <!-- ACTIONS -->

                    <td>


                        <a
                            href="<%= request.getContextPath() %>/customer/edit?id=<%= customer.getId() %>"
                            class="edit-btn">

                            Edit

                        </a>


                        <a
                            href="<%= request.getContextPath() %>/customer/delete?id=<%= customer.getId() %>"
                            class="delete-btn"

                            onclick="return confirm('Are you sure you want to delete this customer?');">

                            Delete

                        </a>


                    </td>


                </tr>


            <%

                    }

                } else {

            %>


                <tr>

                    <td colspan="8"
                        class="no-data">

                        👥 No customers found.

                    </td>

                </tr>


            <%

                }

            %>


            </tbody>

        </table>

    </div>


</div>

</body>

</html>