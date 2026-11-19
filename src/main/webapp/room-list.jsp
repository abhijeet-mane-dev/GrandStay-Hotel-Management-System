<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.List" %>
<%@ page import="com.hotel.model.Room" %>

<!DOCTYPE html>
<html>
<head>

    <meta charset="UTF-8">

    <title>Room Management - GrandStay</title>

    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>

    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap"
          rel="stylesheet">

    <style>

        * {
            box-sizing: border-box;
        }

        body {
            margin: 0;
            font-family: 'Inter', Arial, sans-serif;
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

        /* ================= TOP BAR ================= */

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

        /* ================= HERO ================= */

        .page-header {
            background:
                linear-gradient(
                    90deg,
                    rgba(17,24,39,0.96),
                    rgba(17,24,39,0.72)
                ),
                url("https://images.unsplash.com/photo-1564501049412-61c2a3083791?auto=format&fit=crop&w=1400&q=80");

            background-size: cover;
            background-position: center;

            color: white;

            padding: 30px;

            border-radius: 16px;

            margin-bottom: 25px;

            box-shadow: 0 12px 35px rgba(0,0,0,0.12);
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

        /* ================= ACTION BAR ================= */

        .action-bar {
            display: flex;
            justify-content: space-between;
            align-items: center;

            background: white;

            padding: 18px 20px;

            border-radius: 12px;

            margin-bottom: 20px;

            box-shadow: 0 5px 20px rgba(0,0,0,0.05);
        }

        .room-count {
            font-weight: 600;
        }

        .add-btn {
            background: #111827;
            color: white;

            padding: 11px 18px;

            border-radius: 8px;

            text-decoration: none;

            transition: 0.3s;
        }

        .add-btn:hover {
            background: #c9a227;
            color: #111827;
        }

        /* ================= TABLE ================= */

        .table-card {
            background: white;

            border-radius: 15px;

            padding: 20px;

            box-shadow: 0 5px 25px rgba(0,0,0,0.06);

            overflow-x: auto;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            min-width: 850px;
        }

        th {
            background: #111827;
            color: white;

            padding: 14px 12px;

            text-align: left;

            font-size: 13px;
        }

        td {
            padding: 14px 12px;

            border-bottom: 1px solid #eee;

            font-size: 14px;
        }

        tr {
            transition: 0.2s;
        }

        tr:hover {
            background: #faf9f4;
        }

        /* ================= ROOM NUMBER ================= */

        .room-number {
            font-weight: 700;
        }

        .room-id {
            color: #9ca3af;
            font-size: 12px;
        }

        /* ================= STATUS ================= */

        .status {
            display: inline-block;

            padding: 6px 10px;

            border-radius: 20px;

            font-size: 11px;

            font-weight: 700;
        }

        .available {
            background: #dcfce7;
            color: #166534;
        }

        .occupied {
            background: #fee2e2;
            color: #991b1b;
        }

        .maintenance {
            background: #fef3c7;
            color: #92400e;
        }

        /* ================= ACTION BUTTONS ================= */

        .edit-btn {
            background: #f0c94a;
            color: #111827;

            padding: 7px 12px;

            text-decoration: none;

            border-radius: 6px;

            font-size: 12px;

            margin-right: 5px;
        }

        .delete-btn {
            background: #dc3545;
            color: white;

            padding: 7px 12px;

            text-decoration: none;

            border-radius: 6px;

            font-size: 12px;
        }

        /* ================= EMPTY ================= */

        .no-data {
            text-align: center;
            padding: 40px;

            color: #9ca3af;
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

        <a href="<%= request.getContextPath() %>/room"
           class="active">
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


    <!-- TOP BAR -->

    <div class="topbar">

        <div>

            <h1>Room Management</h1>

            <p>Manage rooms, prices and availability.</p>

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

        <small>ROOM SERVICES</small>

        <h2>Room Directory</h2>

        <p>
            Manage hotel rooms, categories, pricing
            and current availability.
        </p>

    </div>


    <!-- ACTION BAR -->

    <div class="action-bar">

        <div class="room-count">

            🛏 Hotel Rooms

        </div>


        <a href="rooms.jsp" class="add-btn">

            + Add New Room

        </a>

    </div>


    <!-- TABLE -->

    <div class="table-card">

        <table>

            <tr>

                <th>ID</th>

                <th>Room Number</th>

                <th>Category</th>

                <th>Price / Night</th>

                <th>Status</th>

                <th>Actions</th>

            </tr>


            <%

                List<Room> rooms =
                    (List<Room>) request.getAttribute("rooms");

                if (rooms != null && !rooms.isEmpty()) {

                    for (Room room : rooms) {

            %>


            <tr>

                <!-- ID -->

                <td>

                    <span class="room-id">

                        #<%= room.getId() %>

                    </span>

                </td>


                <!-- ROOM NUMBER -->

                <td>

                    <div class="room-number">

                        🛏 <%= room.getRoomNumber() %>

                    </div>

                </td>


                <!-- CATEGORY -->

                <td>

                    <%= room.getCategory() %>

                </td>


                <!-- PRICE -->

                <td>

                    ₹ <%= room.getPrice() %>

                </td>


                <!-- STATUS -->

                <td>

                    <%

                        String status =
                            room.getStatus();

                        if ("AVAILABLE".equalsIgnoreCase(status)) {

                    %>

                        <span class="status available">
                            AVAILABLE
                        </span>

                    <%

                        } else if ("OCCUPIED".equalsIgnoreCase(status)) {

                    %>

                        <span class="status occupied">
                            OCCUPIED
                        </span>

                    <%

                        } else if ("MAINTENANCE".equalsIgnoreCase(status)) {

                    %>

                        <span class="status maintenance">
                            MAINTENANCE
                        </span>

                    <%

                        } else {

                    %>

                        <span class="status">
                            <%= status %>
                        </span>

                    <%

                        }

                    %>

                </td>


                <!-- ACTIONS -->

                <td>

                    <a href="<%= request.getContextPath() %>/room/edit?id=<%= room.getId() %>"
                       class="edit-btn">

                        Edit

                    </a>


                    <a href="<%= request.getContextPath() %>/room/delete?id=<%= room.getId() %>"
                       class="delete-btn"

                       onclick="return confirm('Are you sure you want to delete this room?');">

                        Delete

                    </a>

                </td>

            </tr>


            <%

                    }

                } else {

            %>


            <tr>

                <td colspan="6" class="no-data">

                    🛏 No rooms found.

                </td>

            </tr>


            <%

                }

            %>

        </table>

    </div>

</div>


</body>
</html>