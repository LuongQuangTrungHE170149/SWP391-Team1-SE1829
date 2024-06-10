/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import Model.Vehicle;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

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
    
    public List<Vehicle> getListVehicle(int customerId, String searchQuery){
        List<Vehicle> vehicleList = new ArrayList<>();
        try  {
            String sql = "SELECT * FROM Vehicles WHERE OwnerId = ?";
            if (searchQuery != null && !searchQuery.trim().isEmpty()) {
                sql += " AND (Model LIKE ? OR LicensePlates LIKE ?)";
            }
            PreparedStatement statement = con.prepareStatement(sql);
            statement.setInt(1, customerId);
            if (searchQuery != null && !searchQuery.trim().isEmpty()) {
                String queryParam = "%" + searchQuery + "%";
                statement.setString(2, queryParam);
                statement.setString(3, queryParam);
            }
            ResultSet resultSet = statement.executeQuery();
            
            while (resultSet.next()) {
                int id = resultSet.getInt("MotocycleId");
                String model = resultSet.getString("Model");
                String licensePlates = resultSet.getString("LicensePlates");                
                vehicleList.add(new Vehicle(id, model, licensePlates));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return vehicleList;
    }
    
    public boolean hasContract(int vehicleId) throws SQLException {
        boolean hasContract = false;
        String sql = "SELECT COUNT(*) FROM Contracts WHERE VehicleId = ?";

        try (PreparedStatement statement = con.prepareStatement(sql)) {
            statement.setInt(1, vehicleId);
            try (ResultSet resultSet = statement.executeQuery()) {
                if (resultSet.next()) {
                    int contractCount = resultSet.getInt(1);
                    hasContract = contractCount > 0;
                }
            }
        }

        return hasContract;
    }
    
    public void deleteVehicle(int vehicleId) throws SQLException {
        String sql = "DELETE FROM Vehicles WHERE MotocycleId = ?";

        try (PreparedStatement statement = con.prepareStatement(sql)) {
            statement.setInt(1, vehicleId);
            statement.executeUpdate();
        }
    }
    public static void main(String[] args) throws SQLException {

        Vehicle vehicle = new Vehicle("YAMAHA GHI XÁM", "16k1-1860", 2);

//        boolean result = vd.addVehicle(vehicle);
        System.out.println(VehicleDAO.INSTANCE.getListVehicle(1,"yamaha"));
    }
}
