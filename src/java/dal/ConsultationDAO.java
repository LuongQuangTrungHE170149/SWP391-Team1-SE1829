/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author Kha21
 */
public class ConsultationDAO extends DBContext {

    public void addConsultation(String name, boolean gender, String dob, String phone, String email, String address, String description, String status) {
        String sql = "INSERT INTO [dbo].[Consultations]\n"
                + "           ([name]\n"
                + "           ,[gender]\n"
                + "           ,[dob]\n"
                + "           ,[Phone]\n"
                + "           ,[email]\n"
                + "           ,[Address]\n"
                + "           ,[descreption]\n"
                + "           ,[status])\n"
                + "     VALUES\n"
                + "           (?,?,?,?,?,?,?,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, name);
            st.setBoolean(2, gender);
            st.setString(3, dob);
            st.setString(4, phone);
            st.setString(5, email);
            st.setString(6, address);
            st.setString(7, description);
            st.setString(8, status);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }
    public static void main(String[] args) {
        ConsultationDAO cdb = new ConsultationDAO();
        cdb.addConsultation("kha21", true,"2001/09/09" ,"0327983593", "kharrr2001@gmail.com", "Ha Noi", "Toi muon anh em ho tro", "pending");
    }
}
