/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import Model.NewsType;
import Model.User;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author tranm
 */
public class NewsDAO extends DBContext {

    public boolean addNews(String title, String description, String content, String image, boolean isHeader, int staff, String type) {
        String sql = "INSERT INTO [dbo].[News]\n"
                + "           ([title]\n"
                + "           ,[description]\n"
                + "           ,[content]\n"
                + "           ,[image]\n"
                + "           ,[isHeader]\n"
                + "           ,[staff]\n"
                + "           ,[type])\n"
                + "     VALUES\n"
                + "           (?,?,?,?,?,?,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, title);
            st.setString(2, description);
            st.setString(3, content);
            st.setString(4, image);
            st.setBoolean(5, isHeader);
            st.setInt(6, staff);
            st.setString(7, type);
            st.executeUpdate();
            return true;
        } catch (SQLException e) {
            System.out.println(e);
        }
        return false;
    }
    
    public boolean setIsHeaderToFalse() {
        String sql = "Update News\n"
                + "set isHeader = 'false'\n"
                + "where isHeader = 'true';";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.executeUpdate();
            return true;
        } catch (SQLException e) {
            System.out.println(e);
        }
        return false;
    }

    public boolean setIsHeaderToTrueById(Boolean isHeader, int id) {
        String sql = "UPDATE [dbo].[News]\n"
                + "   SET [isHeader] = ?\n"
                + " WHERE id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setBoolean(1, isHeader);
            st.setInt(2, id);
            st.executeUpdate();
            return true;
        } catch (SQLException e) {
            System.out.println(e);
        }
        return false;
    }
    
    public int countNews() {
        int total = 0;
        String sql = "select Count(*) as TotalNews from News";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            if(rs.next()) {
                total = rs.getInt("TotalNews");
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        
        return total;
    }
    
    
    public static void main(String[] args) {
        NewsDAO ndb = new NewsDAO();
        System.out.println(ndb.setIsHeaderToFalse());
    }
}
