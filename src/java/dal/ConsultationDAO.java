/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

/**
 *
 * @author kharr
 */
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class ConsultationDAO extends DBContext {

    public void addConsultation(String name, String email, String content) {
        String sql = "INSERT INTO [dbo].[Consultations]\n"
                + "           ([name]\n"
                + "           ,[email]\n"
                + "           ,[content])\n"
                + "     VALUES\n"
                + "           (?,?,?)";
        try{
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, name);
            st.setString(2, email);
            st.setString(3, content);
            st.executeUpdate();
        }catch(SQLException e){
            System.out.println(e);
        }
    }
    
    public static void main(String[] args) {
        ConsultationDAO cdb = new ConsultationDAO();
        cdb.addConsultation("yasuo", "yasuo@gmail.com", "solo yasuo k?");
    }
}
