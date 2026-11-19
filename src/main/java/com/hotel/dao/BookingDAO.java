package com.hotel.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.hotel.model.Booking;
import com.hotel.util.DBConnection;

public class BookingDAO {

    // Add Booking
    public boolean addBooking(Booking booking) {

        String sql = "INSERT INTO bookings "
                   + "(customer_id, room_id, check_in, check_out, status, total_amount) "
                   + "VALUES (?, ?, ?, ?, ?, ?)";

        try (
            Connection con = DBConnection.getConnection();
            PreparedStatement ps = con.prepareStatement(sql)
        ) {

            ps.setInt(1, booking.getCustomerId());
            ps.setInt(2, booking.getRoomId());
            ps.setDate(3, booking.getCheckIn());
            ps.setDate(4, booking.getCheckOut());
            ps.setString(5, booking.getStatus());
            ps.setDouble(6, booking.getTotalAmount());

            return ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }


    // Get All Bookings with Customer Name and Room Number
    public List<Booking> getAllBookings() {

        List<Booking> bookings = new ArrayList<>();

        String sql = "SELECT b.*, "
                   + "c.name AS customer_name, "
                   + "r.room_number "
                   + "FROM bookings b "
                   + "JOIN customers c ON b.customer_id = c.id "
                   + "JOIN rooms r ON b.room_id = r.id";

        try (
            Connection con = DBConnection.getConnection();
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery()
        ) {

            while (rs.next()) {

                Booking booking = new Booking();

                booking.setId(rs.getInt("id"));

                booking.setCustomerId(
                    rs.getInt("customer_id")
                );

                booking.setRoomId(
                    rs.getInt("room_id")
                );

                booking.setCustomerName(
                    rs.getString("customer_name")
                );

                booking.setRoomNumber(
                    rs.getString("room_number")
                );

                booking.setCheckIn(
                    rs.getDate("check_in")
                );

                booking.setCheckOut(
                    rs.getDate("check_out")
                );

                booking.setStatus(
                    rs.getString("status")
                );

                booking.setTotalAmount(
                    rs.getDouble("total_amount")
                );

                bookings.add(booking);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return bookings;
    }
    
    public boolean isRoomAvailable(int roomId, java.sql.Date checkIn, java.sql.Date checkOut) {

        String sql = "SELECT COUNT(*) FROM bookings "
                   + "WHERE room_id = ? "
                   + "AND status <> 'CANCELLED' "
                   + "AND check_in < ? "
                   + "AND check_out > ?";

        try (
            Connection con = DBConnection.getConnection();
            PreparedStatement ps = con.prepareStatement(sql)
        ) {

            ps.setInt(1, roomId);
            ps.setDate(2, checkOut);
            ps.setDate(3, checkIn);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                return rs.getInt(1) == 0;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }
    
    public boolean updateBooking(Booking booking) {

        String sql = "UPDATE bookings SET customer_id=?, room_id=?, "
                   + "check_in=?, check_out=?, status=?, total_amount=? "
                   + "WHERE id=?";

        try (
            Connection con = DBConnection.getConnection();
            PreparedStatement ps = con.prepareStatement(sql)
        ) {

            ps.setInt(1, booking.getCustomerId());
            ps.setInt(2, booking.getRoomId());
            ps.setDate(3, booking.getCheckIn());
            ps.setDate(4, booking.getCheckOut());
            ps.setString(5, booking.getStatus());
            ps.setDouble(6, booking.getTotalAmount());
            ps.setInt(7, booking.getId());

            return ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }
    
    public Booking getBookingById(int id) {

        Booking booking = null;

        String sql = "SELECT * FROM bookings WHERE id=?";

        try (
            Connection con = DBConnection.getConnection();
            PreparedStatement ps = con.prepareStatement(sql)
        ) {

            ps.setInt(1, id);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {

                booking = new Booking();

                booking.setId(rs.getInt("id"));
                booking.setCustomerId(rs.getInt("customer_id"));
                booking.setRoomId(rs.getInt("room_id"));
                booking.setCheckIn(rs.getDate("check_in"));
                booking.setCheckOut(rs.getDate("check_out"));
                booking.setStatus(rs.getString("status"));
                booking.setTotalAmount(rs.getDouble("total_amount"));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return booking;
    }
    
    public boolean deleteBooking(int id) {

        String sql = "DELETE FROM bookings WHERE id=?";

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
    
 // =====================================================
 // CHECKOUT BOOKING
 // Booking = COMPLETED
 // Room = AVAILABLE
 // =====================================================

 public boolean checkoutBooking(int bookingId) {

     String getRoomSql =
             "SELECT room_id FROM bookings WHERE id=?";

     String updateBookingSql =
             "UPDATE bookings SET status='COMPLETED' WHERE id=?";

     String updateRoomSql =
             "UPDATE rooms SET status='AVAILABLE' WHERE id=?";

     try (
         Connection con = DBConnection.getConnection()
     ) {

         con.setAutoCommit(false);

         int roomId = 0;


         // Get Room ID
         try (
             PreparedStatement ps =
                 con.prepareStatement(getRoomSql)
         ) {

             ps.setInt(1, bookingId);

             try (
                 ResultSet rs = ps.executeQuery()
             ) {

                 if (rs.next()) {

                     roomId = rs.getInt("room_id");

                 } else {

                     con.rollback();

                     return false;
                 }
             }
         }


         // Update Booking Status
         try (
             PreparedStatement ps =
                 con.prepareStatement(updateBookingSql)
         ) {

             ps.setInt(1, bookingId);

             if (ps.executeUpdate() == 0) {

                 con.rollback();

                 return false;
             }
         }


         // Update Room Status
         try (
             PreparedStatement ps =
                 con.prepareStatement(updateRoomSql)
         ) {

             ps.setInt(1, roomId);

             if (ps.executeUpdate() == 0) {

                 con.rollback();

                 return false;
             }
         }


         con.commit();

         return true;


     } catch (Exception e) {

         e.printStackTrace();

     }

     return false;
 }
}