package com.hotel.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.hotel.model.Customer;
import com.hotel.util.DBConnection;

public class CustomerDAO {

    // =====================================================
    // ADD CUSTOMER
    // =====================================================

    public boolean addCustomer(Customer customer) {

        String sql =
                "INSERT INTO customers " +
                "(name, phone, email, address, id_proof, id_proof_number) " +
                "VALUES (?, ?, ?, ?, ?, ?)";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, customer.getName());
            ps.setString(2, customer.getPhone());
            ps.setString(3, customer.getEmail());
            ps.setString(4, customer.getAddress());
            ps.setString(5, customer.getIdProof());
            ps.setString(6, customer.getIdProofNumber());

            return ps.executeUpdate() > 0;

        } catch (Exception e) {

            e.printStackTrace();
            return false;
        }
    }


    // =====================================================
    // GET ALL CUSTOMERS
    // =====================================================

    public List<Customer> getAllCustomers() {

        List<Customer> customers = new ArrayList<>();

        String sql =
                "SELECT * FROM customers ORDER BY id DESC";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {

                Customer customer = new Customer();

                customer.setId(
                        rs.getInt("id")
                );

                customer.setName(
                        rs.getString("name")
                );

                customer.setPhone(
                        rs.getString("phone")
                );

                customer.setEmail(
                        rs.getString("email")
                );

                customer.setAddress(
                        rs.getString("address")
                );

                customer.setIdProof(
                        rs.getString("id_proof")
                );

                customer.setIdProofNumber(
                        rs.getString("id_proof_number")
                );

                customers.add(customer);
            }

        } catch (Exception e) {

            e.printStackTrace();
        }

        return customers;
    }


    // =====================================================
    // GET CUSTOMER BY ID
    // =====================================================

    public Customer getCustomerById(int id) {

        Customer customer = null;

        String sql =
                "SELECT * FROM customers WHERE id = ?";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, id);

            try (ResultSet rs = ps.executeQuery()) {

                if (rs.next()) {

                    customer = new Customer();

                    customer.setId(
                            rs.getInt("id")
                    );

                    customer.setName(
                            rs.getString("name")
                    );

                    customer.setPhone(
                            rs.getString("phone")
                    );

                    customer.setEmail(
                            rs.getString("email")
                    );

                    customer.setAddress(
                            rs.getString("address")
                    );

                    customer.setIdProof(
                            rs.getString("id_proof")
                    );

                    customer.setIdProofNumber(
                            rs.getString("id_proof_number")
                    );
                }
            }

        } catch (Exception e) {

            e.printStackTrace();
        }

        return customer;
    }


    // =====================================================
    // UPDATE CUSTOMER
    // =====================================================

    public boolean updateCustomer(Customer customer) {

        String sql =
                "UPDATE customers SET " +
                "name = ?, " +
                "phone = ?, " +
                "email = ?, " +
                "address = ?, " +
                "id_proof = ?, " +
                "id_proof_number = ? " +
                "WHERE id = ?";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, customer.getName());
            ps.setString(2, customer.getPhone());
            ps.setString(3, customer.getEmail());
            ps.setString(4, customer.getAddress());
            ps.setString(5, customer.getIdProof());
            ps.setString(6, customer.getIdProofNumber());
            ps.setInt(7, customer.getId());

            return ps.executeUpdate() > 0;

        } catch (Exception e) {

            e.printStackTrace();
            return false;
        }
    }


    // =====================================================
    // DELETE CUSTOMER
    // =====================================================

    public boolean deleteCustomer(int id) {

        String sql =
                "DELETE FROM customers WHERE id = ?";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, id);

            return ps.executeUpdate() > 0;

        } catch (Exception e) {

            e.printStackTrace();
            return false;
        }
    }
}