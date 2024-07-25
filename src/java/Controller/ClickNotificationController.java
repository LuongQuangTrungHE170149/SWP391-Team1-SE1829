/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controller;

import Model.Notification;
import Model.User;
import dal.NotificationDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

/**
 *
 * @author trand
 */
@WebServlet(name = "ClickNotificationController", urlPatterns = {"/clickNotification"})
public class ClickNotificationController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        NotificationDAO dbNotification = new NotificationDAO();
        HttpSession session = req.getSession();
        User user = (User) session.getAttribute("user");
        List<Notification> notifications = dbNotification.findLast7NotifcationsByUserId(user.getId());
        for (Notification notify : notifications) {
            if (notify.isIsClick() == false) {
                dbNotification.updateClick(notify);
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    }

}
