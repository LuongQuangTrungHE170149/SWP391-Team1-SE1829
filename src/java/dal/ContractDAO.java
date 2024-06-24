/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import Model.Contract;
import Model.User;
import Model.Vehicle;
import dto.Contractdto;
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
            stmt.setString(7, contract.getDescription());
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

    public boolean requestContract(Contract contract) {
        try {

            // Calculate End Date
            String sql = "INSERT INTO Contracts (CustomerId,  VehicleId, StartDate, EndDate, ContractType, [Description], Payment, status) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement stmt = con.prepareStatement(sql);

            stmt.setInt(1, contract.getCustomerId());
            stmt.setInt(2, contract.getVehicleId());
            stmt.setDate(3, contract.getStartDate());
            stmt.setDate(4, contract.getEndDate());
            stmt.setString(5, contract.getContractType());
            stmt.setString(6, contract.getDescription());
            stmt.setDouble(7, contract.getPayment());
            stmt.setString(8, contract.getStatus());

            stmt.executeUpdate();
            stmt.close();
            con.close();
            return true;

        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }

    }

    public Contract findContractByVehicleId(int vehicleId) {
        String sql = "SELECT * FROM Contracts WHERE VehicleId = ?";
        Contract contract = new Contract();
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, vehicleId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                contract.setContractId(rs.getInt("ContractId"));
                contract.setCustomerId(rs.getInt("CustomerId"));
                contract.setStaffId(rs.getInt("StaffId"));
                contract.setVehicleId(rs.getInt("VehicleId"));
                contract.setContractType("ContractType");
                contract.setStartDate(rs.getDate("StartDate"));
                contract.setEndDate(rs.getDate("EndDate"));
                contract.setDescription(rs.getString("Description"));
                contract.setPayment(rs.getDouble("Payment"));
                contract.setStatus(rs.getString("status"));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }

        return contract;
    }

    public Contract findContractByContractId(int contractId) {
        String sql = "SELECT * FROM Contracts WHERE ContractId = ?";
        Contract contract = new Contract();
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, contractId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                contract.setContractId(rs.getInt("ContractId"));
                contract.setCustomerId(rs.getInt("CustomerId"));
                contract.setStaffId(rs.getInt("StaffId"));
                contract.setVehicleId(rs.getInt("VehicleId"));
                contract.setContractType("ContractType");
                contract.setStartDate(rs.getDate("StartDate"));
                contract.setEndDate(rs.getDate("EndDate"));
                contract.setDescription(rs.getString("Description"));
                contract.setPayment(rs.getDouble("Payment"));
                contract.setStatus(rs.getString("status"));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }

        return contract;
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

    public List<Contract> getAllContract() {
        List<Contract> contracts = new ArrayList<>();
        String sql = "SELECT * FROM Contracts";

        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Contract contract = new Contract();
                contract.setContractId(rs.getInt("ContractId"));
                contract.setCustomerId(rs.getInt("CustomerId"));
                contract.setStaffId(rs.getInt("StaffId"));
                contract.setVehicleId(rs.getInt("VehicleId"));
                contract.setContractType(rs.getString("ContractType"));
                contract.setStartDate(rs.getDate("StartDate"));
                contract.setEndDate(rs.getDate("EndDate"));
                contract.setDescription(rs.getString("Description"));
                contract.setPayment(rs.getDouble("Payment"));
                contract.setStatus(rs.getString("Status"));
                contracts.add(contract);
            }
            rs.close();
            ps.close();
        } catch (SQLException e) {
            System.out.println(e);
        }

        return contracts;
    }

    public List<Contractdto> getAllContractDto() throws SQLException {
        List<Contractdto> contractdtos = new ArrayList<>();
        List<Contract> contracts = ContractDAO.INSTANCE.getAllContract();
        for (Contract contract : contracts) {
            Contractdto cdto = new Contractdto();
            Vehicle vehicle = VehicleDAO.INSTANCE.getVehicleById(contract.getVehicleId());
            UserDAO userDAO = new UserDAO();
            cdto.setContractId(contract.getContractId());
            cdto.setEndDate(contract.getEndDate());
            cdto.setCustomerName(userDAO.getCustomerName(contract.getCustomerId()));
            cdto.setStaffName(userDAO.getCustomerName(contract.getStaffId()));
            cdto.setMotocycleType(vehicle.getMotocycleType());
            cdto.setLicensePlates(vehicle.getLicensePlates());
            contractdtos.add(cdto);
        }

        return contractdtos;
    }

    public List<Contract> searchContractByPlates(String plates) {
        List<Contract> contracts = new ArrayList<>();
        String sql = "SELECT c.ContractId, c.VehicleId, c.CustomerId, c.StaffId, c.StartDate, c.EndDate, c.ContractType, c.[Description], c.Payment FROM Contracts c\n"
                + "JOIN Vehicles v ON c.VehicleId = v.MotocycleId\n"
                + "WHERE v.LicensePlates = ?;";

        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, plates);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Contract contract = new Contract();
                contract.setContractId(rs.getInt("ContractId"));
                contract.setVehicleId(rs.getInt("VehicleId"));
                contract.setCustomerId(rs.getInt("CustomerId"));
                contract.setStaffId(rs.getInt("StaffId"));
                contract.setStartDate(rs.getDate("StartDate"));
                contract.setEndDate(rs.getDate("EndDate"));
                contract.setContractType(rs.getString("ContractType"));
                contract.setDescription(rs.getString("Description"));
                contract.setPayment(rs.getDouble("Payment"));
                contracts.add(contract);

            }
        } catch (SQLException e) {
            System.out.println(e);
        }

        return contracts;
    }

    public static void main(String[] args) throws SQLException {
//        ContractDAO cd = new ContractDAO();
//        List<User> users = cd.getCustomer("jdoe");
        Date startDate = new Date(2024, 6, 12);
        Date endDate = new Date(2025, 6, 12);
        Contract contract = new Contract(2, 1, 3, startDate, endDate, "bắt buộc", "abcxya", 400000D, "Đang hiêu lực");
        System.out.println(ContractDAO.INSTANCE.findContractByContractId(3));
    }
}
