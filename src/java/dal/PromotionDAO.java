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
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class PromotionDAO extends DBContext {

    public boolean addPromotion(String title, String description, Date timeStart, Date timeEnd, String content, boolean isHeader, String image, int staff) {
        String sql = "INSERT INTO [dbo].[Promotion]\n"
                + "           ([title]\n"
                + "           ,[description]\n"
                + "           ,[timeStart]\n"
                + "           ,[timeEnd]\n"
                + "           ,[content]\n"
                + "           ,[image]\n"
                + "           ,[isHeader]\n"
                + "           ,[staff])\n"
                + "     VALUES\n"
                + "           (?,?,?,?,?,?,?,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, title);
            st.setString(2, description);
            st.setDate(3, timeStart);
            st.setDate(4, timeEnd);
            st.setString(5, content);
            st.setString(6, image);
            st.setBoolean(7, isHeader);
            st.setInt(8, staff);
            st.executeUpdate();

            return true;
        } catch (SQLException e) {
            System.out.println(e);
        }
        return false;
    }

    public List<Promotion> getAll() {
        List<Promotion> list = new ArrayList<>();
        String sql = "SELECT [id]\n"
                + "      ,[title]\n"
                + "      ,[description]\n"
                + "      ,[timeStart]\n"
                + "      ,[timeEnd]\n"
                + "      ,[content]\n"
                + "      ,[isHeader]\n"
                + "      ,[image]\n"
                + "      ,[staff]\n"
                + "      ,[createDate]\n"
                + "  FROM [dbo].[Promotion]";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Promotion p = new Promotion();
                p.setId(rs.getInt("id"));
                p.setDescription(rs.getString("description"));
                p.setTitle(rs.getString("title"));
                p.setContent(rs.getString("content"));
                p.setTimeStart(rs.getDate("timeStart"));
                p.setTimeEnd(rs.getDate("timeEnd"));
                p.setIsHeader(rs.getBoolean("isHeader"));
                p.setImage(rs.getString("image"));

                UserDAO udb = new UserDAO();
                User u = udb.getUserById(rs.getInt("staff"));
                p.setStaff(u);

                p.setCreateDate(rs.getDate("createDate"));

                list.add(p);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Promotion> SearchByTitleOrDescriptionOrContent(String seachValue) {
        List<Promotion> list = new ArrayList<>();
        String sql = "SELECT [id]\n"
                + "      ,[title]\n"
                + "      ,[description]\n"
                + "      ,[timeStart]\n"
                + "      ,[timeEnd]\n"
                + "      ,[content]\n"
                + "      ,[image]\n"
                + "      ,[isHeader]\n"
                + "      ,[staff]\n"
                + "      ,[CreateDate]\n"
                + "FROM [SWP391_SE1829_Team1].[dbo].[Promotion] \n"
                + "WHERE [title] LIKE ? \n"
                + "   OR [description] LIKE ?\n"
                + "   OR [content] LIKE ?;";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, "'%" + seachValue + "%'");
            st.setString(2, "'%" + seachValue + "%'");
            st.setString(3, "'%" + seachValue + "%'");
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                
                Promotion p = new Promotion();
                p.setId(rs.getInt("id"));
                p.setDescription(rs.getString("description"));
                p.setTitle(rs.getString("title"));
                p.setContent(rs.getString("content"));
                p.setTimeStart(rs.getDate("timeStart"));
                p.setTimeEnd(rs.getDate("timeEnd"));
                p.setIsHeader(rs.getBoolean("isHeader"));
                p.setImage(rs.getString("image"));

                UserDAO udb = new UserDAO();
                User u = udb.getUserById(rs.getInt("staff"));
                p.setStaff(u);

                p.setCreateDate(rs.getDate("createDate"));

                list.add(p);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public void setIsHeaderToFalse() {
        String sql = "Update Promotion\n"
                + "set isHeader = 'false'\n"
                + "where isHeader = 'true';";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void setIsHeaderToTrueById(Boolean isHeader, int id) {
        String sql = "UPDATE [dbo].[Promotion]\n"
                + "   SET [isHeader] = ?\n"
                + " WHERE id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setBoolean(1, isHeader);
            st.setInt(2, id);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public Promotion getPromotionById(int id) {
        String sql = "SELECT [id]\n"
                + "      ,[title]\n"
                + "      ,[description]\n"
                + "      ,[timeStart]\n"
                + "      ,[timeEnd]\n"
                + "      ,[content]\n"
                + "      ,[image]\n"
                + "      ,[isHeader]\n"
                + "      ,[staff]\n"
                + "      ,[createDate]\n"
                + "  FROM [dbo].[Promotion] where id = ?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Promotion p = new Promotion();
                p.setId(id);
                p.setTitle(rs.getString("title"));
                p.setDescription(rs.getString("description"));
                p.setContent(rs.getString("content"));
                p.setImage(rs.getString("image"));
                p.setTimeStart(rs.getDate("timeStart"));
                p.setTimeEnd(rs.getDate("timeEnd"));
                p.setIsHeader(rs.getBoolean("isHeader"));

                UserDAO udb = new UserDAO();
                User u = udb.getUserById(rs.getInt("staff"));
                p.setStaff(u);

                p.setCreateDate(rs.getDate("createDate"));
                return p;
            }

        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public Promotion getPromotionByIsHeader(boolean isHeader) {
        String sql = "SELECT [id]\n"
                + "      ,[title]\n"
                + "      ,[description]\n"
                + "      ,[timeStart]\n"
                + "      ,[timeEnd]\n"
                + "      ,[content]\n"
                + "      ,[image]\n"
                + "      ,[isHeader]\n"
                + "      ,[staff]\n"
                + "      ,[createDate]\n"
                + "  FROM [dbo].[Promotion] where isHeader = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setBoolean(1, isHeader);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Promotion p = new Promotion();
                p.setId(rs.getInt("id"));
                p.setTitle(rs.getString("title"));
                p.setDescription(rs.getString("description"));
                p.setContent(rs.getString("content"));
                p.setImage(rs.getString("image"));
                p.setTimeStart(rs.getDate("timeStart"));
                p.setTimeEnd(rs.getDate("timeEnd"));
                p.setIsHeader(rs.getBoolean("isHeader"));

                UserDAO udb = new UserDAO();
                User u = udb.getUserById(rs.getInt("staff"));
                p.setStaff(u);

                p.setCreateDate(rs.getDate("createDate"));

                return p;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public static void main(String[] args) {
        try {
            PromotionDAO pdb = new PromotionDAO();
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");

            java.util.Date timeStartUtil = dateFormat.parse("2024-06-05");
            java.util.Date timeEndUtil = dateFormat.parse("2024-06-05");

            java.sql.Date timeStart = new java.sql.Date(timeStartUtil.getTime());
            java.sql.Date timeEnd = new java.sql.Date(timeEndUtil.getTime());

            pdb.setIsHeaderToFalse();
            System.out.println(pdb.addPromotion("heello", "hllo", timeStart, timeEnd, "Khuyen mai", true, "afsfsafsasfs", 1));
        } catch (ParseException ex) {
            Logger.getLogger(PromotionDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

    }
}
