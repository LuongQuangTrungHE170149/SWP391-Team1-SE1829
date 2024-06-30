
/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import Model.User;
import java.sql.Connection;
import java.sql.PreparedStatement;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import java.sql.ResultSet;
import java.sql.Date;
import java.util.HashMap;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author trand
 */
public class UserDAO extends DBContext {

    public List<User> getAllUser() {
        List<User> list = new ArrayList<>();
        String sql = "select * from Users";

        try {
            PreparedStatement ps = connection.prepareStatement(sql);
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
                user.setDob(rs.getDate("dob"));
                user.setAddress(rs.getString("address"));
                list.add(user);

            }

        } catch (SQLException e) {
            System.out.println(e);
        }

        return list;
    }

    public List<User> getAllUserByRole(String role) {
        List<User> list = new ArrayList<>();
        String sql = "select * from Users where role = ?";

        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, role);
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
                user.setDob(rs.getDate("dob"));
                user.setAddress(rs.getString("address"));
                user.setStatus(rs.getString("status"));

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
                user.setUsername(rs.getString("username"));
                user.setFirstName(rs.getString("firstName"));
                user.setLastName(rs.getString("lastName"));
                user.setPassword(rs.getString("password"));
                user.setRole(rs.getString("role"));
                user.setGender(rs.getInt("gender"));
                user.setEmail(rs.getString("email"));
                user.setPhone(rs.getString("phoneNumber"));
                user.setDob(rs.getDate("dob"));
                user.setAddress(rs.getString("address"));
                user.setStatus(rs.getString("status"));

                list.add(user);

            }

        } catch (SQLException e) {
            System.out.println(e);
        }

        return list;
    }

    public List<User> getAllStaffs() {
        List<User> list = new ArrayList<>();
        String sql = "SELECT * FROM Users WHERE [role] = 'Staff'";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                User user = new User();
                user.setId(rs.getInt("id"));
                user.setUsername(rs.getString("username"));
                user.setFirstName(rs.getString("firstName"));
                user.setLastName(rs.getString("lastName"));
                user.setPassword(rs.getString("password"));
                user.setRole(rs.getString("role"));
                user.setGender(rs.getInt("gender"));
                user.setEmail(rs.getString("email"));
                user.setPhone(rs.getString("phoneNumber"));
                user.setDob(rs.getDate("dob"));
                user.setAddress(rs.getString("address"));
                user.setStatus(rs.getString("status"));
                list.add(user);

            }

        } catch (SQLException e) {
            System.out.println(e);
        }

        return list;
    }

    public int getCountAllCustomer() {
        int count = 0;
        String sql = "SELECT COUNT(*) AS EmployeeCount FROM Users WHERE [role] = 'Customer';";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                count = rs.getInt("EmployeeCount");
            }
        } catch (SQLException e) {
            System.out.println(e);
        }

        return count;
    }

    public int getCountAllStaffs() {
        int count = 0;
        String sql = "SELECT COUNT(*) AS StaffCount FROM Users WHERE [role] = 'Staff';";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                count = rs.getInt("StaffCount");
            }

        } catch (SQLException e) {
            System.out.println(e);
        }

        return count;
    }

    public boolean checkPasswordById(int id, String password) {
        String sql = "SELECT [password]\n"
                + "  FROM [dbo].[Users] \n"
                + "  where id = ? and password = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            st.setString(2, password);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return true;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return false;
    }

    public boolean checkPhoneExist(String phone) {
        String sql = "SELECT *\n"
                + "  FROM [dbo].[Users] \n"
                + "  where phoneNumber = ?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, phone);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return true;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return false;
    }

    public boolean checkEmailExist(String email) {
        String sql = "SELECT *\n"
                + "  FROM [dbo].[Users] \n"
                + "  where email = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, email);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return true;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return false;
    }

    public boolean checkUsernameExist(String username) {
        String sql = "SELECT *\n"
                + "  FROM [dbo].[Users] \n"
                + "  where username = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, username);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return true;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return false;
    }

    public boolean changePasswordById(int id, String password) {
        String sql = "UPDATE [dbo].[Users]\n"
                + "   SET [password] = ?\n"
                + " WHERE id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, password);
            st.setInt(2, id);
            st.executeUpdate();

            return true;
        } catch (SQLException e) {
            System.out.println(e);
        }
        return false;
    }

    public boolean updateStaffProfileById(int id, int gender, String email, String phone, Date dob, String address) {
        String sql = "UPDATE [dbo].[Users]\n"
                + "   SET [gender] = ?\n"
                + "      ,[email] = ?\n"
                + "      ,[phoneNumber] = ?\n"
                + "      ,[dob] = ?\n"
                + "      ,[address] = ?\n"
                + " WHERE id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, gender);
            st.setString(2, email);
            st.setString(3, phone);
            st.setDate(4, dob);
            st.setString(5, address);
            st.setInt(6, id);
            st.executeUpdate();
            return true;
        } catch (SQLException e) {
            System.out.println(e);
        }
        return false;
    }

    public String getCustomerName(int customerId) throws SQLException {
        String customerName = null;
        String sql = "SELECT firstName, lastName FROM Users WHERE id = ?";

        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, customerId);
            try (ResultSet resultSet = statement.executeQuery()) {
                if (resultSet.next()) {
                    String firstName = resultSet.getString("firstName");
                    String lastName = resultSet.getString("lastName");
                    customerName = firstName + " " + lastName;
                }
            }
        }

        return customerName;
    }

    public List<User> searchCustomerByName(String key) {
        List<User> list = new ArrayList<>();
        String sql = "select * from Users where [role] = 'Customer' and (firstName like N'%" + key
                + "%' or lastName like N'%" + key + "%')";

        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                User user = new User();
                user.setId(rs.getInt("id"));
                user.setUsername(rs.getString("username"));
                user.setFirstName(rs.getString("firstName"));
                user.setLastName(rs.getString("lastName"));
                user.setPassword(rs.getString("password"));
                user.setRole(rs.getString("role"));
                user.setGender(rs.getInt("gender"));
                user.setEmail(rs.getString("email"));
                user.setPhone(rs.getString("phoneNumber"));
                user.setDob(rs.getDate("dob"));
                user.setAddress(rs.getString("address"));
                user.setStatus(rs.getString("status"));

                list.add(user);

            }

        } catch (SQLException e) {
            System.out.println(e);
        }

        return list;
    }

    public Boolean insert(User modal) {

        String sql = "INSERT INTO Users ( username, firstName, lastName, password, [role], email, phoneNumber, dob, [address], gender)"
                + "VALUES ( ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
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
            ps.setDate(posParam++, modal.getDob());
            ps.setString(posParam++, modal.getAddress());
            ps.setInt(posParam++, modal.getGender());
            ps.executeUpdate();
            return true;
        } catch (SQLException e) {
            System.out.println(e);
        }
        return false;
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
                + "      ,[dateCreated]\n"
                + "  FROM [dbo].[Users] where id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                User u = new User();
                u.setId(id);
                u.setUsername(rs.getString("username"));
                u.setPassword(rs.getString("password"));
                u.setFirstName(rs.getString("firstName"));
                u.setLastName(rs.getString("lastName"));
                u.setRole(rs.getString("role"));
                u.setGender(rs.getInt("gender"));
                u.setDob(rs.getDate("dob"));
                u.setPhone(rs.getString("phoneNumber"));
                u.setEmail(rs.getString("email"));
                u.setAddress(rs.getString("address"));
                u.setDateCreated(rs.getDate("dateCreated"));

                return u;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public User findByUsernameOrEmailAndPassword(String usernameAndEmail, String password) {
        String sql = "SELECT * FROM [Users] where (username = ?  or email = ?) and password = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, usernameAndEmail);
            ps.setString(2, usernameAndEmail);
            ps.setString(3, password);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                User user = new User();
                user.setId(rs.getInt("id"));
                user.setUsername(rs.getString("username"));
                user.setFirstName(rs.getString("firstName"));
                user.setLastName(rs.getString("lastName"));
                user.setRole(rs.getString("role"));
                user.setGender(rs.getInt("gender"));
                user.setEmail(rs.getString("email"));
                user.setPhone(rs.getString("phoneNumber"));
                user.setDob(rs.getDate("dob"));
                user.setAddress(rs.getString("address"));
                user.setPassword(rs.getString("password"));
                return user;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }

        return null;
    }

    public HashMap<String, Integer> countCutomerByGender() {
        HashMap<String, Integer> hash = new HashMap<>();

        String sql = "WITH AllGenders AS (\n"
                + "    SELECT 'Male' AS Gender\n"
                + "    UNION ALL\n"
                + "    SELECT 'Female' AS Gender\n"
                + "    UNION ALL\n"
                + "    SELECT 'Other' AS Gender\n"
                + ")\n"
                + "SELECT  ag.Gender, ISNULL(u.Count, 0) AS Count FROM AllGenders ag LEFT JOIN \n"
                + "    (SELECT CASE  WHEN gender = 0 THEN 'Male' WHEN gender = 1 THEN 'Female' ELSE 'Other' END AS Gender, COUNT(*) AS Count\n"
                + "     FROM  Users WHERE  role = 'customer' GROUP BY CASE WHEN gender = 0 THEN 'Male' WHEN gender = 1 THEN 'Female' ELSE 'Other' \n"
                + "     END) u ON ag.Gender = u.Gender ORDER BY  ag.Gender;";

        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                hash.put(rs.getString("Gender"), rs.getInt("Count"));
            }

        } catch (SQLException e) {
            System.out.println(e);
        }

        return hash;
    }

    public List<User> sortCusomterById() {
        List<User> list = new ArrayList<>();
        String sql = " select * from Users where [role] = 'Customer' order by id desc";

        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                User user = new User();
                user.setId(rs.getInt("id"));
                user.setUsername(rs.getString("username"));
                user.setFirstName(rs.getString("firstName"));
                user.setLastName(rs.getString("lastName"));
                user.setPassword(rs.getString("password"));
                user.setRole(rs.getString("role"));
                user.setGender(rs.getInt("gender"));
                user.setEmail(rs.getString("email"));
                user.setPhone(rs.getString("phoneNumber"));
                user.setDob(rs.getDate("dob"));
                user.setAddress(rs.getString("address"));
                user.setStatus(rs.getString("status"));

                list.add(user);

            }

        } catch (SQLException e) {
            System.out.println(e);
        }

        return list;
    }

    public boolean updateUserById(User customer) {
        String sql = "Update Users set firstName = ?, lastName = ?, address = ?, dob =? , status = ?, phoneNumber = ?, gender =? , email = ? where id = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, customer.getFirstName());
            ps.setString(2, customer.getLastName());
            ps.setString(3, customer.getAddress());
            ps.setDate(4, customer.getDob());
            ps.setString(5, customer.getStatus());
            ps.setString(6, customer.getPhone());
            ps.setInt(7, customer.getGender());
            ps.setString(8, customer.getEmail());
            ps.setInt(9, customer.getId());

            ps.executeUpdate();
            return true;

        } catch (SQLException e) {
            System.out.println(e);
        }

        return false;
    }

    public boolean changePassword(int userId, String password) {
        try {
            String sql = "update users set password = ? where id = ?";
            PreparedStatement ps;
            ps = connection.prepareStatement(sql);
            ps.setString(1, password);
            ps.setInt(2, userId);
            ps.executeUpdate();
            return true;
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    public User getUserByPhoneOrEmail(String phone, String email) {
        String sql = "SELECT * FROM [Users] where (phoneNumber = ?  or email = ?)";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, phone);
            ps.setString(2, email);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                User user = new User();
                user.setId(rs.getInt("id"));
                user.setUsername(rs.getString("username"));
                user.setFirstName(rs.getString("firstName"));
                user.setLastName(rs.getString("lastName"));
                user.setRole(rs.getString("role"));
                user.setGender(rs.getInt("gender"));
                user.setEmail(rs.getString("email"));
                user.setPhone(rs.getString("phoneNumber"));
                user.setDob(rs.getDate("dob"));
                user.setAddress(rs.getString("address"));
                user.setPassword(rs.getString("password"));
                return user;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }

        return null;
    }

    public User findByUsernameOrEmail(String usernameAndEmail) {
        String sql = "SELECT * FROM [Users] where (username = ?  or email = ?)";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, usernameAndEmail);
            ps.setString(2, usernameAndEmail);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                User user = new User();
                user.setId(rs.getInt("id"));
                user.setUsername(rs.getString("username"));
                user.setFirstName(rs.getString("firstName"));
                user.setLastName(rs.getString("lastName"));
                user.setRole(rs.getString("role"));
                user.setGender(rs.getInt("gender"));
                user.setEmail(rs.getString("email"));
                user.setPhone(rs.getString("phoneNumber"));
                user.setDob(rs.getDate("dob"));
                user.setAddress(rs.getString("address"));
                user.setPassword(rs.getString("password"));
                return user;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }

        return null;
    }

    public List<User> getAllCustomerByStatus(String status) {
        List<User> list = new ArrayList<>();
        String sql = "select * from Users where role = 'customer' and status = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, status);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                User user = new User();
                user.setId(rs.getInt("id"));
                user.setUsername(rs.getString("username"));
                user.setFirstName(rs.getString("firstName"));
                user.setLastName(rs.getString("lastName"));
                user.setPassword(rs.getString("password"));
                user.setRole(rs.getString("role"));
                user.setGender(rs.getInt("gender"));
                user.setEmail(rs.getString("email"));
                user.setPhone(rs.getString("phoneNumber"));
                user.setDob(rs.getDate("dob"));
                user.setAddress(rs.getString("address"));
                user.setStatus(rs.getString("status"));
                list.add(user);

            }

        } catch (SQLException e) {
            System.out.println(e);
        }

        return list;
    }

    public boolean checkPhoneExistById(String phone) {
        String sql = "SELECT *\n"
                + "  FROM [dbo].[Users] \n"
                + "  where phoneNumber = ?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, phone);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return true;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return false;
    }

    public boolean checkEmailExistById(String email) {
        String sql = "SELECT *\n"
                + "  FROM [dbo].[Users] \n"
                + "  where email = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, email);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return true;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return false;
    }

    public static void main(String[] args) {
        UserDAO udb = new UserDAO();
        User u = udb.getUserByPhoneOrEmail("0327983593", "kharrr2001@gmail.com");
        System.out.println(u);
    }

    public boolean update(User user) {
        String sql = "UPDATE Users SET username = ?, firstName = ?, lastName = ?, password = ?, role = ?, gender = ?, email = ?, phoneNumber = ?, dob = ?, address = ?, status = ? WHERE id = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, user.getUsername());
            ps.setString(2, user.getFirstName());
            ps.setString(3, user.getLastName());
            ps.setString(4, user.getPassword());
            ps.setString(5, user.getRole());
            ps.setInt(6, user.getGender());
            ps.setString(7, user.getEmail());
            ps.setString(8, user.getPhone());
            ps.setDate(9, new java.sql.Date(user.getDob().getTime()));
            ps.setString(10, user.getAddress());
            ps.setString(11, user.getStatus());
            ps.setInt(12, user.getId());

            int rowsAffected = ps.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException e) {
            System.out.println(e);
            return false;
        }
    }

    public boolean updateUser(User user) {
        String sql = "UPDATE Users SET username = ?, firstName = ?, lastName = ?, password = ?, role = ?, gender = ?, email = ?, phoneNumber = ?, dob = ?, address = ?, status = ? WHERE id = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, user.getUsername());
            ps.setString(2, user.getFirstName());
            ps.setString(3, user.getLastName());
            ps.setString(4, user.getPassword());
            ps.setString(5, user.getRole());
            ps.setInt(6, user.getGender());
            ps.setString(7, user.getEmail());
            ps.setString(8, user.getPhone());
            ps.setDate(9, new java.sql.Date(user.getDob().getTime()));
            ps.setString(10, user.getAddress());
            ps.setString(11, user.getStatus());
            ps.setInt(12, user.getId());

            int rowsAffected = ps.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException e) {
            System.out.println(e);
            return false;
        }
    }

    public int getLastUserId() {
        String sql = "SELECT TOP 1 id FROM Users ORDER BY id DESC";
        int userId = 0;
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                userId = rs.getInt("id");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return userId;
    }

}
