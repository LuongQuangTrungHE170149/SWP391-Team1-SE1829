/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

/**
 *
 * @author thuhu
 */
import Model.Promotion;
import Model.User;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

public class PromotionDAO extends DBContext {

    public void addPromotion(String title, String content, Date timeStart, Date timeEnd, int staff) {
        String sql = "INSERT INTO [dbo].[Promotion]\n"
                + "           ([title]\n"
                + "           ,[timeStart]\n"
                + "           ,[timeEnd]\n"
                + "           ,[content]\n"
                + "           ,[staff])\n"
                + "     VALUES\n"
                + "           (?,?,?,?,?)";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, title);
            st.setString(2, content);
            st.setDate(3, timeStart);
            st.setDate(4, timeEnd);
            st.setInt(5, staff);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public List<Promotion> getAll() {
        List<Promotion> list = new ArrayList<>();
        String sql = "SELECT [id]\n"
                + "      ,[title]\n"
                + "      ,[timeStart]\n"
                + "      ,[timeEnd]\n"
                + "      ,[content]\n"
                + "      ,[staff]\n"
                + "  FROM [dbo].[Promotion]";
        
        try{
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while(rs.next()){
                Promotion p = new Promotion();
                p.setId(rs.getInt("id"));
                p.setTitle(rs.getString("title"));
                p.setContent(rs.getString("content"));
                p.setTimeStart(rs.getDate("timeStart"));
                p.setTimeEnd(rs.getDate("timeEnd"));
                
                UserDAO udb = new UserDAO();
                User u = udb.getUserById(rs.getInt("staff"));
                p.setStaff(u);
                
                list.add(p);
            }
        }catch(SQLException e){
            System.out.println(e);
        }
        return list;
    }

}
