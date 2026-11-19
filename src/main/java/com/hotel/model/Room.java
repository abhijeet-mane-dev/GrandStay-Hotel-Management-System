package com.hotel.model;

public class Room {

    private int id;
    private String roomNumber;
    private String category;
    private double price;
    private String status;

    public Room() {
    }

    public Room(int id, String roomNumber, String category,
                double price, String status) {

        this.id = id;
        this.roomNumber = roomNumber;
        this.category = category;
        this.price = price;
        this.status = status;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getRoomNumber() {
        return roomNumber;
    }

    public void setRoomNumber(String roomNumber) {
        this.roomNumber = roomNumber;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}