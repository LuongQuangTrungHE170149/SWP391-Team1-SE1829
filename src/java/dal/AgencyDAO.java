/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import Model.Agency;
import java.math.BigInteger;
import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;

/**
 *
 * @author tranm
 */
public class AgencyDAO {

    public static AgencyDAO INSTANCE = new AgencyDAO();
    private Connection con;

    public AgencyDAO() {
        if (INSTANCE == null) {
            con = new DBContext().connection;
        } else {
            INSTANCE = this;
        }
    }

    public List<Agency> getAllAgencies() {
        List<Agency> list = new ArrayList<>();

        String sql = "select * from Agencies";

        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Agency agency = new Agency();
                agency.setAgencyId(rs.getInt("AgencyId"));
                agency.setAgencyName(rs.getString("AgencyName"));
                agency.setAgencyAddress(rs.getString("AgencyAddress"));
                agency.setHotline(rs.getString("HotLine"));
                agency.setWorktime(rs.getString("Worktime"));
                agency.setStatus(rs.getString("status"));
                list.add(agency);

            }

        } catch (SQLException e) {
            System.out.println(e);
        }

        return list;
    }

    public Agency getAgencieById(int agencyId) {
        String sql = "select * from Agencies where AgencyId = ? ";

        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, agencyId);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                Agency agency = new Agency();
                agency.setAgencyId(rs.getInt("AgencyId"));
                agency.setAgencyName(rs.getString("AgencyName"));
                agency.setAgencyAddress(rs.getString("AgencyAddress"));
                agency.setHotline(rs.getString("HotLine"));
                agency.setWorktime(rs.getString("Worktime"));
                agency.setStatus(rs.getString("status"));
                return agency;

            }

        } catch (SQLException e) {
            System.out.println(e);
        }

        return null;
    }

    public List<Agency> getAllAgenciesSortById() {
        List<Agency> list = new ArrayList<>();
        String sql = "select * from Agencies order by AgencyId desc";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Agency agency = new Agency();
                agency.setAgencyId(rs.getInt("AgencyId"));
                agency.setAgencyName(rs.getString("AgencyName"));
                agency.setAgencyAddress(rs.getString("AgencyAddress"));
                agency.setHotline(rs.getString("HotLine"));
                agency.setWorktime(rs.getString("Worktime"));
                agency.setStatus(rs.getString("status"));
                list.add(agency);

            }

        } catch (SQLException e) {
            System.out.println(e);
        }

        return list;
    }

    public Agency getAgencyById(int agencyId) {
        String sql = "select * from Agencies where AgencyId = ?";

        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, agencyId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                Agency agency = new Agency();
                agency.setAgencyId(rs.getInt("AgencyId"));
                agency.setAgencyName(rs.getString("AgencyName"));
                agency.setAgencyAddress(rs.getString("AgencyAddress"));
                agency.setHotline(rs.getString("HotLine"));
                agency.setWorktime(rs.getString("Worktime"));
                agency.setStatus(rs.getString("status"));
                return agency;
            }

        } catch (SQLException e) {
            System.out.println(e);
        }

        return null;
    }

    public List<Agency> getAllAgenciesByStatus(String key) {
        List<Agency> list = new ArrayList<>();
        String sql = "select * from Agencies where status = '" + key + "'";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Agency agency = new Agency();
                agency.setAgencyId(rs.getInt("AgencyId"));
                agency.setAgencyName(rs.getString("AgencyName"));
                agency.setAgencyAddress(rs.getString("AgencyAddress"));
                agency.setHotline(rs.getString("HotLine"));
                agency.setWorktime(rs.getString("Worktime"));
                agency.setStatus(rs.getString("status"));
                list.add(agency);

            }

        } catch (SQLException e) {
            System.out.println(e);
        }

        return list;
    }

    public BigInteger getTotalPaymentByAgencyId(int agencyId) {
        BigInteger total = BigInteger.ZERO;
        String sql = "SELECT SUM(c.Payment) AS TotalEarnings FROM Contracts c JOIN  Staff_Workplace sw ON c.StaffId = sw.StaffId\n"
                + "JOIN Agencies a ON sw.AgencyId = a.AgencyId WHERE a.AgencyId = ? GROUP BY sw.StaffId;";

        try {

            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, agencyId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                total = BigInteger.valueOf(rs.getInt("TotalEarnings"));
            }

        } catch (SQLException e) {
            System.out.println(e);
        }

        return total;
    }

    public HashMap<String, BigInteger> getMonthlyMoneyByAgency(int agencyId) {
        HashMap<String, BigInteger> hash = new HashMap<>();
        String sql = "SELECT MONTH(StartDate) AS Month, SUM(Payment) AS TotalRevenue FROM Contracts\n"
                + "WHERE AgencyId = ? GROUP BY  MONTH(StartDate) ORDER BY  Month";

        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, agencyId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                hash.put(rs.getString("Month"), BigInteger.valueOf(rs.getInt("TotalRevenue")));

            }
        } catch (SQLException e) {
            System.out.println(e);
        }

        return hash;

    }

    public HashMap<Integer, String> getStaffByAgency() {
        HashMap<Integer, String> hash = new HashMap<>();
        String sql = "select sw.StaffId, a.AgencyName from Staff_Workplace sw join Agencies a on sw.AgencyId = a.AgencyId";

        try {

            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                hash.put(rs.getInt("StaffId"), rs.getString("AgencyName"));

            }

        } catch (SQLException e) {
            System.out.println(e);
        }

        return hash;
    }

    public int countAgency() {
        String sql = "select count(*) as TotalAgency  from Agencies";
        int total = 0;

        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                total = rs.getInt("TotalAgency");
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return total;
    }

    public BigInteger totalPayment() {
        BigInteger total = BigInteger.ZERO;
        String sql = "SELECT SUM(Payment) AS TotalPayment FROM Contracts;";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                total = BigInteger.valueOf(rs.getInt("TotalPayment"));
            }

        } catch (Exception e) {
            System.out.println(e);
        }

        return total;
    }

    public HashMap<String, BigInteger> getMonthlyMoney() {
        HashMap<String, BigInteger> hash = new HashMap<>();
        String sql = "SELECT MONTH(createDate) AS Month, SUM(Payment) AS TotalRevenue FROM Contracts GROUP BY  MONTH(createDate) ORDER BY Month";

        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                hash.put(rs.getString("Month"), BigInteger.valueOf(rs.getInt("TotalRevenue")));

            }
        } catch (SQLException e) {
            System.out.println(e);
        }

        return hash;

    }

    public boolean insertAgency(Agency agency) {
        String sql = "INSERT INTO Agencies (AgencyName, AgencyAddress,Worktime, HotLine) VALUES (?,?, ?, ?)";

        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, agency.getAgencyName());
            ps.setString(2, agency.getAgencyAddress());
            ps.setString(3, agency.getWorktime());
            ps.setString(4, agency.getHotline());
            ps.executeUpdate();
            return true;
        } catch (SQLException e) {
            System.out.println(e);
        }

        return false;
    }

    public boolean updateAgencyById(int agencyId, Agency agency) {
        String sql = "Update Agencies SET AgencyName = ?, AgencyAddress = ?, HotLine = ?, Worktime = ?, [status] = ? where AgencyId = ?";
        boolean check = false;
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, agency.getAgencyName());
            ps.setString(2, agency.getAgencyAddress());
            ps.setString(3, agency.getHotline());
            ps.setString(4, agency.getWorktime());
            ps.setString(5, agency.getStatus());
            ps.setInt(6, agencyId);
            check = true;
            ps.executeQuery();

        } catch (SQLException e) {
            System.out.println(e);
        }

        return check;
    }

    public List<Agency> searchAgency(String key) {
        List<Agency> list = new ArrayList<>();
        String sql = "select * from Agencies Where AgencyName like N'%" + key + "%'"
                + " OR AgencyAddress like N'%" + key + "%' OR HotLine like '%" + key
                + "%' OR Worktime like '%" + key + "%'";

        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Agency agency = new Agency();
                agency.setAgencyId(rs.getInt("AgencyId"));
                agency.setAgencyName(rs.getString("AgencyName"));
                agency.setAgencyAddress(rs.getString("AgencyAddress"));
                agency.setHotline(rs.getString("HotLine"));
                agency.setWorktime(rs.getString("Worktime"));
                agency.setStatus(rs.getString("status"));
                list.add(agency);

            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public boolean setInactiveAgency(int agencyId, int action) {

        String sql;
        if (action == 1) {
            sql = "Update Agencies set [status] = 'inactive' where AgencyId = ?";
        } else {
            sql = "Update Agencies set [status] = 'active' where AgencyId = ?";
        }
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, agencyId);
            ps.executeUpdate();

            return true;

        } catch (SQLException e) {
            System.out.println(e);
        }

        return false;
    }

    public boolean changeWorkPlaceByStaffId(int staffId, int agencyId) {
        String sql = "Update Staff_Workplace SET AgencyId = ? where StaffId = ?";

        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, agencyId);
            ps.setInt(2, staffId);
            ps.executeUpdate();
            return true;
        } catch (SQLException e) {
            System.out.println(e);
        }

        return false;
    }

    public static void main(String[] args) {
//        Agency a = new Agency();
//        a.setAgencyName("Agency Four");
//        a.setAgencyAddress("4 Agency Ave, HCMC");
//        a.setHotline(444444);
//        
        System.out.println(AgencyDAO.INSTANCE.totalPayment());
    }
}
