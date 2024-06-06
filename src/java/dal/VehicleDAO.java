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

    public static VehicleDAO INSTANCE = new VehicleDAO();
    private Connection con;

    public VehicleDAO() {
        if (INSTANCE == null) {
            con = new DBContext().connection;
        } else {
            INSTANCE = this;
        }
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
        } catch (SQLException e) {
            throw new SQLException();

        }

    }

    public int countVehicleByCustomer(int customerId) {
        int total = 0;
        String sql = "select  Count(*) as TotalVehicle from Vehicles where OwnerId = ?";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, customerId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                total = rs.getInt("TotalVehicle");
            }
        } catch (SQLException e) {
            System.out.println(e);
        }

        return total;
    }

    public static void main(String[] args) throws SQLException {

        Vehicle vehicle = new Vehicle("YAMAHA GHI XÁM", "16k1-1860", 2);

//        boolean result = vd.addVehicle(vehicle);
        System.out.println(VehicleDAO.INSTANCE.addVehicle(vehicle));
    }
}
