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
        try{
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while(rs.next()){
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
        }catch(SQLException e){
            System.out.println(e);
        }
        return list;
    }
    
    

    public static void main(String[] args) {
        ConsultationDAO cdb = new ConsultationDAO();
        System.out.println(cdb.getAll().get(1).getStaff().getFirstName());
    }
}
