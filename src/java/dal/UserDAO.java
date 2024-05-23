/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import Model.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.ResultSet;

/**
 *
 * @author trand
 */
public class UserDAO extends DBContext{


    public User insert(User modal) {
        String sql = """
                     INSERT INTO Users ( username, firstName, lastName, [role], email, phone, dob, [address], gender)
                     VALUES 
                     ( ?, ?, ?, ?, ?, ?, ?, ?, ?)""";

        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            int posParam = 1;
            ps.setString(posParam++, modal.getUsername());
            ps.setString(posParam++, modal.getFirstName());
            ps.setString(posParam++, modal.getLastName());
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
                u.setUsername(rs.getString("username"));
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
        System.out.println(udb.getUserById(1));
    }
}
