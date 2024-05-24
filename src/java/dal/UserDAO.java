
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

import java.sql.ResultSet;


/**
 *
 * @author trand
 */
public class UserDAO extends DBContext{


    public List<User> getAllUser() {
        List<User> list = new ArrayList<>();
        String sql = "select * from Users";

        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                User user = new User();
                user.setId(rs.getInt("id"));
                user.setUserName(rs.getString("username"));
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
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, agencyId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                User user = new User();
                user.setId(rs.getInt("id"));
                user.setUserName(rs.getString("username"));
                user.setFirstName(rs.getString("firstName"));
                user.setLastName(rs.getString("lastName"));
                user.setPassword(rs.getString("password"));
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
                     INSERT INTO Users ( username, firstName, lastName, password, [role], email, phone, dob, [address], gender, dateCreated)
                     VALUES 
                     ( ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)""";

        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            int posParam = 1;
            ps.setString(posParam++, modal.getUsername());
            ps.setString(posParam++, modal.getFirstName());
            ps.setString(posParam++, modal.getLastName());
            ps.setString(posParam++, modal.getPassword());
            ps.setString(posParam++, modal.getRole());
            ps.setString(posParam++, modal.getEmail());
            ps.setString(posParam++, modal.getPhone());
            ps.setDate(posParam++, modal.getDate());
            ps.setString(posParam++, modal.getAddress());
            ps.setInt(posParam++, modal.getGender());
            java.sql.Date currentDate = new java.sql.Date(System.currentTimeMillis());
            ps.setDate(posParam++, currentDate);

            ps.executeUpdate();
            return modal;
        } catch (SQLException e) {
            System.out.println(e);
        }

        return null;
    }

    public User getUserById(int id) {
        String sql = "SELECT [id]\n"
                + "      ,[username]\n"
                + "      ,[password]\n"
                + "      ,[firstName]\n"
                + "      ,[lastName]\n"
                + "      ,[role]\n"
                + "      ,[gender]\n"
                + "      ,[email]\n"
                + "      ,[phoneNumber]\n"
                + "      ,[dob]\n"
                + "      ,[address]\n"
                + "  FROM [dbo].[Users] where id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if(rs.next()){
                User u = new User();
                u.setId(id);
                u.setUserName(rs.getString("username"));
                u.setPassword(rs.getString("password"));
                u.setFirstName(rs.getString("firstName"));
                u.setLastName(rs.getString("lastName"));
                u.setRole(rs.getString("role"));
                u.setGender(rs.getInt("gender"));
                u.setDate(rs.getDate("dob"));
                u.setPhone(rs.getString("phoneNumber"));
                u.setEmail(rs.getString("email"));
                u.setAddress(rs.getString("address"));
                
                return u;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }
    public static void main(String[] args) {
        UserDAO udb = new UserDAO();
        System.out.println(udb.getStaffsByAgencyId(2));
    }
}
