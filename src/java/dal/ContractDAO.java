/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import Model.Contract;
import Model.User;
import java.math.BigInteger;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.sql.Date;
import java.util.List;

/**
 *
 * @author QUANG TRUNG
 */
public class ContractDAO extends DBContext {

    public static ContractDAO INSTANCE = new ContractDAO();
    private Connection con;

    public ContractDAO() {
        if (INSTANCE == null) {
            con = new DBContext().connection;
        } else {
            INSTANCE = this;
        }
    }

    public List<User> getCustomer(String name) {
        List<User> customers = new ArrayList<>();
        try {

            String sql = "SELECT * FROM Users WHERE firstName LIKE ? OR lastName LIKE ?";
            PreparedStatement statement = con.prepareStatement(sql);
            statement.setString(1, "%" + name + "%");
            statement.setString(2, "%" + name + "%");
            ResultSet rs = statement.executeQuery();

            while (rs.next()) {
                User customer = new User();
                customer.setFirstName(rs.getString("firstName"));
                customer.setLastName(rs.getString("lastName"));
            }

            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return customers;
    }

    public boolean addContract(Contract contract) {
        try {

            // Calculate End Date
            String sql = "INSERT INTO Contracts (CustomerId, StaffId, VehicleId, StartDate, EndDate, ContractType, [Description], Payment, status) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement stmt = con.prepareStatement(sql);

            stmt.setInt(1, contract.getCustomerId());
            stmt.setInt(2, contract.getStaffId());            
            stmt.setInt(3, contract.getVehicleId());
            stmt.setDate(4, contract.getStartDate());
            stmt.setDate(5, contract.getEndDate());
            stmt.setString(6, contract.getContractType());
            stmt.setString(7, contract.getDescripttion());
            stmt.setDouble(8, contract.getPayment());
            stmt.setString(9, contract.getStatus());

            stmt.executeUpdate();
            stmt.close();
            con.close();
            return true;

        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }

    }

    public int countContracts() {
        String sql = "select count(*) as totalContracts from Contracts";
        int total = 0;

        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                total = rs.getInt("totalContracts");
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return total;
    }

    public HashMap<String, Integer> countIsPay() {
        HashMap<String, Integer> hash = new HashMap<>();
        String sql = "SELECT CASE  WHEN IsPay = 1 THEN 'Paid'  ELSE 'Unpaid' END AS PaymentStatus,\n"
                + "COUNT(*) AS Count FROM Contracts GROUP BY IsPay;";

        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                hash.put(rs.getString("PaymentStatus"), rs.getInt("Count"));
            }

        } catch (SQLException e) {
            System.out.println(e);
        }

        return hash;
    }

    public int countContractByCustomer(int customerId) {
        int total = 0;
        String sql = " select  Count(*) as TotalContract from Contracts where CustomerId = ?";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, customerId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                total = rs.getInt("TotalContract");
            }
        } catch (SQLException e) {
            System.out.println(e);
        }

        return total;
    }

    public int countIsPayByCustomer(int customerId) {
        int total = 0;
        String sql = "select count(*) as IsPay from Contracts where CustomerId = ? and IsPay = 0";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, customerId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                total = rs.getInt("IsPay");
            }
        } catch (SQLException e) {
            System.out.println(e);
        }

        return total;
    }

    public int countNotIsPayByCustomer(int customerId) {
        int total = 0;
        String sql = "select count(*) as IsPay from Contracts where CustomerId = ? and IsPay = 1";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, customerId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                total = rs.getInt("IsPay");
            }
        } catch (SQLException e) {
            System.out.println(e);
        }

        return total;
    }

    public static void main(String[] args) {
//        ContractDAO cd = new ContractDAO();
//        List<User> users = cd.getCustomer("jdoe");
        Date startDate = new Date(2024, 6, 12);
        Date endDate = new Date(2025, 6, 12);
        Contract contract = new Contract(2,1,3, startDate, endDate, "bắt buộc", "abcxya", 400000D, "Đang hiêu lực");
        ContractDAO.INSTANCE.addContract(contract);
    }
}
