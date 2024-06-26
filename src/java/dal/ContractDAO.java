/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import Model.Contract;
import Model.User;
import Model.Vehicle;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author QUANG TRUNG
 */
public class ContractDAO extends DBContext {

    public List<User> getCustomer(String name) {
        List<User> customers = new ArrayList<>();
        try {

            String sql = "SELECT * FROM Users WHERE firstName LIKE ? OR lastName LIKE ?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, "%" + name + "%");
            statement.setString(2, "%" + name + "%");
            ResultSet rs = statement.executeQuery();

            while (rs.next()) {
                User customer = new User();
                customer.setFirstName(rs.getString("firstName"));
                customer.setLastName(rs.getString("lastName"));
            }

            connection.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return customers;
    }

    public boolean addContract(Contract contract) {
        String sql = "INSERT INTO [dbo].[Contracts]\n"
                + "           ([CustomerId]\n"
                + "           ,[StaffId]\n"
                + "           ,[VehicleId]\n"
                + "           ,[StartDate]\n"
                + "           ,[EndDate]\n"
                + "           ,[isAccidentInsurance]\n"
                + "           ,[Description]\n"
                + "           ,[Code]\n"
                + "           ,[Payment]\n"
                + "           ,[status])\n"
                + "     VALUES\n"
                + "           (?,?,?,?,?,?,?,?,?,?)";
        try {
            PreparedStatement stmt = connection.prepareStatement(sql);
            stmt.setInt(1, contract.getCustomer().getId());
            
            int staffId=0;
            if(contract.getStaff() != null){
                staffId = contract.getStaff().getId();
            }
            stmt.setInt(2, staffId);
            stmt.setInt(3, contract.getVehicle().getId());
            stmt.setDate(4, contract.getStartDate());
            stmt.setDate(5, contract.getEndDate());
            stmt.setBoolean(6, contract.isIsAccidentInsurance());
            stmt.setString(7, contract.getDescription());
            stmt.setString(8, contract.getCode());
            stmt.setDouble(9, contract.getPayment());
            stmt.setString(10, contract.getStatus());
            stmt.executeUpdate();
            stmt.close();
            connection.close();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public Contract getContractByCode(String contractCode) {
        String sql = "SELECT [ContractId]\n"
                + "      ,[CustomerId]\n"
                + "      ,[StaffId]\n"
                + "      ,[VehicleId]\n"
                + "      ,[StartDate]\n"
                + "      ,[EndDate]\n"
                + "      ,[isAccidentInsurance]\n"
                + "      ,[Description]\n"
                + "      ,[Code]\n"
                + "      ,[Payment]\n"
                + "      ,[createDate]\n"
                + "      ,[status]\n"
                + "  FROM [dbo].[Contracts] where Code = ?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, contractCode);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Contract c = new Contract();
                c.setCode(contractCode);
                c.setContractId(rs.getInt("ContractId"));

                UserDAO udb = new UserDAO();
                User customer = udb.getUserById(rs.getInt("CustomerId"));
                c.setCustomer(customer);

                User staff = udb.getUserById(rs.getInt("StaffId"));
                c.setStaff(staff);

                VehicleDAO vdb = new VehicleDAO();
                Vehicle v = vdb.getVehicleById(rs.getInt("VehicleId"));
                c.setVehicle(v);
                c.setStartDate(rs.getDate("startDate"));
                c.setEndDate(rs.getDate("endDate"));
                c.setIsAccidentInsurance(rs.getBoolean("isAccidentInsurance"));
                c.setDescription(rs.getString("Description"));
                c.setCode(rs.getString("Code"));
                c.setPayment(rs.getDouble("Payment"));
                c.setCreateDate(rs.getDate("createDate"));
                c.setStatus(rs.getString("status"));

                return c;
            }
        } catch (SQLException e) {
            System.out.println(e);
        } catch (NullPointerException en) {
            System.out.println(en);
        }

        return null;
    }

    public boolean requestContract(Contract contract) {
        String sql = "INSERT INTO [dbo].[Contracts]\n"
                + "           ([CustomerId]\n"
                + "           ,[StaffId]\n"
                + "           ,[VehicleId]\n"
                + "           ,[StartDate]\n"
                + "           ,[EndDate]\n"
                + "           ,[isAccidentInsurance]\n"
                + "           ,[Description]\n"
                + "           ,[Code]\n"
                + "           ,[Payment]\n"
                + "           ,[status])\n"
                + "     VALUES\n"
                + "           (?,?,?,?,?,?,?,?,?,?)";
        try {
            // Calculate End Date
            PreparedStatement stmt = connection.prepareStatement(sql);
            stmt.setInt(1, contract.getCustomerId());
            stmt.setInt(2, contract.getStaffId());
            stmt.setInt(3, contract.getVehicle().getId());
            stmt.setDate(4, contract.getStartDate());
            stmt.setDate(5, contract.getEndDate());
            stmt.setBoolean(6, contract.isIsAccidentInsurance());
            stmt.setString(7, contract.getDescription());
            stmt.setString(8, contract.getCode());
            stmt.setDouble(9, contract.getPayment());
            stmt.setString(10, contract.getStatus());
            stmt.executeUpdate();
            stmt.close();
            connection.close();
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
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, vehicleId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                contract.setContractId(rs.getInt("ContractId"));
                contract.setCustomerId(rs.getInt("CustomerId"));
                contract.setStaffId(rs.getInt("StaffId"));
                VehicleDAO vdb = new VehicleDAO();
                Vehicle v = vdb.getVehicleById(rs.getInt("VehicleId"));
                contract.setVehicle(v);
                contract.setIsAccidentInsurance(rs.getBoolean("isAccidentInsurance"));
                contract.setStartDate(rs.getDate("StartDate"));
                contract.setEndDate(rs.getDate("EndDate"));
                contract.setDescription(rs.getString("Description"));
                contract.setCode(rs.getString("Code"));
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
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, contractId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                contract.setContractId(rs.getInt("ContractId"));
                contract.setCustomerId(rs.getInt("CustomerId"));
                contract.setStaffId(rs.getInt("StaffId"));
                VehicleDAO vdb = new VehicleDAO();
                Vehicle v = vdb.getVehicleById(rs.getInt("VehicleId"));
                contract.setVehicle(v);
                contract.setIsAccidentInsurance(rs.getBoolean("isAccidentInsurance"));
                contract.setStartDate(rs.getDate("StartDate"));
                contract.setEndDate(rs.getDate("EndDate"));
                contract.setDescription(rs.getString("Description"));
                contract.setCode(rs.getString("Code"));
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
            PreparedStatement ps = connection.prepareStatement(sql);
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
            PreparedStatement ps = connection.prepareStatement(sql);
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
            PreparedStatement ps = connection.prepareStatement(sql);
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
            PreparedStatement ps = connection.prepareStatement(sql);
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

    public List<Contract> getAll() {
        List<Contract> list = new ArrayList<>();
        String sql = "SELECT [ContractId]\n"
                + "      ,[CustomerId]\n"
                + "      ,[StaffId]\n"
                + "      ,[VehicleId]\n"
                + "      ,[StartDate]\n"
                + "      ,[EndDate]\n"
                + "      ,[isAccidentInsurance]\n"
                + "      ,[Description]\n"
                + "      ,[Code]\n"
                + "      ,[Payment]\n"
                + "      ,[createDate]\n"
                + "      ,[status]\n"
                + "  FROM [dbo].[Contracts]";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Contract c = new Contract();
                c.setCode(rs.getString("Code"));
                c.setContractId(rs.getInt("ContractId"));
                c.setStaffId(rs.getInt("StaffId"));

                VehicleDAO vdb = new VehicleDAO();
                Vehicle v = vdb.getVehicleById(rs.getInt("VehicleId"));
                c.setVehicle(v);
                c.setStartDate(rs.getDate("startDate"));
                c.setEndDate(rs.getDate("endDate"));
                c.setIsAccidentInsurance(rs.getBoolean("isAccidentInsurance"));
                c.setDescription(rs.getString("Description"));
                c.setCode(rs.getString("Code"));
                c.setPayment(rs.getDouble("Payment"));
                c.setCreateDate(rs.getDate("createDate"));
                c.setStatus(rs.getString("status"));

                list.add(c);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Contract> searchContractByPlates(String plates) {
        List<Contract> contracts = new ArrayList<>();
        String sql = "SELECT c.ContractId, c.VehicleId, c.CustomerId, c.StaffId, c.StartDate, c.EndDate, c.ContractType, c.[Description], c.Payment FROM Contracts c\n"
                + "JOIN Vehicles v ON c.VehicleId = v.MotocycleId\n"
                + "WHERE v.LicensePlates = ?;";

        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, plates);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Contract contract = new Contract();
                contract.setContractId(rs.getInt("ContractId"));
                VehicleDAO vdb = new VehicleDAO();
                Vehicle v = vdb.getVehicleById(rs.getInt("VehicleId"));
                contract.setVehicle(v);
                contract.setIsAccidentInsurance(rs.getBoolean("isAccidentInsurance"));
                contract.setCustomerId(rs.getInt("CustomerId"));
                contract.setStaffId(rs.getInt("StaffId"));
                contract.setStartDate(rs.getDate("StartDate"));
                contract.setEndDate(rs.getDate("EndDate"));
                contract.setDescription(rs.getString("Description"));
                contract.setCode(rs.getString("Code"));
                contract.setPayment(rs.getDouble("Payment"));
                contracts.add(contract);

            }
        } catch (SQLException e) {
            System.out.println(e);
        }

        return contracts;
    }

    public Contract checkContractByCustomerId(int contractId, int customerId) {
        String sql = "select * from Contracts where ContractId = ? and CustomerId = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, contractId);
            ps.setInt(2, customerId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                Contract contract = new Contract();
                contract.setContractId(rs.getInt("ContractId"));
                return contract;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }

        return null;
    }

    public static void main(String[] args) {
        ContractDAO cd = new ContractDAO();

        System.out.println(cd.getContractByCode("EM0XCP14UH80").getCustomer().getFirstName());

    }
}
