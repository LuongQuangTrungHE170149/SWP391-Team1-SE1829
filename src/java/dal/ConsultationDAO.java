/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import Model.Consultation;
import Model.User;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

/**
 *
 * @author Kha21
 */
public class ConsultationDAO extends DBContext {

    public void addConsultation(String name, String email, String content) {
        String sql = "INSERT INTO [dbo].[Consultations]\n"
                + "           ([name]\n"
                + "           ,[email]\n"
                + "           ,[content]\n"
                + "           )\n"
                + "     VALUES\n"
                + "           (?,?,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, name);
            st.setString(2, email);
            st.setString(3, content);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public List<Consultation> getAll() {
        List list = new ArrayList<>();
        String sql = "SELECT [id]\n"
                + "      ,[name]\n"
                + "      ,[email]\n"
                + "      ,[content]\n"
                + "      ,[createDate]\n"
                + "      ,[reply_message]\n"
                + "      ,[staff]\n"
                + "      ,[status]\n"
                + "  FROM [dbo].[Consultations]\n"
                + "  order by id DESC";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Consultation c = new Consultation();
                c.setId(rs.getInt("id"));
                c.setName(rs.getString("name"));
                c.setEmail(rs.getString("email"));
                c.setContent(rs.getString("content"));
                c.setCreateDate(rs.getDate("createDate"));

                UserDAO udb = new UserDAO();
                User u = udb.getUserById(rs.getInt("staff"));
                c.setStaff(u);

                c.setStatus(rs.getBoolean("status"));

                list.add(c);

            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Object[]> listStaffAnswer() {
        List<Object[]> list = new ArrayList<>();
        String sql = " select c.staff as id, u.username as username\n"
                + "  from Consultations c\n"
                + "  inner join Users u On c.staff = u.id \n"
                + "  group by c.staff, u.username";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String username = rs.getString("username");
                Object[] obj = new Object[]{id, username};
                list.add(obj);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Consultation> searchConsultation(String staff, String status, String searchValue) {
        List<Consultation> list = new ArrayList<>();
        StringBuilder sql = new StringBuilder("SELECT [id]\n"
                + "      ,[name]\n"
                + "      ,[email]\n"
                + "      ,[content]\n"
                + "      ,[createDate]\n"
                + "      ,[reply_message]\n"
                + "      ,[staff]\n"
                + "      ,[status]\n"
                + "  FROM [dbo].[Consultations] where 1=1");

        if (staff != null && !staff.isEmpty() && !staff.equals("all")) {
            sql.append(" AND [staff] = ?");
        }

        if (status != null && !status.isEmpty() && !status.equals("all")) {
            sql.append(" AND [status] = ?");
        }

        if (searchValue != null && !searchValue.isEmpty()) {
            sql.append(" AND ([name] LIKE ? OR [email] LIKE ?)");
        }
        //
        sql.append(" Order by id DESC");

        try {
            PreparedStatement st = connection.prepareStatement(sql.toString());
            int index = 1;
            if (staff != null && !staff.isEmpty() && !staff.equals("all")) {
                st.setInt(index++, Integer.parseInt(staff));
            }
            if (status != null && !status.isEmpty() && !status.equals("all")) {
                st.setString(index++, status);
            }
            if (searchValue != null && !searchValue.isEmpty()) {
                String search = "%" + searchValue + "%";
                st.setString(index++, search);
                st.setString(index++, search);
            }
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Consultation c = new Consultation();
                c.setId(rs.getInt("id"));
                c.setName(rs.getString("name"));
                c.setEmail(rs.getString("email"));
                c.setContent(rs.getString("content"));
                c.setCreateDate(rs.getDate("createDate"));

                UserDAO udb = new UserDAO();
                User u = udb.getUserById(rs.getInt("staff"));
                c.setStaff(u);

                c.setStatus(rs.getBoolean("status"));

                list.add(c);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Consultation> getConsultationByNameOrEmail(String searchValue) {
        List<Consultation> list = new ArrayList<>();
        String sql = "SELECT [id]\n"
                + "      ,[name]\n"
                + "      ,[email]\n"
                + "      ,[content]\n"
                + "      ,[createDate]\n"
                + "      ,[reply_message]\n"
                + "      ,[staff]\n"
                + "      ,[status]\n"
                + "  FROM [dbo].[Consultations] where \n"
                + "\n"
                + "  [name] like ? or email like ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, "%" + searchValue + "%");
            st.setString(2, "%" + searchValue + "%");
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Consultation c = new Consultation();
                c.setId(rs.getInt("id"));
                c.setName(rs.getString("name"));
                c.setEmail(rs.getString("email"));
                c.setContent(rs.getString("content"));
                c.setCreateDate(rs.getDate("createDate"));

                UserDAO udb = new UserDAO();
                User u = udb.getUserById(rs.getInt("staff"));
                c.setStaff(u);

                c.setStatus(rs.getBoolean("status"));

                list.add(c);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public Consultation getConsultationById(int id) {
        String sql = "SELECT [id]\n"
                + "      ,[name]\n"
                + "      ,[email]\n"
                + "      ,[content]\n"
                + "      ,[createDate]\n"
                + "      ,[reply_message]\n"
                + "      ,[staff]\n"
                + "      ,[status]\n"
                + "  FROM [dbo].[Consultations] where id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Consultation c = new Consultation();
                c.setId(id);
                c.setName(rs.getString("name"));
                c.setEmail(rs.getString("email"));
                c.setContent(rs.getString("content"));
                c.setCreateDate(rs.getDate("createDate"));
                c.setReplyMessage(rs.getString("reply_message"));

                UserDAO udb = new UserDAO();
                User u = udb.getUserById(rs.getInt("staff"));
                c.setStaff(u);
                c.setStatus(rs.getBoolean("status"));

                return c;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public List<Consultation> getConsultationByStatus(int status) {
        List<Consultation> list = new ArrayList<>();
        String sql = "SELECT [id]\n"
                + "      ,[name]\n"
                + "      ,[email]\n"
                + "      ,[content]\n"
                + "      ,[createDate]\n"
                + "      ,[reply_message]\n"
                + "      ,[staff]\n"
                + "      ,[status]\n"
                + "  FROM [dbo].[Consultations] where status = ? order by id DESC";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, status);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Consultation c = new Consultation();
                c.setId(rs.getInt("id"));
                c.setName(rs.getString("name"));
                c.setEmail(rs.getString("email"));
                c.setContent(rs.getString("content"));
                c.setCreateDate(rs.getDate("createDate"));
                c.setReplyMessage(rs.getString("reply_message"));

                UserDAO udb = new UserDAO();
                User u = udb.getUserById(rs.getInt("staff"));
                c.setStaff(u);

                c.setStatus(rs.getBoolean("status"));

                list.add(c);

            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public int CountConsultationByStatus(String value) {
        int total = 0;
        String sql = "SELECT count(*) as total\n"
                + "  FROM [dbo].[Consultations]";
        if (value.equalsIgnoreCase("1")) {
            sql += " where status = 1";
        }
        if (value.equalsIgnoreCase("0")) {
            sql += " where status = 0";
        }
        try {

            PreparedStatement st = connection.prepareStatement(sql);

            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                total = rs.getInt("total");
                return total;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return 0;
    }

    public void deleteConsultationById(int id) {
        String sql = "DELETE FROM [dbo].[Consultations]\n"
                + "      WHERE id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public boolean updateConsultationById(int id, String reply, int staff_id, boolean status) {
        String sql = "UPDATE [dbo].[Consultations]\n"
                + "   SET [reply_message] = ?\n"
                + "      ,[staff] = ?\n"
                + "      ,[status] = ?\n"
                + " WHERE id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, reply);
            st.setInt(2, staff_id);
            st.setBoolean(3, status);
            st.setInt(4, id);
            st.executeUpdate();
            return true;
        } catch (SQLException e) {
            System.out.println(e);
        } return false;
    }

    public List<Consultation> getListConsultationByStaffId(int id) {
        List<Consultation> list = new ArrayList<>();
        String sql = "SELECT [id]\n"
                + "      ,[name]\n"
                + "      ,[email]\n"
                + "      ,[content]\n"
                + "      ,[createDate]\n"
                + "      ,[reply_message]\n"
                + "      ,[staff]\n"
                + "      ,[status]\n"
                + "  FROM [dbo].[Consultations] where staff = ? order by id DESC";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Consultation c = new Consultation();
                c.setId(id);
                c.setName(rs.getString("name"));
                c.setEmail(rs.getString("email"));
                c.setContent(rs.getString("content"));
                c.setCreateDate(rs.getDate("createDate"));
                c.setReplyMessage(rs.getString("reply_message"));

                UserDAO udb = new UserDAO();
                User u = udb.getUserById(id);
                c.setStaff(u);

                c.setStatus(rs.getBoolean("status"));

                list.add(c);

            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public HashMap<String, Integer> getTotalStaffAnswer() {
        HashMap<String, Integer> total = new HashMap<>();
        String sql = "SELECT\n"
                + "    U.username,\n"
                + "    COUNT(C.staff) AS TotalConsultations\n"
                + "FROM\n"
                + "    Users U\n"
                + "LEFT JOIN\n"
                + "    Consultations C ON U.id = C.staff\n"
                + "WHERE\n"
                + "    U.role = 'staff'\n"
                + "GROUP BY\n"
                + "    U.username;";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                total.put(rs.getString("username"), rs.getInt("TotalConsultations"));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return total;
    }

    public static void main(String[] args) {
        ConsultationDAO cdb = new ConsultationDAO();
        System.out.println(cdb.updateConsultationById(1, "test", 2, true));
    }
}
