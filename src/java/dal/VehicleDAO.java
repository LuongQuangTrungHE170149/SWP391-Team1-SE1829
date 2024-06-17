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
        String sql = "INSERT INTO Vehicles (MotocycleType, LicensePlates, Chassis, Engine, OwnerId) VALUES (?, ?, ? , ? , ?)";

        try {
            PreparedStatement statement = con.prepareStatement(sql);
            statement.setString(1, vehicle.getMotocycleType());
            statement.setString(2, vehicle.getLicensePlates());
            statement.setString(3, vehicle.getChassis());
            statement.setString(4, vehicle.getEngine());
            statement.setInt(5, vehicle.getOwnerId());

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

    public List<Vehicle> getListVehicle(int customerId, String searchQuery) {
        List<Vehicle> vehicleList = new ArrayList<>();
        try {
            String sql = "SELECT * FROM Vehicles WHERE OwnerId = ?";
            if (searchQuery != null && !searchQuery.trim().isEmpty()) {
                sql += " AND (MotocycleType LIKE ? OR LicensePlates LIKE ?)";
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
                String motocycleType = resultSet.getString("MotocycleType");
                String licensePlates = resultSet.getString("LicensePlates");
                String chassis = resultSet.getString("Chassis");
                String engine = resultSet.getString("Engine");
                int ownerId = resultSet.getInt("OwnerId");
                vehicleList.add(new Vehicle(id, motocycleType, licensePlates, chassis, engine, ownerId));
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

    public Vehicle getVehicleById(int vehicleId) {
        Vehicle vehicle = new Vehicle();
        String sql = "SELECT * FROM Vehicles WHERE MotocycleId = ?";
        try {

            PreparedStatement preparedStatement = con.prepareStatement(sql);
            preparedStatement.setInt(1, vehicleId);
            ResultSet resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                vehicle = new Vehicle();
                vehicle.setId(resultSet.getInt("MotocycleId"));
                vehicle.setMotocycleType(resultSet.getString("Model"));
                vehicle.setLicensePlates(resultSet.getString("LicensePlates"));
                vehicle.setOwnerId(resultSet.getInt("OwnerId"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return vehicle;
    }

    public static void main(String[] args) throws SQLException {

        //Vehicle vehicle = new Vehicle("YAMAHA GHI XÁM", "16k1-1860", 2);
//        boolean result = vd.addVehicle(vehicle);
        System.out.println(VehicleDAO.INSTANCE.hasContract(6));
    }
}
