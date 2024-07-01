/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import Model.News;
import Model.User;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

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

    public List<News> getAll() {
        List<News> list = new ArrayList<>();
        String sql = "SELECT [id]\n"
                + "      ,[title]\n"
                + "      ,[description]\n"
                + "      ,[content]\n"
                + "      ,[image]\n"
                + "      ,[isHeader]\n"
                + "      ,[staff]\n"
                + "      ,[type]\n"
                + "      ,[createDate]\n"
                + "  FROM [dbo].[News] order by createDate DESC";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                News p = new News();
                p.setId(rs.getInt("id"));
                p.setDescription(rs.getString("description"));
                p.setTitle(rs.getString("title"));
                p.setContent(rs.getString("content"));
                p.setType(rs.getString("type"));
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

    public List<News> getTop3LatestNews() {
        List<News> list = new ArrayList<>();
        String sql = "SELECT Top(3) [id]\n"
                + "      ,[title]\n"
                + "      ,[description]\n"
                + "      ,[content]\n"
                + "      ,[image]\n"
                + "      ,[isHeader]\n"
                + "      ,[staff]\n"
                + "      ,[type]\n"
                + "      ,[createDate]\n"
                + "  FROM [dbo].[News] order by createDate DESC";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                News p = new News();
                p.setId(rs.getInt("id"));
                p.setDescription(rs.getString("description"));
                p.setTitle(rs.getString("title"));
                p.setContent(rs.getString("content"));
                p.setType(rs.getString("type"));
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
    
    public News getNewsByIsHeader() {
        String sql = "SELECT [id]\n"
                + "      ,[title]\n"
                + "      ,[description]\n"
                + "      ,[content]\n"
                + "      ,[image]\n"
                + "      ,[isHeader]\n"
                + "      ,[staff]\n"
                + "      ,[type]\n"
                + "      ,[createDate]\n"
                + "  FROM [dbo].[News] where isHeader = 1";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                News p = new News();
                p.setId(rs.getInt("id"));
                p.setTitle(rs.getString("title"));
                p.setDescription(rs.getString("description"));
                p.setContent(rs.getString("content"));
                p.setImage(rs.getString("image"));
                p.setType(rs.getString("type"));
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

    public News getNewsById(int id) {
        String sql = "SELECT [id]\n"
                + "      ,[title]\n"
                + "      ,[description]\n"
                + "      ,[content]\n"
                + "      ,[image]\n"
                + "      ,[isHeader]\n"
                + "      ,[staff]\n"
                + "      ,[type]\n"
                + "      ,[createDate]\n"
                + "  FROM [dbo].[News] where id = ?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                News p = new News();
                p.setId(rs.getInt("id"));
                p.setDescription(rs.getString("description"));
                p.setTitle(rs.getString("title"));
                p.setContent(rs.getString("content"));
                p.setType(rs.getString("type"));
                p.setIsHeader(rs.getBoolean("isHeader"));
                p.setImage(rs.getString("image"));

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

    public List<News> getHeader() {
        List<News> list = new ArrayList<>();
        String sql = "SELECT [id]\n"
                + "      ,[title]\n"
                + "      ,[description]\n"
                + "      ,[content]\n"
                + "      ,[image]\n"
                + "      ,[isHeader]\n"
                + "      ,[staff]\n"
                + "      ,[type]\n"
                + "      ,[createDate]\n"
                + "  FROM [dbo].[News] where isHeader = 1";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                News p = new News();
                p.setId(rs.getInt("id"));
                p.setTitle(rs.getString("title"));
                p.setDescription(rs.getString("description"));
                p.setContent(rs.getString("content"));
                p.setImage(rs.getString("image"));
                p.setIsHeader(rs.getBoolean("isHeader"));

                UserDAO udb = new UserDAO();
                User u = udb.getUserById(rs.getInt("staff"));
                p.setStaff(u);

                p.setType(rs.getString("type"));

                p.setCreateDate(rs.getDate("createDate"));

                list.add(p);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<News> searchNews(String searchValue, String staff) {
        List<News> list = new ArrayList<>();
        StringBuilder sql = new StringBuilder("SELECT [id]\n"
                + "      ,[title]\n"
                + "      ,[description]\n"
                + "      ,[content]\n"
                + "      ,[isHeader]\n"
                + "      ,[image]\n"
                + "      ,[staff]\n"
                + "      ,[type]\n"
                + "      ,[createDate]\n"
                + "  FROM [dbo].[News] where 1=1");
        if (staff != null && !staff.isEmpty()) {
            sql.append(" AND [staff] = ?");
        }
        if (searchValue != null && !searchValue.isEmpty()) {
            sql.append(" AND ([title] LIKE ? OR [description] LIKE ? OR [content] LIKE ?)");
        }
        //
        sql.append(" Order by createDate DESC");
        try {
            int index = 1;
            PreparedStatement st = connection.prepareStatement(sql.toString());
            if (staff != null && !staff.isEmpty()) {
                st.setInt(index++, Integer.parseInt(staff));
            }
            if (searchValue != null && !searchValue.isEmpty()) {
                String search = "%" + searchValue + "%";
                st.setString(index++, search);
                st.setString(index++, search);
                st.setString(index++, search);
            }
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                News p = new News();
                p.setId(rs.getInt("id"));
                p.setDescription(rs.getString("description"));
                p.setTitle(rs.getString("title"));
                p.setContent(rs.getString("content"));
                p.setIsHeader(rs.getBoolean("isHeader"));
                p.setImage(rs.getString("image"));

                UserDAO udb = new UserDAO();
                User u = udb.getUserById(rs.getInt("staff"));
                p.setStaff(u);

                p.setType(rs.getString("type"));

                p.setCreateDate(rs.getDate("createDate"));

                list.add(p);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Object[]> listStaffAddNews() {
        List<Object[]> list = new ArrayList<>();
        String sql = "SELECT \n"
                + "    p.staff AS id,\n"
                + "    u.username AS username,\n"
                + "    COUNT(p.id) AS newsCount\n"
                + "FROM \n"
                + "    News p\n"
                + "INNER JOIN \n"
                + "    [Users] u ON p.staff = u.id\n"
                + "GROUP BY \n"
                + "    p.staff, u.username;";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String username = rs.getString("username");
                int newsCount = rs.getInt("newsCount");

                Object[] obj = new Object[]{id, username, newsCount};
                list.add(obj);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
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


    public boolean updateNewsById(int id, String title, String description, String content, String type, String image, Boolean isHeader, int staff) {
        String sql = "UPDATE [dbo].[News]\n"
                + "   SET [title] = ?\n"
                + "      ,[description] = ?\n"
                + "      ,[content] = ?\n"
                + "      ,[type] = ?\n"
                + "      ,[image] = ?\n"
                + "      ,[isHeader] = ?\n"
                + "      ,[staff] = ?\n"
                + "      \n"
                + " WHERE id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, title);
            st.setString(2, description);
            st.setString(3, content);
            st.setString(4, type);
            st.setString(5, image);
            st.setBoolean(6, isHeader);
            st.setInt(7, staff);
            st.setInt(8, id);
            st.executeUpdate();

            return true;
        } catch (SQLException e) {
            System.out.println(e);
        }
        return false;
    }

    public boolean deleteNewsById(int id) {
        String sql = "DELETE FROM [dbo].[News]\n"
                + "      WHERE id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            st.executeUpdate();
            return true;
        } catch (SQLException e) {
            System.out.println(e);
        }
        return false;
    }
    
    public static void main(String[] args) {
        NewsDAO ndb = new NewsDAO();
        System.out.println(ndb.getAll().size());
    }
}
