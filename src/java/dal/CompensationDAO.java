/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import Model.Compensation;
import java.lang.reflect.Array;
import java.math.BigInteger;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

/**
 *
 * @author tranm
 */
public class CompensationDAO {

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
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                total = rs.getInt("TotalCompensations");
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return total;
    }

    public List<Compensation> getCompensationsByCusId(int id) {
        List<Compensation> list = new ArrayList<>();
        String sql = "Select * from Compensations where CustomerId = ?";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Compensation compensation = new Compensation();
                compensation.setId(rs.getInt("CompensationId"));
                compensation.setContractId(rs.getInt("ContractId"));
                compensation.setCustomerId(rs.getInt("CustomerId"));
                compensation.setCustomerId(rs.getInt("AccidentId"));
                compensation.setEstimatedRepairCost(BigInteger.valueOf(rs.getInt("EstimatedRepairCost")));
                compensation.setClaimStatus(rs.getString("ClaimStatus"));
                compensation.setDateFiled(rs.getDate("DateFiled"));
                compensation.setDateApproved(rs.getDate("DateApproved"));
                compensation.setPaymentAmount(BigInteger.valueOf(rs.getInt("PaymentAmount")));
                compensation.setPaymentDate(rs.getDate("PaymentDate"));
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
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                hash.put(rs.getString("ClaimStatus"), rs.getInt("CountOfCompensations"));
            }

        } catch (SQLException e) {
            System.out.println(e);
        }

        return hash;
    }

    public static void main(String[] args) {
        System.out.println(CompensationDAO.INSTANCE.countCompensationsByStatus());
    }
}
