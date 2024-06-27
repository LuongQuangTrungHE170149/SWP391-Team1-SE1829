/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import Model.Accident;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author tranm
 */
public class AccidentDAO {

    public static AccidentDAO INSTANCE = new AccidentDAO();
    private Connection con;

    public AccidentDAO() {
        if (INSTANCE == null) {
            con = new DBContext().connection;
        } else {
            INSTANCE = this;
        }
    }

    public int insertAccident(Accident acc) {
        int id = 0;
        String sql = "INSERT INTO Accidents (CustomerId, DateOfAccident, AccidentLocation, PoliceReportNumber, DescriptionOfAccident, VehicleDamage, image)\n"
                + "VALUES (?, ?, ?, ?, ?, ?, ?);";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, acc.getCustomerId());
            ps.setDate(2, acc.getDateOfAccident());
            ps.setString(3, acc.getAccidentLocation());
            ps.setString(4, acc.getPoliceReportNumber());
            ps.setString(5, acc.getDescriptionOfAccident());
            ps.setString(6, acc.getVehicleDamage());
            ps.setString(7, acc.getImage());
            ps.executeUpdate();
            String sql2 = "select top 1 AccidentId from Accidents order by AccidentId desc";
            PreparedStatement ps2 = con.prepareStatement(sql2);
            ResultSet rs = ps2.executeQuery();
            if(rs.next()) {
                id = rs.getInt("AccidentId");
            }

        } catch (SQLException e) {
            System.out.println(e);
        }

        return id;
    }
    
    public List<Accident> getAllAccidents () { 
        List<Accident> list = new ArrayList<>();
        String sql = "select * from accidents";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while(rs.next()) {
                Accident accident = new Accident();
                accident.setId(rs.getInt("AccidentId"));
                accident.setCustomerId(rs.getInt("CustomerId"));
                accident.setDateOfAccident(rs.getDate("DateOfAccident"));
                accident.setAccidentLocation(rs.getString("AccidentLocation"));
                accident.setPoliceReportNumber(rs.getString("PoliceReportNumber"));
                accident.setDescriptionOfAccident(rs.getString("DescriptionOfAccident"));
                accident.setVehicleDamage(rs.getString("vehicleDamage"));
                accident.setImage(rs.getString("image"));
                list.add(accident);
            }
            
        } catch (SQLException e) {
            System.out.println(e);
        }
        
        
        
        return list;
    }
    
    public static void main(String[] args) {

        System.out.println(AccidentDAO.INSTANCE.getAllAccidents());
    }

}
