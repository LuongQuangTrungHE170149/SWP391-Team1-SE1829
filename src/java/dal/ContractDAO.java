/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import Model.Contract;
import Model.User;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.sql.Date;
import java.util.List;

/**
 *
 * @author QUANG TRUNG
 */
public class ContractDAO extends DBContext {

    public ContractDAO INSTANCE = new ContractDAO();
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

    public boolean addContract(Contract contract){
        try {
            
            // Calculate End Date
            String sql = "INSERT INTO Contracts (CustomerId, StaffId, AgencyId, VehicleId, StartDate, EndDate, ContractType, [Description], Payment, IsPay) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement stmt = con.prepareStatement(sql);
            
            stmt.setInt(1, contract.getCustomerId());
            stmt.setInt(2, contract.getStaffId());
            stmt.setInt(3, contract.getAgencyId());
            stmt.setInt(4, contract.getVehicleId());
            stmt.setDate(5,  contract.getStartDate());
            stmt.setDate(6, new Date(contract.getStartDate().getTime() + (long)contract.getContractType() * 365 * 24 * 60 * 60 * 1000));
            stmt.setString(7, contract.getContractType() + " Year");
            stmt.setString(8, contract.getDescripttion());
            stmt.setDouble(9, contract.getPayment());
            stmt.setString(10, contract.getStatus());
            
            stmt.executeUpdate();
            stmt.close();
            con.close();
            return true;
            
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
    
    public static void main(String[] args) {

        ContractDAO cd = new ContractDAO();
        List<User> users = cd.getCustomer("anna");
        System.out.println(users);

    }
}
