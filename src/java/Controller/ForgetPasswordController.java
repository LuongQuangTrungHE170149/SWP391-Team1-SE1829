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
import java.util.regex.Pattern;
import utils.EmailHelper;

/**
 *
 * @author trand
 */
@WebServlet(name = "ForgetPasswordController", urlPatterns = {"/forgetPassword"})
public class ForgetPasswordController extends HttpServlet {

    // Pattern to validate email address
    private static final Pattern EMAIL_PATTERN = Pattern.compile(
            "^[A-Z0-9._%+-]+@[A-Z0-9.-]+\\.[A-Z]{2,6}$",
            Pattern.CASE_INSENSITIVE
    );

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("forgetPassword.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String email = req.getParameter("usernameEmail");
        UserDAO dbUser = new UserDAO();
        User user = dbUser.findByUsernameOrEmail(email);
        if (user == null) {
            req.setAttribute("message", "Your account is not found");
            req.getRequestDispatcher("forgetPassword.jsp").forward(req, resp);
        } else {
            String OTPCode = EmailHelper.generateOTP();
//            String bodyEmailOTP = "Your veriftication code is: " + OTPCode;
//            req.getSession().setAttribute("OTP", OTPCode);
            req.getSession().setAttribute("userRegister", user);
            req.getSession().setAttribute("op", "change-password");
//            EmailHelper.sendEmail(user.getEmail(), EmailHelper.TITLE_PROJECT, bodyEmailOTP);
           resp.sendRedirect("confirmOTP");
        }
    }

    private boolean isValidEmail(String email) {
        return EMAIL_PATTERN.matcher(email).find();
    }
}