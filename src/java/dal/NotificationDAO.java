/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import Model.Notification;
import Model.User;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 *
 * @author trand
 */
public class NotificationDAO extends DBContext {

    public List<Notification> findByUserId(int userId) {
        List<Notification> list = new ArrayList<>();
        String sql = "select * from Notifications where userId = ? order by createdDate desc";

        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(toNotification(rs));
            }

        } catch (SQLException e) {
            System.out.println(e);
        }

        return list;
    }

    public List<Notification> findLast7NotifcationsByUserId(int userId) {
        List<Notification> list = new ArrayList<>();
        String sql = "select top 7 * from Notifications where userId = ? order by isClick asc, createdDate desc";

        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(toNotification(rs));
            }

        } catch (SQLException e) {
            System.out.println(e);
        }

        return list;
    }

    public void insert(Notification model) {
        String sql = "insert into Notifications([title], [link], [isClick], [userId], createdDate) values (?,?,?,?,?)";

        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            int param = 1;
            ps.setString(param++, model.getTitle());
            ps.setString(param++, model.getLink());
            ps.setBoolean(param++, model.isIsClick());
            ps.setInt(param++, model.getUserId().getId());
            java.util.Date today = new java.util.Date();

            java.sql.Date sqlDate = new java.sql.Date(today.getTime());

            ps.setDate(param++, sqlDate);
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void updateClick(Notification model) {
        String sql = "update Notifications set [isClick] = 1 where id = ?";

        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            int param = 1;
            ps.setInt(param++, model.getId());
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    private Notification toNotification(ResultSet rs) throws SQLException {
        Notification notification = new Notification();
        notification.setId(rs.getInt("id"));
        notification.setTitle(rs.getString("title"));
        notification.setLink(rs.getString("link"));
        notification.setIsClick(rs.getBoolean("isClick"));
        notification.setCreatedDate(rs.getTimestamp("createdDate"));
        return notification;
    }
}
