/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import Model.User;
import java.math.BigInteger;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
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
    
    public BigInteger totalPayment() {
        BigInteger total = BigInteger.ZERO;
        String sql = "SELECT SUM(Payment) AS TotalPayment FROM Contracts;";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            
            if(rs.next()) {
                total = BigInteger.valueOf(rs.getInt("TotalPayment"));
            }
            
        } catch (Exception e) {
            System.out.println(e);
        }
        
        return total;
    }
    
     public HashMap<String, BigInteger> getMonthlyMoney() {
        HashMap<String, BigInteger> hash = new HashMap<>();
        String sql = "SELECT MONTH(StartDate) AS Month, SUM(Payment) AS TotalRevenue FROM Contracts GROUP BY  MONTH(StartDate) ORDER BY Month";

        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                hash.put(rs.getString("Month"), BigInteger.valueOf(rs.getInt("TotalRevenue")));

            }
        } catch (SQLException e) {
            System.out.println(e);
        }

        return hash;

    }
    

    public static void main(String[] args) {
        
//        List<User> users = ;
        System.err.println(ContractDAO.INSTANCE.getMonthlyMoney());
    }
}
