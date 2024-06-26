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
    
    public static void main(String[] args) {
         Accident accident = new Accident();
        accident.setCustomerId(1);
        Date sqlDate = Date.valueOf("2021-12-12");
        accident.setDateOfAccident(sqlDate);
        accident.setAccidentLocation("Hà Nội");
        accident.setPoliceReportNumber("abc123");
        accident.setDescriptionOfAccident("nặng");
        accident.setVehicleDamage("Hư hại");
        accident.setImage("images/accidents_image/null.png");
        System.out.println(AccidentDAO.INSTANCE.insertAccident(accident));
    }

}
