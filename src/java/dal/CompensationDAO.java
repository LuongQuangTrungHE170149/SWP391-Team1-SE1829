/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

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
            if(rs.next()) {
                total = rs.getInt("TotalCompensations");
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return total;
    }
    
    public static void main(String[] args) {
        System.out.println(CompensationDAO.INSTANCE.countCompensation());
    }
}
