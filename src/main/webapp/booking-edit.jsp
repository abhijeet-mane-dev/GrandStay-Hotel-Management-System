<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="com.hotel.model.Booking" %>

<%
    Booking booking = (Booking) request.getAttribute("booking");
%>

<!DOCTYPE html>
<html>
<head>

    <meta charset="UTF-8">

    <title>Edit Booking - Hotel Management System</title>

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

    <h2>Edit Booking</h2>

    <form action="<%= request.getContextPath() %>/booking/update"
          method="post">

        <input type="hidden"
               name="id"
               value="<%= booking.getId() %>">


        <label>Customer ID</label>

        <input type="number"
               name="customerId"
               value="<%= booking.getCustomerId() %>"
               required>


        <label>Room ID</label>

        <input type="number"
               name="roomId"
               value="<%= booking.getRoomId() %>"
               required>


        <label>Check-in Date</label>

        <input type="date"
               name="checkIn"
               value="<%= booking.getCheckIn() %>"
               required>


        <label>Check-out Date</label>

        <input type="date"
               name="checkOut"
               value="<%= booking.getCheckOut() %>"
               required>


        <label>Booking Status</label>

        <select name="status" required>

            <option value="CONFIRMED"
                <%= "CONFIRMED".equals(booking.getStatus()) ? "selected" : "" %>>
                Confirmed
            </option>

            <option value="PENDING"
                <%= "PENDING".equals(booking.getStatus()) ? "selected" : "" %>>
                Pending
            </option>

            <option value="CANCELLED"
                <%= "CANCELLED".equals(booking.getStatus()) ? "selected" : "" %>>
                Cancelled
            </option>

        </select>


        <label>Total Amount</label>

        <input type="number"
               name="totalAmount"
               step="0.01"
               value="<%= booking.getTotalAmount() %>"
               required>


        <button type="submit">
            Update Booking
        </button>

    </form>


    <div class="links">

        <a href="<%= request.getContextPath() %>/booking">
            Back to Booking List
        </a>

    </div>

</div>

</body>
</html>