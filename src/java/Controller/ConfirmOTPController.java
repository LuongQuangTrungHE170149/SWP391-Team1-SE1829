/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controller;

import Model.User;
import dal.UserDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

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
        String otpParam = req.getParameter("otp");
        String otpCode = (String) req.getSession().getAttribute("OTP");
        System.out.println(otpCode);
        User userRegister = (User) req.getSession().getAttribute("userRegister");
        System.out.println(userRegister);
        User userForgetPassword = (User) req.getSession().getAttribute("userForgetPassword");
        UserDAO dbUser = new UserDAO();
        if (userRegister != null) {
            if (otpCode.equals(otpParam)) {
                dbUser.insert(userRegister);
                req.setAttribute("message", "Register successfully!");
                req.getRequestDispatcher("login.jsp").forward(req, resp);
            }
        } else if (userForgetPassword != null) {
            if (otpCode.equals(otpParam)) {
                req.getRequestDispatcher("changePassword.jsp").forward(req, resp);
            }
        } else {
            req.getRequestDispatcher("confirmOTP.jsp").forward(req, resp);
        }

    }

}
