/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import Model.User;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author QUANG TRUNG
 */
public class ContractDAO extends DBContext {

    public static ContractDAO INSTANCE = new ContractDAO();
    private Connection con;

    public ContractDAO() {
        if (INSTANCE == null) {
            con = new DBContext().connection;
        } else {
            INSTANCE = this;
        }
    }

    public List<User> getCustomer(String name) {
        List<User> customers = new ArrayList<>();
        try {

            String sql = "SELECT * FROM Users WHERE firstName LIKE ? OR lastName LIKE ?";
            PreparedStatement statement = con.prepareStatement(sql);
            statement.setString(1, "%" + name + "%");
            statement.setString(2, "%" + name + "%");
            ResultSet rs = statement.executeQuery();

            while (rs.next()) {
                User customer = new User();
                customer.setFirstName(rs.getString("firstName"));
                customer.setLastName(rs.getString("lastName"));
            }

            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return customers;
    }

    public static void main(String[] args) {
        ContractDAO cd = new ContractDAO();
        List<User> users = cd.getCustomer("anna");
        System.err.println(users);
    }
}
