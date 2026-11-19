<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>

    <meta charset="UTF-8">

    <title>Room Management - Hotel Management System</title>

    <style>

        body {
            font-family: Arial, sans-serif;
            background-color: #f4f6f8;
            margin: 0;
            padding: 0;
        }

        .container {
            width: 500px;
            margin: 50px auto;
            background-color: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 0 10px #ccc;
        }

        h2 {
            text-align: center;
            margin-bottom: 25px;
        }

        label {
            font-weight: bold;
        }

        input,
        select {
            width: 100%;
            padding: 10px;
            margin: 8px 0 15px 0;
            box-sizing: border-box;
        }

        button {
            width: 100%;
            padding: 11px;
            background-color: #28a745;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        button:hover {
            opacity: 0.9;
        }

        .error {
            color: red;
            text-align: center;
        }

        .links {
            text-align: center;
            margin-top: 20px;
        }

        .links a {
            text-decoration: none;
            margin: 0 10px;
        }

    </style>

</head>

<body>

<div class="container">

    <h2>Room Management</h2>

    <%
        String error = (String) request.getAttribute("error");

        if (error != null) {
    %>

        <p class="error"><%= error %></p>

    <%
        }
    %>

    <form action="room" method="post">

        <label>Room Number</label>

        <input type="text"
               name="roomNumber"
               placeholder="Example: 101"
               required>


        <label>Room Category</label>

        <select name="category" required>

            <option value="">Select Category</option>

            <option value="Single">Single</option>

            <option value="Double">Double</option>

            <option value="Deluxe">Deluxe</option>

            <option value="Suite">Suite</option>

        </select>


        <label>Room Price</label>

        <input type="number"
               name="price"
               step="0.01"
               placeholder="Enter room price"
               required>


        <label>Status</label>

        <select name="status" required>

            <option value="AVAILABLE">Available</option>

            <option value="OCCUPIED">Occupied</option>

            <option value="MAINTENANCE">Maintenance</option>

        </select>


        <button type="submit">
            Add Room
        </button>

    </form>


    <div class="links">

        <a href="room">
            View Rooms
        </a>

        <a href="dashboard.jsp">
            Dashboard
        </a>

    </div>

</div>

</body>
</html>