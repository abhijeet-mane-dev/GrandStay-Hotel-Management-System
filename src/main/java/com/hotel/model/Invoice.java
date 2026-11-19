package com.hotel.model;

import java.sql.Date;

public class Invoice {

    private int id;
    private int bookingId;
    private String customerName;
    private String roomNumber;
    private Date checkIn;
    private Date checkOut;
    private double roomAmount;
    private double taxAmount;
    private double totalAmount;
    private String paymentStatus;
    private Date invoiceDate;


    // Default Constructor
    public Invoice() {
    }


    // ID
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }


    // Booking ID
    public int getBookingId() {
        return bookingId;
    }

    public void setBookingId(int bookingId) {
        this.bookingId = bookingId;
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


    // Check In
    public Date getCheckIn() {
        return checkIn;
    }

    public void setCheckIn(Date checkIn) {
        this.checkIn = checkIn;
    }


    // Check Out
    public Date getCheckOut() {
        return checkOut;
    }

    public void setCheckOut(Date checkOut) {
        this.checkOut = checkOut;
    }


    // Room Amount
    public double getRoomAmount() {
        return roomAmount;
    }

    public void setRoomAmount(double roomAmount) {
        this.roomAmount = roomAmount;
    }


    // Tax Amount
    public double getTaxAmount() {
        return taxAmount;
    }

    public void setTaxAmount(double taxAmount) {
        this.taxAmount = taxAmount;
    }


    // Total Amount
    public double getTotalAmount() {
        return totalAmount;
    }

    public void setTotalAmount(double totalAmount) {
        this.totalAmount = totalAmount;
    }


    // Payment Status
    public String getPaymentStatus() {
        return paymentStatus;
    }

    public void setPaymentStatus(String paymentStatus) {
        this.paymentStatus = paymentStatus;
    }


    // Invoice Date
    public Date getInvoiceDate() {
        return invoiceDate;
    }

    public void setInvoiceDate(Date invoiceDate) {
        this.invoiceDate = invoiceDate;
    }
}