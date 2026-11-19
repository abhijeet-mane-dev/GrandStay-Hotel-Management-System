package com.hotel.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.hotel.model.Payment;
import com.hotel.util.DBConnection;

public class PaymentDAO {


    // =========================
    // ADD PAYMENT
    // =========================

    public boolean addPayment(Payment payment) {

        String sql = "INSERT INTO payments "
                   + "(booking_id, amount, payment_method, "
                   + "payment_status, payment_date) "
                   + "VALUES (?, ?, ?, ?, ?)";

        try (
            Connection con = DBConnection.getConnection();
            PreparedStatement ps = con.prepareStatement(sql)
        ) {

            ps.setInt(1, payment.getBookingId());
            ps.setDouble(2, payment.getAmount());
            ps.setString(3, payment.getPaymentMethod());
            ps.setString(4, payment.getPaymentStatus());
            ps.setDate(5, payment.getPaymentDate());

            return ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }


    // =========================
    // GET ALL PAYMENTS
    // WITH CUSTOMER + ROOM
    // =========================

    public List<Payment> getAllPayments() {

        List<Payment> payments = new ArrayList<>();

        String sql = "SELECT p.*, "
                   + "c.name AS customer_name, "
                   + "r.room_number "
                   + "FROM payments p "
                   + "JOIN bookings b ON p.booking_id = b.id "
                   + "JOIN customers c ON b.customer_id = c.id "
                   + "JOIN rooms r ON b.room_id = r.id "
                   + "ORDER BY p.id DESC";

        try (
            Connection con = DBConnection.getConnection();
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery()
        ) {

            while (rs.next()) {

                Payment payment = new Payment();

                payment.setId(
                    rs.getInt("id")
                );

                payment.setBookingId(
                    rs.getInt("booking_id")
                );

                payment.setAmount(
                    rs.getDouble("amount")
                );

                payment.setPaymentMethod(
                    rs.getString("payment_method")
                );

                payment.setPaymentStatus(
                    rs.getString("payment_status")
                );

                payment.setPaymentDate(
                    rs.getDate("payment_date")
                );


                // Customer Name

                payment.setCustomerName(
                    rs.getString("customer_name")
                );


                // Room Number

                payment.setRoomNumber(
                    rs.getString("room_number")
                );


                payments.add(payment);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return payments;
    }


    // =========================
    // GET PAYMENT BY ID
    // =========================

    public Payment getPaymentById(int id) {

        Payment payment = null;

        String sql =
                "SELECT * FROM payments WHERE id=?";

        try (
            Connection con = DBConnection.getConnection();
            PreparedStatement ps = con.prepareStatement(sql)
        ) {

            ps.setInt(1, id);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {

                payment = new Payment();

                payment.setId(
                    rs.getInt("id")
                );

                payment.setBookingId(
                    rs.getInt("booking_id")
                );

                payment.setAmount(
                    rs.getDouble("amount")
                );

                payment.setPaymentMethod(
                    rs.getString("payment_method")
                );

                payment.setPaymentStatus(
                    rs.getString("payment_status")
                );

                payment.setPaymentDate(
                    rs.getDate("payment_date")
                );
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return payment;
    }


    // =========================
    // UPDATE PAYMENT
    // =========================

    public boolean updatePayment(Payment payment) {

        String sql =
                "UPDATE payments SET "
              + "booking_id=?, "
              + "amount=?, "
              + "payment_method=?, "
              + "payment_status=?, "
              + "payment_date=? "
              + "WHERE id=?";

        try (
            Connection con = DBConnection.getConnection();
            PreparedStatement ps = con.prepareStatement(sql)
        ) {

            ps.setInt(
                1,
                payment.getBookingId()
            );

            ps.setDouble(
                2,
                payment.getAmount()
            );

            ps.setString(
                3,
                payment.getPaymentMethod()
            );

            ps.setString(
                4,
                payment.getPaymentStatus()
            );

            ps.setDate(
                5,
                payment.getPaymentDate()
            );

            ps.setInt(
                6,
                payment.getId()
            );

            return ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }


    // =========================
    // DELETE PAYMENT
    // =========================

    public boolean deletePayment(int id) {

        String sql =
                "DELETE FROM payments WHERE id=?";

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
}