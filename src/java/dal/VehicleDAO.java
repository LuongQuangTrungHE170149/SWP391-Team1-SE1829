package dal;

import Model.Vehicle;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import Model.VehicleType;

/**
 *
 * @author QUANG TRUNG
 */
public class VehicleDAO extends DBContext {

    public boolean addVehicle(Vehicle vehicle) {
        String sql = "INSERT INTO [dbo].[Vehicles]\n"
                + "           ([OwnerFirstName]\n"
                + "           ,[OwnerLastName]\n"
                + "           ,[OwnerAddress]\n"
                + "           ,[VehicleType]\n"
                + "           ,[LicensePlates]\n"
                + "           ,[Chassis]\n"
                + "           ,[Engine])\n"
                + "     VALUES\n"
                + "           (?,?,?,?,?,?,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, vehicle.getOwnerFirstName());
            st.setString(2, vehicle.getOwnerLastName());
            st.setString(3, vehicle.getOwnerAddress());
            st.setInt(4, vehicle.getMotocycleType().getId());
            st.setString(5, vehicle.getLicensePlates());
            st.setString(6, vehicle.getChassis());
            st.setString(7, vehicle.getEngine());

            st.executeUpdate();
            return true;
        } catch (SQLException e) {
            System.out.println(e);
        }
        return false;
    }

    public Vehicle getLastVehicle() {
        String sql = "SELECT TOP (1) [id]\n"
                + "      ,[OwnerFirstName]\n"
                + "      ,[OwnerLastName]\n"
                + "      ,[OwnerAddress]\n"
                + "      ,[VehicleType]\n"
                + "      ,[LicensePlates]\n"
                + "      ,[Chassis]\n"
                + "      ,[Engine]\n"
                + "  FROM [SWP391_SE1829_Team1].[dbo].[Vehicles] order by id DESC";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Vehicle v = new Vehicle();
                v.setId(rs.getInt("id"));
                v.setOwnerFirstName(rs.getString("OwnerFirstName"));
                v.setOwnerLastName(rs.getString("OwnerLastName"));
                v.setOwnerAddress(rs.getString("OwnerAddress"));

                VehicleTypeDAO vtdb = new VehicleTypeDAO();
                VehicleType vt = vtdb.getVehicleTypeById(rs.getInt("VehicleType"));
                v.setMotocycleType(vt);
                v.setLicensePlates(rs.getString("LicensePlates"));
                v.setChassis(rs.getString("Chassis"));
                v.setEngine(rs.getString("Engine"));

                return v;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public int countVehicleByCustomer(int customerId) {
        int total = 0;
        String sql = "select  Count(*) as TotalVehicle from Vehicles where OwnerId = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
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
            PreparedStatement statement = connection.prepareStatement(sql);
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

    public Vehicle getVehicleById(int id) {
        String sql = "SELECT [id]\n"
                + "      ,[OwnerFirstName]\n"
                + "      ,[OwnerLastName]\n"
                + "      ,[OwnerAddress]\n"
                + "      ,[VehicleType]\n"
                + "      ,[LicensePlates]\n"
                + "      ,[Chassis]\n"
                + "      ,[Engine]\n"
                + "  FROM [dbo].[Vehicles] where id = ?";
        try {

            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();

            if (rs.next()) {
               Vehicle v = new Vehicle();
               v.setId(rs.getInt("id"));
               v.setOwnerFirstName(rs.getString("OwnerFirstName"));
               v.setOwnerLastName(rs.getString("OwnerLastName"));
               v.setOwnerAddress(rs.getString("OwnerAddress"));
               VehicleTypeDAO vtdb = new VehicleTypeDAO();
               VehicleType vt = vtdb.getVehicleTypeById(rs.getInt("VehicleType"));
               v.setMotocycleType(vt);
               v.setLicensePlates(rs.getString("LicensePlates"));
               v.setChassis(rs.getString("Chassis"));
               v.setEngine(rs.getString("Engine"));
               return v;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return null;
    }

    public int getVehicleIdAfterAdd() throws SQLException {
        String sql = "SELECT Top 1 MotocycleId FROM Vehicles ORDER BY MotocycleId DESC";
        int id = 0;
        try {
            PreparedStatement preparedStatement = con.prepareStatement(sql);

            ResultSet resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                id = resultSet.getInt("MotocycleId");
            }
        } catch (Exception e) {
        }
        return id;
    }

    public List<Vehicle> getAllVehicle() {
        List<Vehicle> list = new ArrayList<>();
        String sql = "select * from Vehicles";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Vehicle ve = new Vehicle();
                ve.setId(rs.getInt("MotocycleId"));
                ve.setMotocycleType(rs.getString("MotocycleType"));
                ve.setLicensePlates(rs.getString("LicensePlates"));
                ve.setChassis(rs.getString("Chassis"));
                ve.setEngine(rs.getString("Engine"));
                ve.setOwnerId(rs.getInt("OwnerId"));
                list.add(ve);
            }
        } catch (Exception e) {
        }

        return list;
    }

    public static void main(String[] args) throws SQLException {

        //Vehicle vehicle = new Vehicle("YAMAHA GHI XÁM", "16k1-1860", 2);
//        boolean result = vd.addVehicle(vehicle);
        VehicleDAO vdb = new VehicleDAO();
        System.out.println(vdb.getVehicleById(1));
    }

}
