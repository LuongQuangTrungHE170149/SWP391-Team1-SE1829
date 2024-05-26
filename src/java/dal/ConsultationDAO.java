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
                + "  order by createDate DESC";
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
                + "  FROM [dbo].[Consultations] where status = ? order by createDate DESC";
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
        try{
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            st.executeUpdate();
        }catch(SQLException e){
            System.out.println(e);
        }
    }

    public static void main(String[] args) {
        ConsultationDAO cdb = new ConsultationDAO();
        System.out.println();
        cdb.deleteConsultationById(56);
        
       

    }
}
