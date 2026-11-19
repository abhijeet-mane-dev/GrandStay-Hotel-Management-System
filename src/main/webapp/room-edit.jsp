<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="com.hotel.model.Room" %>

<%
    Room room = (Room) request.getAttribute("room");
%>

<!DOCTYPE html>
<html>
<head>

    <meta charset="UTF-8">

    <title>Edit Room - Hotel Management System</title>

    <style>

        body {
            font-family: Arial, sans-serif;
            background-color: #f4f6f8;
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
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        .links {
            text-align: center;
            margin-top: 20px;
        }

    </style>

</head>

<body>

<div class="container">

    <h2>Edit Room</h2>

    <form action="<%= request.getContextPath() %>/room/update" method="post">

        <input type="hidden"
               name="id"
               value="<%= room.getId() %>">

        <label>Room Number</label>

        <input type="text"
               name="roomNumber"
               value="<%= room.getRoomNumber() %>"
               required>


        <label>Room Category</label>

        <select name="category" required>

            <option value="Single"
                <%= "Single".equals(room.getCategory()) ? "selected" : "" %>>
                Single
            </option>

            <option value="Double"
                <%= "Double".equals(room.getCategory()) ? "selected" : "" %>>
                Double
            </option>

            <option value="Deluxe"
                <%= "Deluxe".equals(room.getCategory()) ? "selected" : "" %>>
                Deluxe
            </option>

            <option value="Suite"
                <%= "Suite".equals(room.getCategory()) ? "selected" : "" %>>
                Suite
            </option>

        </select>


        <label>Room Price</label>

        <input type="number"
               name="price"
               step="0.01"
               value="<%= room.getPrice() %>"
               required>


        <label>Status</label>

        <select name="status" required>

            <option value="AVAILABLE"
                <%= "AVAILABLE".equals(room.getStatus()) ? "selected" : "" %>>
                Available
            </option>

            <option value="OCCUPIED"
                <%= "OCCUPIED".equals(room.getStatus()) ? "selected" : "" %>>
                Occupied
            </option>

            <option value="MAINTENANCE"
                <%= "MAINTENANCE".equals(room.getStatus()) ? "selected" : "" %>>
                Maintenance
            </option>

        </select>


        <button type="submit">
            Update Room
        </button>

    </form>

    <div class="links">

        <a href="room">
            Back to Room List
        </a>

    </div>

</div>

</body>
</html>