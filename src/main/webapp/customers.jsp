<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">

<title>Customer Management - GrandStay</title>

<meta name="viewport" content="width=device-width, initial-scale=1.0">

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
    font-size: 36px;
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
    display: block;
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
    font-size: 13px;
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
}

/* ================= HEADER ================= */

.page-header {
    background:
        linear-gradient(
            90deg,
            rgba(17,24,39,0.97),
            rgba(17,24,39,0.78)
        ),
        url("https://images.unsplash.com/photo-1551836022-d5d88e9218df?auto=format&fit=crop&w=1400&q=80");

    background-size: cover;
    background-position: center;

    color: white;
    padding: 30px;
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

/* ================= FORM CARD ================= */

.form-card {
    background: white;
    padding: 28px;
    border-radius: 14px;
    border: 1px solid #e5e7eb;
    box-shadow: 0 5px 20px rgba(0,0,0,0.05);
    margin-bottom: 25px;
}

.form-header {
    margin-bottom: 23px;
}

.form-header h3 {
    margin: 0;
    font-size: 20px;
}

.form-header p {
    margin: 6px 0 0;
    color: #6b7280;
    font-size: 13px;
}

.form-grid {
    display: grid;
    grid-template-columns: 1fr 1fr;
    gap: 20px;
}

.form-group {
    display: flex;
    flex-direction: column;
}

.form-group.full {
    grid-column: 1 / -1;
}

label {
    margin-bottom: 8px;
    font-size: 13px;
    font-weight: 600;
    color: #374151;
}

.required {
    color: #dc3545;
}

input,
select,
textarea {
    width: 100%;
    padding: 12px 13px;

    border: 1px solid #d1d5db;
    border-radius: 8px;

    outline: none;

    font-family: Arial, sans-serif;
    font-size: 14px;

    background: white;

    transition: 0.2s;
}

input:focus,
select:focus,
textarea:focus {
    border-color: #d4af37;

    box-shadow:
        0 0 0 3px rgba(212,175,55,0.12);
}

textarea {
    min-height: 90px;
    resize: vertical;
}

.form-actions {
    margin-top: 25px;
    padding-top: 20px;

    border-top: 1px solid #eeeeee;

    display: flex;
    justify-content: flex-end;
}

.submit-btn {
    border: none;
    background: #111827;
    color: white;

    padding: 12px 23px;

    border-radius: 8px;

    font-size: 13px;
    font-weight: bold;

    cursor: pointer;

    transition: 0.2s;
}

.submit-btn:hover {
    background: #d4af37;
    color: #111827;
}

/* ================= ERROR ================= */

.error {
    background: #fef2f2;
    border: 1px solid #fecaca;
    color: #b91c1c;

    padding: 12px 15px;

    border-radius: 8px;

    margin-bottom: 20px;

    font-size: 13px;
}

/* ================= LIST CARD ================= */

.list-card {
    background: white;
    padding: 28px;
    border-radius: 14px;
    border: 1px solid #e5e7eb;
    box-shadow: 0 5px 20px rgba(0,0,0,0.05);
}

.list-header {
    display: flex;
    justify-content: space-between;
    align-items: center;

    margin-bottom: 20px;
}

.list-header h3 {
    margin: 0;
    font-size: 20px;
}

.list-header p {
    margin: 5px 0 0;
    color: #6b7280;
    font-size: 13px;
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
    padding: 13px 12px;

    text-align: left;

    background: #f9fafb;

    color: #6b7280;

    font-size: 11px;

    text-transform: uppercase;

    letter-spacing: 0.5px;

    border-bottom: 1px solid #e5e7eb;
}

td {
    padding: 14px 12px;

    font-size: 13px;

    border-bottom: 1px solid #f0f0f0;
}

tr:hover {
    background: #fafafa;
}

.customer-name {
    font-weight: 600;
}

.id-proof {
    font-size: 12px;
    color: #4b5563;
}

.empty {
    text-align: center;
    padding: 45px 20px;
    color: #9ca3af;
}

.empty h3 {
    margin: 8px 0 5px;
    color: #374151;
}

/* ================= RESPONSIVE ================= */

@media (max-width: 800px) {

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

    .form-group.full {
        grid-column: auto;
    }

    .topbar {
        align-items: flex-start;
    }
}

</style>

</head>

<body>


<!-- ================================================= -->
<!-- SIDEBAR -->
<!-- ================================================= -->

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


<!-- ================================================= -->
<!-- MAIN -->
<!-- ================================================= -->

<div class="main">


    <!-- TOPBAR -->

    <div class="topbar">

        <div>

            <h1>Customer Management</h1>

            <p>
                Manage guest registration and customer information.
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


    <!-- ================================================= -->
    <!-- PAGE HEADER -->
    <!-- ================================================= -->

    <div class="page-header">

        <small>
            GUEST MANAGEMENT
        </small>

        <h2>
            Customer Directory
        </h2>

        <p>
            Register and maintain complete guest information.
        </p>

    </div>


    <!-- ================================================= -->
    <!-- ADD CUSTOMER -->
    <!-- ================================================= -->

    <div class="form-card">

        <div class="form-header">

            <h3>
                Add New Customer
            </h3>

            <p>
                Enter the customer's personal and identification details.
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


        <form action="<%= request.getContextPath() %>/customer"
              method="post">


            <div class="form-grid">


                <!-- NAME -->

                <div class="form-group">

                    <label for="name">
                        Full Name
                        <span class="required">*</span>
                    </label>

                    <input
                        type="text"
                        id="name"
                        name="name"
                        placeholder="Enter full name"
                        required>

                </div>


                <!-- PHONE -->

                <div class="form-group">

                    <label for="phone">
                        Phone Number
                        <span class="required">*</span>
                    </label>

                    <input
                        type="tel"
                        id="phone"
                        name="phone"
                        placeholder="Enter phone number"
                        maxlength="15"
                        required>

                </div>


                <!-- EMAIL -->

                <div class="form-group">

                    <label for="email">
                        Email Address
                    </label>

                    <input
                        type="email"
                        id="email"
                        name="email"
                        placeholder="Enter email address">

                </div>


                <!-- ID PROOF TYPE -->

                <div class="form-group">

                    <label for="idProof">
                        ID Proof Type
                        <span class="required">*</span>
                    </label>

                    <select
                        id="idProof"
                        name="idProof"
                        required>

                        <option value="">
                            Select ID Proof
                        </option>

                        <option value="Aadhaar Card">
                            Aadhaar Card
                        </option>

                        <option value="Passport">
                            Passport
                        </option>

                        <option value="Driving License">
                            Driving License
                        </option>

                        <option value="Voter ID">
                            Voter ID
                        </option>

                    </select>

                </div>


                <!-- ID PROOF NUMBER -->

                <div class="form-group">

                    <label for="idProofNumber">
                        ID Proof Number
                        <span class="required">*</span>
                    </label>

                    <input
                        type="text"
                        id="idProofNumber"
                        name="idProofNumber"
                        placeholder="Enter ID proof number"
                        maxlength="100"
                        required>

                </div>


                <!-- ADDRESS -->

                <div class="form-group full">

                    <label for="address">
                        Address
                        <span class="required">*</span>
                    </label>

                    <textarea
                        id="address"
                        name="address"
                        placeholder="Enter complete address"
                        required></textarea>

                </div>


            </div>


            <div class="form-actions">

                <button
                    type="submit"
                    class="submit-btn">

                    Add Customer

                </button>

            </div>

        </form>

    </div>


    <!-- ================================================= -->
    <!-- CUSTOMER LIST -->
    <!-- ================================================= -->

    <div class="list-card">

        <div class="list-header">

            <div>

                <h3>
                    Registered Customers
                </h3>

                <p>
                    Customer records currently available in the system.
                </p>

            </div>

        </div>


        <%

            java.util.List<com.hotel.model.Customer> customers =
                (java.util.List<com.hotel.model.Customer>)
                request.getAttribute("customers");

            if (customers != null &&
                !customers.isEmpty()) {

        %>


        <div class="table-wrapper">

            <table>

                <thead>

                    <tr>

                        <th>ID</th>

                        <th>Customer</th>

                        <th>Phone</th>

                        <th>Email</th>

                        <th>Address</th>

                        <th>ID Proof</th>

                        <th>ID Proof Number</th>

                    </tr>

                </thead>


                <tbody>

                <%

                    for (com.hotel.model.Customer customer
                            : customers) {

                %>

                    <tr>

                        <td>
                            <%= customer.getId() %>
                        </td>

                        <td>

                            <span class="customer-name">

                                <%= customer.getName() %>

                            </span>

                        </td>

                        <td>
                            <%= customer.getPhone() %>
                        </td>

                        <td>
                            <%= customer.getEmail() %>
                        </td>

                        <td>
                            <%= customer.getAddress() %>
                        </td>

                        <td>

                            <span class="id-proof">

                                <%= customer.getIdProof() %>

                            </span>

                        </td>

                        <td>

                            <span class="id-proof">

                                <%= customer.getIdProofNumber() %>

                            </span>

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


        <div class="empty">

            <h3>
                No customers found
            </h3>

            <p>
                Add a new customer to create the first record.
            </p>

        </div>


        <%

            }

        %>

    </div>

</div>

</body>
</html>