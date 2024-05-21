/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import Model.Agency;
import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author tranm
 */
public class AgencyDAO extends DBContext {

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
            if(rs.next()) {
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

    public List<Agency> searchAgency(String key) {
        List<Agency> list = new ArrayList<>();
        String sql = "select * from Agencies Where AgencyName like '%" + key + "%'"
                + " OR AgencyAddress like '%" + key + "%' OR HotLine like '% " + key
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

    public static void main(String[] args) {
//        Agency a = new Agency();
//        a.setAgencyName("Agency Four");
//        a.setAgencyAddress("4 Agency Ave, HCMC");
//        a.setHotline(444444);
//        
        System.out.println(AgencyDAO.INSTANCE.getAgencyById(1));
    }
}
