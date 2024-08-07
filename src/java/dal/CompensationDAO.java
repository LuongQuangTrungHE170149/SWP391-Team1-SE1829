/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import Model.Compensation;
import java.math.BigDecimal;
import java.math.BigInteger;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

/**
 *
 * @author tranm
 */
public class CompensationDAO extends DBContext {

    public static CompensationDAO INSTANCE = new CompensationDAO();
    private Connection con;

    public CompensationDAO() {
        if (INSTANCE == null) {
            con = new DBContext().connection;
        } else {
            INSTANCE = this;
        }
    }

    public int countCompensation() {
        String sql = "select count(*) as TotalCompensations from Compensations";
        int total = 0;

        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                total = rs.getInt("TotalCompensations");
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return total;
    }

    public List<Compensation> getCompensationsPending() {
        List<Compensation> list = new ArrayList<>();
        String sql = "select * from Compensations where ClaimStatus = 'pending'";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Compensation compensation = new Compensation();
                compensation.setId(rs.getInt("CompensationId"));
                compensation.setContractId(rs.getInt("ContractId"));
                compensation.setCustomerId(rs.getInt("CustomerId"));
                compensation.setStaffId(rs.getInt("StaffId"));
                compensation.setAccidentId(rs.getInt("AccidentId"));
                compensation.setEstimatedRepairCost(BigInteger.valueOf(rs.getInt("EstimatedRepairCost")));
                compensation.setClaimStatus(rs.getString("ClaimStatus"));
                compensation.setDateFiled(rs.getDate("DateFiled"));
                compensation.setDateApproved(rs.getDate("DateApproved"));
                compensation.setNotes(rs.getString("Notes"));
                list.add(compensation);
            }

        } catch (SQLException e) {
            System.out.println(e);
        }

        return list;
    }

    public List<Compensation> getListCompensationApprovedByStaff(int staffId) {
        List<Compensation> list = new ArrayList<>();
        String sql = "SELECT [CompensationId]\n"
                + "      ,[ContractId]\n"
                + "      ,[CustomerId]\n"
                + "      ,[StaffId]\n"
                + "      ,[AccidentId]\n"
                + "      ,[EstimatedRepairCost]\n"
                + "      ,[ClaimStatus]\n"
                + "      ,[DateFiled]\n"
                + "      ,[DateApproved]\n"
                + "      ,[Notes]\n"
                + "  FROM [dbo].[Compensations] where StaffId = ? order by DateApproved DESC";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, staffId);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Compensation compensation = new Compensation();
                compensation.setId(rs.getInt("CompensationId"));
                compensation.setContractId(rs.getInt("ContractId"));
                compensation.setCustomerId(rs.getInt("CustomerId"));
                compensation.setAccidentId(rs.getInt("AccidentId"));
                compensation.setEstimatedRepairCost(BigInteger.valueOf(rs.getInt("EstimatedRepairCost")));
                compensation.setClaimStatus(rs.getString("ClaimStatus"));
                compensation.setDateFiled(rs.getDate("DateFiled"));
                compensation.setDateApproved(rs.getDate("DateApproved"));
                compensation.setStaffId(rs.getInt("StaffId"));
                compensation.setNotes(rs.getString("Notes"));
                list.add(compensation);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Compensation> getCompensationsNotPending() {
        List<Compensation> list = new ArrayList<>();
        String sql = "select * from Compensations where ClaimStatus != 'pending' order by CompensationId DESC";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Compensation compensation = new Compensation();
                compensation.setId(rs.getInt("CompensationId"));
                compensation.setContractId(rs.getInt("ContractId"));
                compensation.setCustomerId(rs.getInt("CustomerId"));
                compensation.setStaffId(rs.getInt("StaffId"));
                compensation.setAccidentId(rs.getInt("AccidentId"));
                compensation.setEstimatedRepairCost(BigInteger.valueOf(rs.getInt("EstimatedRepairCost")));
                compensation.setClaimStatus(rs.getString("ClaimStatus"));
                compensation.setDateFiled(rs.getDate("DateFiled"));
                compensation.setDateApproved(rs.getDate("DateApproved"));
                compensation.setNotes(rs.getString("Notes"));
                list.add(compensation);
            }

        } catch (SQLException e) {
            System.out.println(e);
        }

        return list;
    }

    public List<Compensation> getCompensationsApproved() {
        List<Compensation> list = new ArrayList<>();
        String sql = "select * from Compensations where ClaimStatus != 'pending'";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Compensation compensation = new Compensation();
                compensation.setId(rs.getInt("CompensationId"));
                compensation.setContractId(rs.getInt("ContractId"));
                compensation.setCustomerId(rs.getInt("CustomerId"));
                compensation.setAccidentId(rs.getInt("AccidentId"));
                compensation.setEstimatedRepairCost(BigInteger.valueOf(rs.getInt("EstimatedRepairCost")));
                compensation.setClaimStatus(rs.getString("ClaimStatus"));
                compensation.setDateFiled(rs.getDate("DateFiled"));
                compensation.setDateApproved(rs.getDate("DateApproved"));
                compensation.setStaffId(rs.getInt("StaffId"));
                compensation.setNotes(rs.getString("Notes"));
                list.add(compensation);
            }

        } catch (SQLException e) {
            System.out.println(e);
        }

        return list;
    }

    public List<Compensation> getCompensationsByCusId(int id) {
        List<Compensation> list = new ArrayList<>();
        String sql = "Select * from Compensations where CustomerId = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Compensation compensation = new Compensation();
                compensation.setId(rs.getInt("CompensationId"));
                compensation.setContractId(rs.getInt("ContractId"));
                compensation.setCustomerId(rs.getInt("CustomerId"));
                compensation.setAccidentId(rs.getInt("AccidentId"));
                compensation.setEstimatedRepairCost(BigInteger.valueOf(rs.getInt("EstimatedRepairCost")));
                compensation.setClaimStatus(rs.getString("ClaimStatus"));
                compensation.setDateFiled(rs.getDate("DateFiled"));
                compensation.setDateApproved(rs.getDate("DateApproved"));
                compensation.setStaffId(rs.getInt("StaffId"));
                compensation.setNotes(rs.getString("Notes"));
                list.add(compensation);
            }

        } catch (SQLException e) {
            System.out.println(e);
        }

        return list;
    }

    public HashMap<String, Integer> countCompensationsByStatus() {
        HashMap<String, Integer> hash = new HashMap<>();
        String sql = "SELECT ClaimStatus, COUNT(*) AS CountOfCompensations FROM Compensations\n"
                + "WHERE ClaimStatus IN ('pending', 'approved', 'rejected') GROUP BY ClaimStatus;";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                hash.put(rs.getString("ClaimStatus"), rs.getInt("CountOfCompensations"));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }

        return hash;
    }

    public boolean insertCompensation(Compensation compensation) {
        String sql = "INSERT INTO Compensations (ContractId, CustomerId, AccidentId, EstimatedRepairCost, DateFiled)\n"
                + "VALUES (?, ?, ?, ?, ?);";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, compensation.getContractId());
            ps.setInt(2, compensation.getCustomerId());
            ps.setInt(3, compensation.getAccidentId());
            ps.setBigDecimal(4, new BigDecimal(compensation.getEstimatedRepairCost()));
            ps.setDate(5, compensation.getDateFiled());
            ps.executeUpdate();
            return true;
        } catch (SQLException e) {
            System.out.println(e);
        }

        return false;
    }

    public boolean updateStatusCompensation(Compensation compensation) {
        String sql = "Update Compensations set ClaimStatus = ? ,DateApproved = ?, Notes = ?, StaffId = ? where CompensationId = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, compensation.getClaimStatus());
            ps.setDate(2, compensation.getDateApproved());
            ps.setString(3, compensation.getNotes());
            ps.setInt(4, compensation.getStaffId());
            ps.setInt(5, compensation.getId());
            ps.executeUpdate();
            return true;
        } catch (SQLException e) {
            System.out.println(e);
        }

        return false;
    }

    public static void main(String[] args) {
        CompensationDAO c = new CompensationDAO();
        Compensation compensation = new Compensation();
        compensation.setCustomerId(3);
        compensation.setContractId(1);
        compensation.setAccidentId(1);
        compensation.setEstimatedRepairCost(new BigInteger("1000000"));
        LocalDate currentDate = LocalDate.now();
        Date sqlCurrentDate = Date.valueOf(currentDate);
        compensation.setDateFiled(sqlCurrentDate);
        System.out.println(c.insertCompensation(compensation));

    }
}
