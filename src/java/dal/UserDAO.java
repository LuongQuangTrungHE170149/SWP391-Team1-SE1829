
/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import Model.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author trand
 */
public class UserDAO {

    public static UserDAO INSTANCE = new UserDAO();
    private Connection con;

    public UserDAO() {
        if (INSTANCE == null) {
            con = new DBContext().connection;
        } else {
            INSTANCE = this;
        }
    }

    public List<User> getAllUser() {
        List<User> list = new ArrayList<>();
        String sql = "select * from Users";

        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                User user = new User();
                user.setId(rs.getInt("id"));
                user.setUsername(rs.getString("username"));
                user.setFirstName(rs.getString("firstName"));
                user.setLastName(rs.getString("lastName"));
                user.setRole(rs.getString("role"));
                user.setGender(rs.getInt("gender"));
                user.setEmail(rs.getString("email"));
                user.setPhone(rs.getString("phoneNumber"));
                user.setDate(rs.getDate("dob"));
                user.setAddress(rs.getString("address"));
                list.add(user);

            }

        } catch (SQLException e) {
            System.out.println(e);
        }

        return list;
    }

    public List<User> getStaffsByAgencyId(int agencyId) {
        List<User> list = new ArrayList<>();
        String sql = "select * from Staff_Workplace s join Users u \n"
                + "on s.StaffId = u.id where s.AgencyId = ?";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, agencyId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                User user = new User();
                user.setId(rs.getInt("id"));
                user.setUsername(rs.getString("username"));
                user.setFirstName(rs.getString("firstName"));
                user.setLastName(rs.getString("lastName"));
                user.setRole(rs.getString("role"));
                user.setGender(rs.getInt("gender"));
                user.setEmail(rs.getString("email"));
                user.setPhone(rs.getString("phoneNumber"));
                user.setDate(rs.getDate("dob"));
                user.setAddress(rs.getString("address"));
                list.add(user);

            }

        } catch (SQLException e) {
            System.out.println(e);
        }

        return list;
    }

    public User insert(User modal) {
        String sql = """
                     INSERT INTO Users ( username, firstName, lastName, password, [role], email, phone, dob, [address], gender)
                     VALUES 
                     ( ?, ?, ?, ?, ?, ?, ?, ?, ?)""";

        try {
            PreparedStatement ps = con.prepareStatement(sql);
            int posParam = 1;
            ps.setString(posParam++, modal.getUserName());
            ps.setString(posParam++, modal.getFirstName());
            ps.setString(posParam++, modal.getLastName());
            ps.setString(posParam++, modal.getPassword());
            ps.setString(posParam++, modal.getRole());
            ps.setString(posParam++, modal.getEmail());
            ps.setString(posParam++, modal.getPhone());
            ps.setDate(posParam++, modal.getDate());
            ps.setString(posParam++, modal.getAddress());
            ps.setInt(posParam++, modal.getGender());
            ps.executeUpdate();
            return modal;
        } catch (SQLException e) {
            System.out.println(e);
        }

        return null;
    }

}
