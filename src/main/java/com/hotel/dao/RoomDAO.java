package com.hotel.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.hotel.model.Room;
import com.hotel.util.DBConnection;

public class RoomDAO {

    // Add Room
    public boolean addRoom(Room room) {

        String sql = "INSERT INTO rooms "
                   + "(room_number, category, price, status) "
                   + "VALUES (?, ?, ?, ?)";

        try (
            Connection con = DBConnection.getConnection();
            PreparedStatement ps = con.prepareStatement(sql)
        ) {

            ps.setString(1, room.getRoomNumber());
            ps.setString(2, room.getCategory());
            ps.setDouble(3, room.getPrice());
            ps.setString(4, room.getStatus());

            return ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }

    // Get All Rooms
    public List<Room> getAllRooms() {

        List<Room> rooms = new ArrayList<>();

        String sql = "SELECT * FROM rooms";

        try (
            Connection con = DBConnection.getConnection();
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery()
        ) {

            while (rs.next()) {

                Room room = new Room();

                room.setId(rs.getInt("id"));
                room.setRoomNumber(rs.getString("room_number"));
                room.setCategory(rs.getString("category"));
                room.setPrice(rs.getDouble("price"));
                room.setStatus(rs.getString("status"));

                rooms.add(room);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return rooms;
    }
    
 // Update Room
    public boolean updateRoom(Room room) {

        String sql = "UPDATE rooms SET room_number=?, category=?, "
                   + "price=?, status=? WHERE id=?";

        try (
            Connection con = DBConnection.getConnection();
            PreparedStatement ps = con.prepareStatement(sql)
        ) {

            ps.setString(1, room.getRoomNumber());
            ps.setString(2, room.getCategory());
            ps.setDouble(3, room.getPrice());
            ps.setString(4, room.getStatus());
            ps.setInt(5, room.getId());

            return ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }
    
    public Room getRoomById(int id) {

        Room room = null;

        String sql = "SELECT * FROM rooms WHERE id=?";

        try (
            Connection con = DBConnection.getConnection();
            PreparedStatement ps = con.prepareStatement(sql)
        ) {

            ps.setInt(1, id);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {

                room = new Room();

                room.setId(rs.getInt("id"));
                room.setRoomNumber(rs.getString("room_number"));
                room.setCategory(rs.getString("category"));
                room.setPrice(rs.getDouble("price"));
                room.setStatus(rs.getString("status"));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return room;
    }
    
    public boolean deleteRoom(int id) {

        String sql = "DELETE FROM rooms WHERE id=?";

        try (
            Connection con = DBConnection.getConnection();
            PreparedStatement ps = con.prepareStatement(sql)
        ) {

            ps.setInt(1, id);

            return ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }
    
 // Update Room Status
    public boolean updateRoomStatus(int roomId, String status) {

        String sql = "UPDATE rooms SET status=? WHERE id=?";

        try (
            Connection con = DBConnection.getConnection();
            PreparedStatement ps = con.prepareStatement(sql)
        ) {

            ps.setString(1, status);
            ps.setInt(2, roomId);

            return ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }
}