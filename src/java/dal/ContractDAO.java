/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import Model.Contract;
import Model.Promotion;
import Model.User;
import Model.Vehicle;
import dto.Contractdto;
import java.math.BigInteger;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.sql.Date;
import java.util.HashMap;
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
     public Contract findLastContract() {
        String sql = "SELECT top 1[ContractId]\n"
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
                + "  FROM [dbo].[Contracts] Order by createDate DESC";
        UserDAO userDAO = new UserDAO();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Contract c = new Contract();
                c.setCode(rs.getString("Code"));
                c.setContractId(rs.getInt("ContractId"));

                User customer = userDAO.getUserById(rs.getInt("CustomerId"));

                c.setCustomer(customer);

                User staff = new User();
                staff.setId(rs.getInt("StaffId"));
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
        }
        return null;
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

            int staffId = 0;
            if (contract.getStaff() != null) {
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
                + "  FROM [dbo].[Contracts] Order by createDate DESC";
        UserDAO userDAO = new UserDAO();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Contract c = new Contract();
                c.setCode(rs.getString("Code"));
                c.setContractId(rs.getInt("ContractId"));

                User customer = userDAO.getUserById(rs.getInt("CustomerId"));

                c.setCustomer(customer);

                User staff = new User();
                staff.setId(rs.getInt("StaffId"));
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

                list.add(c);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Contract> getListContractByStaff(int id) {
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
                + "  FROM [dbo].[Contracts] where StaffId = ? ORDER BY createDate DESC";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Contract c = new Contract();
                c.setCode(rs.getString("Code"));
                c.setContractId(rs.getInt("ContractId"));

                User customer = new User();
                customer.setId(rs.getInt("CustomerId"));
                c.setCustomer(customer);

                User staff = new User();
                UserDAO udb = new UserDAO();
                staff = udb.getUserById(id);
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

                list.add(c);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Contract> getContractByCustomerId(int id) {
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
                + "  FROM [dbo].[Contracts] WHERE CustomerId = ? order by ContractId DESC";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Contract c = new Contract();
                c.setCode(rs.getString("Code"));
                c.setContractId(rs.getInt("ContractId"));

                User customer = new User();
                UserDAO udb = new UserDAO();
                customer = udb.getUserById(rs.getInt("CustomerId"));
                c.setCustomer(customer);

                User staff = new User();
                staff = udb.getUserById(rs.getInt("StaffId"));
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

                list.add(c);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
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

    public Contract getContractById(int id) {
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
                + "  FROM [dbo].[Contracts] where ContractId = ?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Contract c = new Contract();
                c.setCode(rs.getString("Code"));
                c.setContractId(id);

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

    public HashMap<String, BigInteger> getMonthlyMoneyByStaff(int StaffId) {
        HashMap<String, BigInteger> hash = new HashMap<>();
        String sql = "SELECT MONTH(createDate) AS Month, SUM(Payment) AS TotalRevenue FROM Contracts Where StaffId = ? GROUP BY  MONTH(createDate) ORDER BY Month";

        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, StaffId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                hash.put(rs.getString("Month"), BigInteger.valueOf(rs.getInt("TotalRevenue")));

            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return hash;

    }

    public Contract checkContractByCustomerId(String code, int customerId) {
        String sql = "select * from Contracts where Code = ? and CustomerId = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, code);
            ps.setInt(2, customerId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                Contract contract = new Contract();
                contract.setContractId(rs.getInt("ContractId"));
                contract.setStatus(rs.getString("status"));
                return contract;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public void updateContract(int contractId, Date startDate, Date endDate, String description, String status, Double payment) {

        try {
            String sql = "UPDATE contracts SET startDate=?, endDate=?, description=?, status=?, payment=? WHERE contractId=?";

            PreparedStatement stmt = connection.prepareStatement(sql);

            // Đặt các tham số vào câu lệnh SQL
            stmt.setDate(1, startDate);
            stmt.setDate(2, endDate);
            stmt.setString(3, description);
            stmt.setString(4, status);
            stmt.setDouble(5, payment);
            stmt.setInt(6, contractId);

            // Thực thi câu lệnh SQL
            int rowsUpdated = stmt.executeUpdate();

            if (rowsUpdated > 0) {
                System.out.println("Đã cập nhật hợp đồng có ID " + contractId);
            } else {
                System.out.println("Không tìm thấy hợp đồng để cập nhật");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public boolean updateContractStatus(int contractId, String newStatus, int staffId) throws SQLException {
        // Cập nhật trạng thái hợp đồng trong database
        String query = "UPDATE contracts SET status = ?, StaffId = ? WHERE contractId = ?";
        try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setString(1, newStatus);
            preparedStatement.setInt(2, staffId);
            preparedStatement.setInt(3, contractId);

            int rowsAffected = preparedStatement.executeUpdate();
            return rowsAffected > 0;
        }
    }

    public List<Contract> getAllContractByStatus(String status) {
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
                + "  FROM [dbo].[Contracts] where status = ? Order by createDate DESC";
        UserDAO userDAO = new UserDAO();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, status);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Contract c = new Contract();
                c.setCode(rs.getString("Code"));
                c.setContractId(rs.getInt("ContractId"));

                User customer = userDAO.getUserById(rs.getInt("CustomerId"));

                c.setCustomer(customer);

                User staff = new User();
                staff.setId(rs.getInt("StaffId"));
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

                list.add(c);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Contract> searchContracts(String searchQuery, String statusFilter) {
        List<Contract> contracts = new ArrayList<>();
        String sql = "SELECT * FROM Contracts WHERE 1=1";

        if (searchQuery != null && !searchQuery.isEmpty()) {
            sql += " AND Code LIKE ? ";
        }
        if (statusFilter != null && !statusFilter.isEmpty()) {
            sql += " AND status = ?";
        }

        UserDAO userDAO = new UserDAO();
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {

            int paramIndex = 1;
            if (searchQuery != null && !searchQuery.isEmpty()) {
                stmt.setString(paramIndex++, "%" + searchQuery + "%");

            }
            if (statusFilter != null && !statusFilter.isEmpty()) {
                stmt.setString(paramIndex++, statusFilter);
            }

            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                Contract c = new Contract();

                c.setCode(rs.getString("Code"));
                c.setContractId(rs.getInt("ContractId"));

                User customer = userDAO.getUserById(rs.getInt("CustomerId"));

                c.setCustomer(customer);

                User staff = new User();
                staff.setId(rs.getInt("StaffId"));
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

                contracts.add(c);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return contracts;
    }

    public boolean isLicensePlateActive(String licensePlate) {
        boolean activeContractExists = false;

        String sql = "SELECT COUNT(*) FROM Contracts c JOIN Vehicles v ON c.VehicleId = v.id WHERE v.LicensePlates = ? AND c.status = 'Approved' AND c.EndDate > CAST(GETDATE() AS DATE)";

        try (PreparedStatement statement = connection.prepareStatement(sql)) {

            statement.setString(1, licensePlate);

            try (ResultSet resultSet = statement.executeQuery()) {
                if (resultSet.next()) {
                    int count = resultSet.getInt(1);
                    activeContractExists = count > 0;
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return activeContractExists;
    }

    public static void main(String[] args) {
        ContractDAO cd = new ContractDAO();

        System.out.println(cd.isLicensePlateActive("16k11860"));

    }

}
