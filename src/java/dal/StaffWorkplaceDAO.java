/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import Model.StaffWorkplace;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author tranm
 */
public class StaffWorkplaceDAO {
    
    public static StaffWorkplaceDAO INSTANCE = new StaffWorkplaceDAO();
    private Connection con;

    public StaffWorkplaceDAO() {
        if (INSTANCE == null) {
            con = new DBContext().connection;
        } else {
            INSTANCE = this;
        }
    }
    
    public List<StaffWorkplace> getAllStaffWorkplace() {
        List<StaffWorkplace> list = new ArrayList<>();
        String sql = "select * from Staff_Workplace";
        
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while(rs.next()) {
                StaffWorkplace sw = new StaffWorkplace();
                sw.setId(rs.getInt("swId"));
                sw.setAgencyId(rs.getInt("AgencyId"));
                sw.setStaffId(rs.getInt("StaffId"));
                sw.setStatus(rs.getString("status"));
                list.add(sw);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        
        return list;
    }
    
    public boolean insertStaffToAgency(int staffId, int agencyId) {
        String sql = "insert into Staff_Workplace(AgencyId, StaffId) values (?, ?)";
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
        System.out.println(StaffWorkplaceDAO.INSTANCE.getAllStaffWorkplace());
    }
    
}
