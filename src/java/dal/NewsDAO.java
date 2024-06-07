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
public class NewsDAO {
    public static NewsDAO INSTANCE = new NewsDAO();
    private Connection con;

    public NewsDAO() {
        if (INSTANCE == null) {
            con = new DBContext().connection;
        } else {
            INSTANCE = this;
        }
    }
    
    public int countNews () {
        int total = 0;
        String sql = "select count(*)  as CountNews from News";
        
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            if(rs.next()) {
                total = rs.getInt("CountNews");
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        
        return total;
    }
    
    
}
