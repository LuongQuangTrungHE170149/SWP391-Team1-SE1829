/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import Model.VehicleType;
import java.util.ArrayList;
import java.util.List;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author thuhu
 */
public class VehicleTypeDAO extends DBContext {

    public List<VehicleType> getAll() {
        List<VehicleType> list = new ArrayList<>();
        String sql = "SELECT [id]\n"
                + "      ,[name]\n"
                + "      ,[price]\n"
                + "  FROM [dbo].[VehicleType]";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                VehicleType v = new VehicleType();
                v.setId(rs.getInt("id"));
                v.setName(rs.getString("name"));
                v.setPrice(rs.getInt("price"));
                
                list.add(v);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public VehicleType getVehicleTypeById(int id) {
        List<VehicleType> list = new ArrayList<>();
        String sql = "SELECT [id]\n"
                + "      ,[name]\n"
                + "      ,[price]\n"
                + "  FROM [dbo].[VehicleType] where id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                VehicleType v = new VehicleType();
                v.setId(rs.getInt("id"));
                v.setName(rs.getString("name"));
                v.setPrice(rs.getInt("price"));

                return v;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }
    
    public static void main(String[] args) {
        VehicleTypeDAO vdb = new VehicleTypeDAO();
        System.out.println(vdb.getAll());
    }

}
