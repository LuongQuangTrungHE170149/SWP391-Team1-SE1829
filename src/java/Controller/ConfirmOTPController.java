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
import utils.EmailHelper;

/**
 *
 * @author trand
 */
@WebServlet(name = "ConfirmOTPController", urlPatterns = {"/confirmOTP"})
public class ConfirmOTPController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        User u = (User) req.getSession().getAttribute("userRegister");
        if (u != null) {
            String OTPCode = EmailHelper.generateOTP();
            req.setAttribute("OTPCode", OTPCode);

            req.getRequestDispatcher("confirmOTP.jsp").forward(req, resp);

            String bodyEmailOTP = "Your veriftication code is: " + OTPCode;
            EmailHelper.sendEmail(u.getEmail(), EmailHelper.TITLE_PROJECT, bodyEmailOTP);
        }

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String OTPCode = req.getParameter("OTPCode");
        String ConfirmOTPCode = req.getParameter("ConfirmOTPCode");
        System.out.println(OTPCode);
        System.out.println(ConfirmOTPCode);

        if (OTPCode.equals(ConfirmOTPCode)) {
            User u = (User) req.getSession().getAttribute("userRegister");
            UserDAO udb = new UserDAO();
            System.out.println(udb.insert(u));
            req.getSession().removeAttribute("userRegister");
            req.getRequestDispatcher("confirmOTP.jsp").forward(req, resp);
        } else {
            req.setAttribute("error", "Mã OTP không chính xác!");
            req.getRequestDispatcher("confirmOTP.jsp").forward(req, resp);
        }

    }

}
