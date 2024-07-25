/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controller;

import Model.Notification;
import Model.User;
import dal.NotificationDAO;
import dal.UserDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import utils.EmailHelper;

/**
 *
 * @author trand
 */
@WebServlet(name = "ConfirmOTPController", urlPatterns = {"/confirmOTP"})
public class ConfirmOTPController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("confirmOTP.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String OTPCode = (String) req.getSession().getAttribute("OTP");
        String ConfirmOTPCode = req.getParameter("ConfirmOTPCode");
        System.out.println("otp: " + OTPCode);
        System.out.println("confirm: " + ConfirmOTPCode);

        if (OTPCode.equals(ConfirmOTPCode)) {
            String op = (String) req.getSession().getAttribute("op");
            System.out.println(op);
            User u = (User) req.getSession().getAttribute("userRegister");
            UserDAO udb = new UserDAO();
            req.getSession().removeAttribute("OTP");
            if ("change-password".equals(op)) {
                resp.sendRedirect("changePassword");
            } else if ("register".equals(op)) {
                System.out.println(udb.insert(u));
                System.out.println(u);
                User userRegis = udb.findByUsername(u.getUsername());
                Notification model = new Notification();
                model.setTitle("Chào mừng tới");
                model.setIsClick(false);
                model.setLink("");
                model.setUserId(userRegis);
                NotificationDAO dbNotify = new NotificationDAO();
                dbNotify.insert(model);
                resp.sendRedirect("login");
            }

        } else {
            req.setAttribute("error", "Mã OTP không chính xác!");
            req.getRequestDispatcher("confirmOTP.jsp").forward(req, resp);
        }

    }

}
