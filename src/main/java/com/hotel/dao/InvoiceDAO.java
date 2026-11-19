package com.hotel.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.hotel.model.Invoice;
import com.hotel.util.DBConnection;

public class InvoiceDAO {

    // =========================
    // ADD INVOICE
    // =========================

    public boolean addInvoice(Invoice invoice) {

        String sql = "INSERT INTO invoices "
                   + "(booking_id, customer_name, room_number, "
                   + "check_in, check_out, room_amount, tax_amount, "
                   + "total_amount, payment_status, invoice_date) "
                   + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

        try (
            Connection con = DBConnection.getConnection();
            PreparedStatement ps = con.prepareStatement(sql)
        ) {

            ps.setInt(1, invoice.getBookingId());
            ps.setString(2, invoice.getCustomerName());
            ps.setString(3, invoice.getRoomNumber());
            ps.setDate(4, invoice.getCheckIn());
            ps.setDate(5, invoice.getCheckOut());
            ps.setDouble(6, invoice.getRoomAmount());
            ps.setDouble(7, invoice.getTaxAmount());
            ps.setDouble(8, invoice.getTotalAmount());
            ps.setString(9, invoice.getPaymentStatus());
            ps.setDate(10, invoice.getInvoiceDate());

            return ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }


    // =========================
    // GET ALL INVOICES
    // =========================

    public List<Invoice> getAllInvoices() {

        List<Invoice> invoices = new ArrayList<>();

        String sql = "SELECT * FROM invoices "
                   + "ORDER BY id DESC";

        try (
            Connection con = DBConnection.getConnection();
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery()
        ) {

            while (rs.next()) {

                Invoice invoice = new Invoice();

                invoice.setId(
                    rs.getInt("id")
                );

                invoice.setBookingId(
                    rs.getInt("booking_id")
                );

                invoice.setCustomerName(
                    rs.getString("customer_name")
                );

                invoice.setRoomNumber(
                    rs.getString("room_number")
                );

                invoice.setCheckIn(
                    rs.getDate("check_in")
                );

                invoice.setCheckOut(
                    rs.getDate("check_out")
                );

                invoice.setRoomAmount(
                    rs.getDouble("room_amount")
                );

                invoice.setTaxAmount(
                    rs.getDouble("tax_amount")
                );

                invoice.setTotalAmount(
                    rs.getDouble("total_amount")
                );

                invoice.setPaymentStatus(
                    rs.getString("payment_status")
                );

                invoice.setInvoiceDate(
                    rs.getDate("invoice_date")
                );

                invoices.add(invoice);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return invoices;
    }


    // =========================
    // GET INVOICE BY ID
    // =========================

    public Invoice getInvoiceById(int id) {

        Invoice invoice = null;

        String sql =
                "SELECT * FROM invoices WHERE id=?";

        try (
            Connection con = DBConnection.getConnection();
            PreparedStatement ps = con.prepareStatement(sql)
        ) {

            ps.setInt(1, id);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {

                invoice = new Invoice();

                invoice.setId(
                    rs.getInt("id")
                );

                invoice.setBookingId(
                    rs.getInt("booking_id")
                );

                invoice.setCustomerName(
                    rs.getString("customer_name")
                );

                invoice.setRoomNumber(
                    rs.getString("room_number")
                );

                invoice.setCheckIn(
                    rs.getDate("check_in")
                );

                invoice.setCheckOut(
                    rs.getDate("check_out")
                );

                invoice.setRoomAmount(
                    rs.getDouble("room_amount")
                );

                invoice.setTaxAmount(
                    rs.getDouble("tax_amount")
                );

                invoice.setTotalAmount(
                    rs.getDouble("total_amount")
                );

                invoice.setPaymentStatus(
                    rs.getString("payment_status")
                );

                invoice.setInvoiceDate(
                    rs.getDate("invoice_date")
                );
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return invoice;
    }


    // =========================
    // UPDATE INVOICE
    // =========================

    public boolean updateInvoice(Invoice invoice) {

        String sql = "UPDATE invoices SET "
                   + "booking_id=?, customer_name=?, room_number=?, "
                   + "check_in=?, check_out=?, room_amount=?, "
                   + "tax_amount=?, total_amount=?, payment_status=?, "
                   + "invoice_date=? "
                   + "WHERE id=?";

        try (
            Connection con = DBConnection.getConnection();
            PreparedStatement ps = con.prepareStatement(sql)
        ) {

            ps.setInt(1, invoice.getBookingId());
            ps.setString(2, invoice.getCustomerName());
            ps.setString(3, invoice.getRoomNumber());
            ps.setDate(4, invoice.getCheckIn());
            ps.setDate(5, invoice.getCheckOut());
            ps.setDouble(6, invoice.getRoomAmount());
            ps.setDouble(7, invoice.getTaxAmount());
            ps.setDouble(8, invoice.getTotalAmount());
            ps.setString(9, invoice.getPaymentStatus());
            ps.setDate(10, invoice.getInvoiceDate());
            ps.setInt(11, invoice.getId());

            return ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }


    // =========================
    // DELETE INVOICE
    // =========================

    public boolean deleteInvoice(int id) {

        String sql =
                "DELETE FROM invoices WHERE id=?";

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