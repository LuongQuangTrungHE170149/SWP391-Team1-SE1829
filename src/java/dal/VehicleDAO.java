/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import Model.Vehicle;
import java.sql.*;

/**
 *
 * @author QUANG TRUNG
 */
public class VehicleDAO extends DBContext {
    public VehicleDAO INSTANCE = new VehicleDAO();
    private Connection con;

    public VehicleDAO() {
        con = new DBContext().connection;
    }
    
    public boolean addVehicle(Vehicle vehicle) throws SQLException {
        String sql = "INSERT INTO Vehicles (Model, LicensePlates, OwnerId) VALUES (?, ?, ?)";

        try {
             PreparedStatement statement = con.prepareStatement(sql);
            statement.setString(1, vehicle.getModel());
            statement.setString(2, vehicle.getLicensePlates());
            statement.setInt(3, vehicle.getOwnerId());

            statement.executeUpdate();
            return true;
        }catch(SQLException e){
            throw new SQLException();
            
        }
        
    }
    
    public static void main(String[] args) throws SQLException {
        VehicleDAO vd = new VehicleDAO();
        Vehicle vehicle = new Vehicle("YAMAHA GHI XÁM", "16k1-1860", 0);
        boolean result = vd.addVehicle(vehicle);
        System.out.println(result);
    }
}
