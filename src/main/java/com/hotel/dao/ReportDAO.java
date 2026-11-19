package com.hotel.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.hotel.model.Report;
import com.hotel.util.DBConnection;

public class ReportDAO {

    public Report getReportData() {

        Report report = new Report();

        // =========================
        // TOTAL CUSTOMERS
        // =========================

        String customerSql =
                "SELECT COUNT(*) FROM customers";

        // =========================
        // TOTAL ROOMS
        // =========================

        String roomSql =
                "SELECT COUNT(*) FROM rooms";

        // =========================
        // AVAILABLE ROOMS
        // =========================

        String availableRoomSql =
                "SELECT COUNT(*) FROM rooms WHERE status='Available'";

        // =========================
        // OCCUPIED ROOMS
        // =========================

        String occupiedRoomSql =
                "SELECT COUNT(*) FROM rooms WHERE status='Occupied'";

        // =========================
        // TOTAL BOOKINGS
        // =========================

        String bookingSql =
                "SELECT COUNT(*) FROM bookings";

        // =========================
        // TOTAL PAYMENTS
        // =========================

        String paymentSql =
                "SELECT COUNT(*) FROM payments";

        // =========================
        // TOTAL INVOICES
        // =========================

        String invoiceSql =
                "SELECT COUNT(*) FROM invoices";

        // =========================
        // TOTAL REVENUE
        // =========================

        String revenueSql =
                "SELECT COALESCE(SUM(total_amount), 0) FROM invoices";


        try (Connection con = DBConnection.getConnection()) {


            // CUSTOMERS

            try (PreparedStatement ps =
                    con.prepareStatement(customerSql);
                 ResultSet rs = ps.executeQuery()) {

                if (rs.next()) {
                    report.setTotalCustomers(
                            rs.getInt(1)
                    );
                }
            }


            // ROOMS

            try (PreparedStatement ps =
                    con.prepareStatement(roomSql);
                 ResultSet rs = ps.executeQuery()) {

                if (rs.next()) {
                    report.setTotalRooms(
                            rs.getInt(1)
                    );
                }
            }


            // AVAILABLE ROOMS

            try (PreparedStatement ps =
                    con.prepareStatement(availableRoomSql);
                 ResultSet rs = ps.executeQuery()) {

                if (rs.next()) {
                    report.setAvailableRooms(
                            rs.getInt(1)
                    );
                }
            }


            // OCCUPIED ROOMS

            try (PreparedStatement ps =
                    con.prepareStatement(occupiedRoomSql);
                 ResultSet rs = ps.executeQuery()) {

                if (rs.next()) {
                    report.setOccupiedRooms(
                            rs.getInt(1)
                    );
                }
            }


            // BOOKINGS

            try (PreparedStatement ps =
                    con.prepareStatement(bookingSql);
                 ResultSet rs = ps.executeQuery()) {

                if (rs.next()) {
                    report.setTotalBookings(
                            rs.getInt(1)
                    );
                }
            }


            // PAYMENTS

            try (PreparedStatement ps =
                    con.prepareStatement(paymentSql);
                 ResultSet rs = ps.executeQuery()) {

                if (rs.next()) {
                    report.setTotalPayments(
                            rs.getInt(1)
                    );
                }
            }


            // INVOICES

            try (PreparedStatement ps =
                    con.prepareStatement(invoiceSql);
                 ResultSet rs = ps.executeQuery()) {

                if (rs.next()) {
                    report.setTotalInvoices(
                            rs.getInt(1)
                    );
                }
            }


            // REVENUE

            try (PreparedStatement ps =
                    con.prepareStatement(revenueSql);
                 ResultSet rs = ps.executeQuery()) {

                if (rs.next()) {
                    report.setTotalRevenue(
                            rs.getDouble(1)
                    );
                }
            }


        } catch (Exception e) {

            e.printStackTrace();
        }


        return report;
    }
}
