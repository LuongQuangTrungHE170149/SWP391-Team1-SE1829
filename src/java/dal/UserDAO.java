/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import Model.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

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

    public User insert(User modal) {
        String sql = """
                     INSERT INTO Users ( username, firstName, lastName, [role], email, phone, dob, [address], gender)
                     VALUES 
                     ( ?, ?, ?, ?, ?, ?, ?, ?, ?)""";

        try {
            PreparedStatement ps = con.prepareStatement(sql);
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

}
