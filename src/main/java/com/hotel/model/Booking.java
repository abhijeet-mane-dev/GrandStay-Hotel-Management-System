package com.hotel.model;

import java.sql.Date;

public class Booking {

    private int id;
    private int customerId;
    private int roomId;

    private String customerName;
    private String roomNumber;

    private Date checkIn;
    private Date checkOut;

    private String status;
    private double totalAmount;


    // Default Constructor
    public Booking() {
    }


    // Parameterized Constructor
    public Booking(int id, int customerId, int roomId,
                   String customerName, String roomNumber,
                   Date checkIn, Date checkOut,
                   String status, double totalAmount) {

        this.id = id;
        this.customerId = customerId;
        this.roomId = roomId;
        this.customerName = customerName;
        this.roomNumber = roomNumber;
        this.checkIn = checkIn;
        this.checkOut = checkOut;
        this.status = status;
        this.totalAmount = totalAmount;
    }


    // ID
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }


    // Customer ID
    public int getCustomerId() {
        return customerId;
    }

    public void setCustomerId(int customerId) {
        this.customerId = customerId;
    }


    // Room ID
    public int getRoomId() {
        return roomId;
    }

    public void setRoomId(int roomId) {
        this.roomId = roomId;
    }


    // Customer Name
    public String getCustomerName() {
        return customerName;
    }

    public void setCustomerName(String customerName) {
        this.customerName = customerName;
    }


    // Room Number
    public String getRoomNumber() {
        return roomNumber;
    }

    public void setRoomNumber(String roomNumber) {
        this.roomNumber = roomNumber;
    }


    // Check-in
    public Date getCheckIn() {
        return checkIn;
    }

    public void setCheckIn(Date checkIn) {
        this.checkIn = checkIn;
    }


    // Check-out
    public Date getCheckOut() {
        return checkOut;
    }

    public void setCheckOut(Date checkOut) {
        this.checkOut = checkOut;
    }


    // Status
    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }


    // Total Amount
    public double getTotalAmount() {
        return totalAmount;
    }

    public void setTotalAmount(double totalAmount) {
        this.totalAmount = totalAmount;
    }
}
